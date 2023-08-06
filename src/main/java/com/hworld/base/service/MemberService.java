package com.hworld.base.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hworld.base.dao.MemberDAO;
import com.hworld.base.util.SHA256Util;
import com.hworld.base.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	//회원 확인
	public Map<String, Object> getPrecheck(MemberVO memberVO) throws Exception{
		//회원 확인 로직 - 이름, 주민번호로 조회, 4가지 경우의 수 발생
		//* 주민번호 또는 이름이 일치하지 않는 경우
		//1. 주민번호가 일치하지 않음 : 신청서를 낸적 없는 회원. 회선 가입정보 없음. 홈페이지만 회원 가입하려는 회원
		//2. 주민번호는 일치하지만 이름이 일치하지 않는 경우 : 일치하는 회원정보가 없다고 표시
		
		//* 주민번호와 이름 모두 일치하는 경우
		//3. id/pw가 null인 경우 : 신청서를 낸적 있는 회원. 회선 가입정보 있음. 기존에 입력된 정보 보여주고 id/pw 입력받기
		//4. id/pw가 null이 아닌 경우 : 홈페이지에 가입한적 있는 기존 회원. 가입된 회원정보가 있으니 찾기페이지로 넘겨주기?
		
		//로직 시행
		//리턴할 Map 준비
		Map<String, Object> result = new HashMap<>();
		
		//입력받은 rrnl을 암호화 하고 db 정보와 비교
		String RRN = memberVO.getRrnf()+"-"+memberVO.getRrnl();
	    memberVO.setRrnl(SHA256Util.encryptMD5(RRN));
		
		//주민번호가 일치하는 회원 가져오기
		MemberVO checkRRN = memberDAO.getIdentifybyRRN(memberVO);
		//주민번호와 이름이 일치하는 회원 가져오기
		MemberVO checkName = memberDAO.getIdentifybyName(memberVO);
		//주민번호와 이름이 일치하는 회원 정보의 memberNum으로 회원의 모든 정보 가져오기(checkName에 memberNum 포함)
		MemberVO data = memberDAO.getMemberDetail(checkName);
		
		//로직
		//주민번호 체크
		if(checkRRN != null) { //주민번호 일치
			//이름체크
			if(checkName != null) { //이름 일치
				//email(id),pw 체크
				if(checkName.getEmail() == null || checkName.getPw() == null) { //id/pw가 null인 경우(state=3)
					result.put("state", 3);
					result.put("account", data);
					return result;
					
				}else { //id/pw가 null이 아닌 경우(state=4)
					result.put("state", 4);
					result.put("account", data);
					return result;
				}
			}else { //주민번호는 일치하지만 이름이 일치하지 않는 경우(state=2)
				result.put("state", 2);
				result.put("account", checkRRN);
				return result;
			}
		}else { //주민번호가 일치하지 않음(state=1)
			result.put("state", 1);
			return result;
		}
		
	}
	
	public int setMemberAdd(MemberVO memberVO, Integer opt1, Integer opt2) throws Exception {
		//pw 암호화
		String rawPw = ""; // 인코딩 전 비밀번호
		String encodePw = ""; // 인코딩 후 비밀번호
		
		rawPw = memberVO.getPw(); // 비밀번호 데이터 얻음
		encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩 - 이렇게 인코딩된 번호는 찾을 수 없다.(같은 값을 넣어도 암호화된 시점에 따라 값이 일치하지 않는거같음)
		memberVO.setPw(encodePw); // 인코딩 된 비밀번호 member 객체에 다시 저장
		
		
	    int result = 0;
	    
	  //opt2 = memberNum값
	    if(opt1 == 3 && opt2 != null) {
	    	//회선X - 기존정보에 업데이트
	    	memberVO.setMemberNum(opt2);
	    	result = memberDAO.setMemberInitUpdate(memberVO);
	    }else {
	    	//회선O - 신규가입
	    	//rrnl을 RRN 전체로 암호화
	    	String RRN = memberVO.getRrnf()+"-"+memberVO.getRrnl();
	    	memberVO.setRrnl(SHA256Util.encryptMD5(RRN));
	    	
			result = memberDAO.setMemberAdd(memberVO);
	    }
		
		return result;
	}
	
	
	//아이디 찾기
	public MemberVO getSearchId(MemberVO memberVO) throws Exception{
		
		//rrnl 암호화
		String RRN = memberVO.getRrnf()+"-"+memberVO.getRrnl();
		memberVO.setRrnl(SHA256Util.encryptMD5(RRN));
		
		MemberVO data = memberDAO.getSearchId(memberVO);
		
		return data;
	}
	
	
	
	
	
	
	/* 이메일 중복 체크 */
	public int emailCheck(String email) throws Exception {
		return memberDAO.emailCheck(email);
	}
	
//	public MemberVO emailCheck(MemberVO memberVO) throws Exception {
//		return memberDAO.emailCheck(memberVO);
//	}
	
	public int memberPwCheck(MemberVO memberVO) throws Exception {
		return memberDAO.memberPwCheck(memberVO);
	}
	
	public void passwordUpdate(MemberVO memberVO) throws Exception {
		memberDAO.passwordUpdate(memberVO);
	}
	
	public MemberVO getMemberLogin(MemberVO memberVO) throws Exception {
		return memberDAO.getMemberLogin(memberVO);
	}
	
	public void loginDate(MemberVO memberVO) throws Exception {
		memberDAO.loginDate(memberVO);
	}
	
	public int getMemberLogout(MemberVO memberVO) throws Exception {
		return memberDAO.getMemberLogout(memberVO);
	}
	
//	public MemberVO emailSearch(MemberVO memberVO) throws Exception {
//		return memberDAO.emailSearch(memberVO);
//	}
}
