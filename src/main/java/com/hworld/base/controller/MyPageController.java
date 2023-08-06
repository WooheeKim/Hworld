package com.hworld.base.controller;


import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hworld.base.service.MyPageService;
import com.hworld.base.util.Pager;
import com.hworld.base.vo.BillVO;
import com.hworld.base.vo.MemberVO;
import com.hworld.base.vo.TelephoneVO;

import lombok.extern.slf4j.Slf4j;



@Controller
@Slf4j
@RequestMapping("/myPage/*")
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	
	
	//마이 페이지 홈
	//필요한 정보들을 미리 다 뿌려둬야 jsp에서 사용가능할듯 함
	@GetMapping("home")
	public ModelAndView myPage(Pager pager, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//기능
		////요금 청구/납부 - 납부내역, 미납내역, 대표회선정보를 나타내야함
		//납부/미납 리스트
		//List<BillVO> billList = myPageService.getPMDList(pager, session);
		List<TelephoneVO> TPList = myPageService.getTPList(pager, session);
		
		//대표회선 정보
		Map<String, Object> kingTP = myPageService.getKingDetail(session);
		
		////가입 정보
		
		////회선 관리
		
		////주문 내역
		
		////문의 내역
		
		////구매 후기
		
		////회원 탈퇴
		
		//정보 담기
		//mv.addObject("billList", billList);
		mv.addObject("TPList", TPList);
		mv.addObject("kingTP", kingTP);
		
		mv.setViewName("hworld/myPage");
		return mv;
	}
	
	
	//요금 청구/납부 - 즉시 납부 페이지(납부 영수증 표시), 결제API 호출
	@GetMapping("instantPay")
	public ModelAndView setPaymentAdd(Pager pager, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<TelephoneVO> TPList = myPageService.getTPList(pager, session);
		Map<String, Object> kingTP = myPageService.getKingDetail(session);
		
		for (TelephoneVO telephoneVO : TPList) {
			for (BillVO billVO : telephoneVO.getBillVOs()) {
				log.error(" :::::::::::::::: ePlanPrice : {} ", billVO.getEPlanPrice());
				
			}
		}
		
		mv.addObject("TPList", TPList);
		mv.addObject("kingTP", kingTP);
		mv.setViewName("hworld/invoiceInstantly");
		return mv;
	}
	
	
	//납부 전체 보기 페이지
	@PostMapping("instantPay")
	public ModelAndView setPaymentAdd(HttpSession session, @RequestParam("billNum") String[] billNums) throws Exception{
		//납부 후 해당 billVO에 paidCheck = 1, paidDate = now()로 업데이트 하기
		//처리 후 미납 영역에서 안보이는지도 확인
		ModelAndView mv = new ModelAndView();
		
//		for (String stringbillNum : billNums) {
//			BillVO billVO = new BillVO();
//			Integer billNum = Integer.parseInt(stringbillNum);
//			billVO.setBillNum(billNum);
//			
//		}
		
		//원래는 여기서 결제테이블에 insert 하고 billUpdate까지 service에서 하기
		//setPaymentAdd
		
		//setBillUpdate
		int result = myPageService.setBillUpdate(billNums);
		
		mv.setViewName("redirect:./home");
		return mv;
	}
	
	
	
	
	//비밀번호 변경 - db 입력
	@PostMapping("updatePw")
	public ModelAndView setPasswordUpdate(MemberVO memberVO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = myPageService.setPasswordUpdate(memberVO, session);
		
		mv.setViewName("redirect:./home");
		return mv;
	}
		
	
	//정보 변경 - db 입력
	@PostMapping("updateInfo")
	public ModelAndView setMemberUpdate(MemberVO memberVO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = myPageService.setMemberUpdate(memberVO, session);

		mv.setViewName("redirect:./home");
		return mv;
	}
	
	
	//isChangeableNum
	@ResponseBody
	@GetMapping("isChangeableNum")
	public boolean isChangeableNum(String phoneNum) throws Exception{
		return myPageService.isChangeableNum(phoneNum);
	}
	
	
}
