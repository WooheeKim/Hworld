package com.hworld.base.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.hworld.base.dao.MyPageDAO;
import com.hworld.base.util.Pager;
import com.hworld.base.vo.BillVO;
import com.hworld.base.vo.MemberVO;
import com.hworld.base.vo.TelephoneVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MyPageService {
	
	@Autowired
	private MyPageDAO myPageDAO;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	//납부, 미납내역 출력하기
//	public List<BillVO> getPMDList(Pager pager, HttpSession session) throws Exception{
//		
//		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
//		pager.setMemberNum(memberVO.getMemberNum());
//		
//		Long totalCount = myPageDAO.getTotalBill(pager);
//		pager.makeNum(totalCount);
//		pager.makeStartRow();
//		
//		
//		return myPageDAO.getPMDList(pager);
//	}
	
	//telephoneVO 기반 납부, 미납내역 출력하기
	public List<TelephoneVO> getTPList(Pager pager, HttpSession session) throws Exception{
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		pager.setMemberNum(memberVO.getMemberNum());
		
		Long totalCount = myPageDAO.getTotalBill(pager);
		pager.makeNum(totalCount);
		pager.makeStartRow();
		
		return myPageDAO.getTPList(pager);
	}
	
	
	//회원의 대표 회선 정보 가져오기
	public Map<String, Object> getKingDetail(HttpSession session) throws Exception{
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		
		return myPageDAO.getKingDetail(memberVO);
	}
	
	
	//회원 비밀번호 변경
	public int setPasswordUpdate(MemberVO memberVO, HttpSession session) throws Exception{
		
		//세션으로부터 memberNum 받아서 memberVO에 저장
		MemberVO mem = (MemberVO)session.getAttribute("memberVO");
		//memberVO에 memberNum 입력
		memberVO.setMemberNum(mem.getMemberNum());
		
		//비밀번호 암호화 후 memberVO에 저장
		String rawNpw = memberVO.getPw();
		String encodeNpw = pwEncoder.encode(rawNpw);
		memberVO.setPw(encodeNpw);
		
		//저장된 memberVO로 업데이트 실행
		int result = myPageDAO.setPasswordUpdate(memberVO);
		
		return result;
	}
	
	
	//회원 정보 변경
	public int setMemberUpdate(MemberVO memberVO, HttpSession session) throws Exception{
		
		//세션으로부터 memberNum 받아서 memberVO에 저장
		MemberVO mem = (MemberVO)session.getAttribute("memberVO");
		//memberVO에 memberNum 입력
		memberVO.setMemberNum(mem.getMemberNum());
		
		//저장된 memberVO로 업데이트 실행
		int result = myPageDAO.setMemberUpdate(memberVO);
		
		//업데이트 된 정보로 세션 업데이트
		memberVO = myPageDAO.getNewSession(memberVO);
		session.setAttribute("memberVO", memberVO);
		
		return result;
	}
	
	
	//미납금 납부 후 bill 업데이트
	public int setBillUpdate(@RequestParam("billNum") String[] billNums) throws Exception{
		
//		for (String string : billNums) {
//			log.error(" :::::::::::::::::::: billnum : {}", string);
//		}
		
		int result = 0;
		
		//billNum 숫자만큼 업데이트
		for (String stringbillNum : billNums) {
			BillVO billVO = new BillVO();
			Integer billNum = Integer.parseInt(stringbillNum);
			billVO.setBillNum(billNum);
			result = myPageDAO.setBillUpdate(billVO);
		}
		
		return result;
	}
	
	
	//isChangeableNum
	public boolean isChangeableNum(String phoneNum) throws Exception{
		//자회사 검증때 조회됨 : 자회사에 회선있음
		//자회사 검증때 조회x + 타회사 검증때 조회됨 : 타회사에 회선 있음
		//자, 타회사 검증때 조회x : 모두 회선 없음
		
		boolean check = false;
		
		//자회사 검증
		String result = myPageDAO.isChangeableNum(phoneNum);
		if(result != null) {
			//자회사 회선있음
			check = true;
			return check;
		}
		log.info(" :::::::::::::::::::: service check value 자회사 : {} ", check);
		
		//타회사 검증
		result = myPageDAO.isChangeableNumOT(phoneNum);
		if(result != null) {
			//타회사 회선있음
			check = true;
			return check;
		}
		log.info(" :::::::::::::::::::: service check value 타회사 : {} ", check);
		
		
		return check;
	}
	
}
