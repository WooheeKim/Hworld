package com.hworld.base.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hworld.base.service.AdminService;
import com.hworld.base.util.Pager;
import com.hworld.base.vo.ApplicationVO;
import com.hworld.base.vo.BillVO;
import com.hworld.base.vo.DirectVO;
import com.hworld.base.vo.MemberVO;
import com.hworld.base.vo.OrderVO;
import com.hworld.base.vo.QnaVO;
import com.hworld.base.vo.ReviewVO;
import com.hworld.base.vo.TelephoneVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	// 관리자 홈
	@GetMapping("home")
	public ModelAndView home() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/home");
		return modelAndView;
	}
	
	// 회원 - 회원 목록
	@GetMapping("memberList")
	public ModelAndView memberList(Pager pager) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		List<MemberVO> memberList = adminService.memberList(pager);
		modelAndView.addObject("memberList", memberList);
		modelAndView.setViewName("admin/memberList");
		return modelAndView;
	}
	
	// 회원 - 회선 목록
	@GetMapping("phoneList")
	public ModelAndView phoneList(Pager pager) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		List<MemberVO> phoneList = adminService.phoneList(pager);
		modelAndView.addObject("phoneList", phoneList);
		modelAndView.setViewName("admin/phoneList");
		return modelAndView;
	}	
	
	// 주문 목록
	@GetMapping("orderList")
	public ModelAndView orderList(Pager pager) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		List<OrderVO> orderList = adminService.orderList(pager);
		modelAndView.addObject("orderList", orderList);
		modelAndView.setViewName("admin/orderList");
		return modelAndView;
	}
	
	// 주문 상세 페이지
	@GetMapping("orderDetail")
	public ModelAndView orderDetail(OrderVO orderVO) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		List<OrderVO> orderDetail = adminService.orderDetail(orderVO);
		modelAndView.addObject("orderDetail", orderDetail);
		modelAndView.setViewName("admin/orderDetail");
		return modelAndView;
	}
	
	// 상품 - 상품 목록
	@GetMapping("productList")
	public ModelAndView productList(Pager pager) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		List<DirectVO> productList = adminService.productList(pager);
		modelAndView.addObject("productList", productList);
		modelAndView.setViewName("admin/productList");
		return modelAndView;
	}
	
	// 상품 - 상품 리뷰
	@GetMapping("productReview")
	public ModelAndView productReview(Pager pager) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		List<ReviewVO> productReview = adminService.productReview(pager);
		modelAndView.addObject("productReview", productReview);
		modelAndView.setViewName("admin/productReview");
		return modelAndView;
	}
	
	// 문의 - 상품 문의
	@GetMapping("productInquiry")
	public ModelAndView productInquiry(Pager pager) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		List<QnaVO> productInquiry = adminService.productInquiry(pager);
		modelAndView.addObject("productInquiry", productInquiry);
		modelAndView.setViewName("admin/productInquiry");
		return modelAndView;
	}
	
	// 문의 - 상품 문의 상세 페이지
	@GetMapping("productInquiryDetail")
	public ModelAndView productInquiryDetail(QnaVO qnaVO) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		List<QnaVO> productInquiryDetail = adminService.productInquiryDetail(qnaVO);
		modelAndView.addObject("productInquiryDetail", productInquiryDetail);
		modelAndView.setViewName("admin/productInquiryDetail");
		return modelAndView;
	}
	
	// 일반 문의 상세 페이지 - 답변 Update
	@PostMapping("productInquiry")
	public ModelAndView productInquiryReply(QnaVO qnaVO) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		
		int result = adminService.productInquiryReply(qnaVO);		
		
		modelAndView.setViewName("redirect:./productInquiry");
				
		return modelAndView;
	}
	
	// 문의 - 일반 문의
	@GetMapping("generalInquiry")
	public ModelAndView generalInquiry(Pager pager) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		List<QnaVO> generalInquiry = adminService.generalInquiry(pager);
		modelAndView.addObject("generalInquiry", generalInquiry);
		modelAndView.setViewName("admin/generalInquiry");
		return modelAndView;
	}
	
	// 문의 - 일반 문의 상세 페이지
	@GetMapping("generalInquiryDetail")
	public ModelAndView generalInquiryDetail(QnaVO qnaVO) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		List<QnaVO> generalInquiryDetail = adminService.generalInquiryDetail(qnaVO);
		modelAndView.addObject("generalInquiryDetail", generalInquiryDetail);
		modelAndView.setViewName("admin/generalInquiryDetail");
		return modelAndView;
	}
	
	// 일반 문의 상세 페이지 - 답변 Update
	@PostMapping("generalInquiry")
	public ModelAndView generalInquiryReply(QnaVO qnaVO) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		
		int result = adminService.generalInquiryReply(qnaVO);		
		
		modelAndView.setViewName("redirect:./generalInquiry");
				
		return modelAndView;
	}
	
	// 납부 - 납부 목록
	@GetMapping("paymentList")
	public ModelAndView paymentList(Pager pager) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		List<BillVO> paymentList = adminService.paymentList(pager);
		modelAndView.addObject("paymentList", paymentList);
		modelAndView.setViewName("admin/paymentList");
		return modelAndView;
	}
	
	// 납부 - 납부 상세 페이지
	@GetMapping("paymentDetail")
	public ModelAndView paymentDetail() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/paymentDetail");
		return modelAndView;
	}
	
	// 납부 - 미납 목록
	@GetMapping("unpaidList")
	public ModelAndView unpaidList(Pager pager) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		List<BillVO> unpaidList = adminService.unpaidList(pager);
		modelAndView.addObject("unpaidList", unpaidList);
		modelAndView.setViewName("admin/unpaidList");
		return modelAndView;
	}
	/*
	 * private String getIp(HttpServletRequest request) {
	 * 
	 * String ip = request.getHeader("X-Forwarded-For");
	 * 
	 * log.info(">>>> X-FORWARDED-FOR : " + ip);
	 * 
	 * if (ip == null) { ip = request.getHeader("Proxy-Client-IP");
	 * log.info(">>>> Proxy-Client-IP : " + ip); } if (ip == null) { ip =
	 * request.getHeader("WL-Proxy-Client-IP"); // 웹로직
	 * log.info(">>>> WL-Proxy-Client-IP : " + ip); } if (ip == null) { ip =
	 * request.getHeader("HTTP_CLIENT_IP"); log.info(">>>> HTTP_CLIENT_IP : " + ip);
	 * } if (ip == null) { ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	 * log.info(">>>> HTTP_X_FORWARDED_FOR : " + ip); } if (ip == null) { ip =
	 * request.getRemoteAddr(); }
	 * 
	 * log.info(">>>> Result : IP Address : "+ip);
	 * 
	 * return ip;
	 * 
	 * }
	 */
	
}
