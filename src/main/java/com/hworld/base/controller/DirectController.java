package com.hworld.base.controller;

import java.nio.charset.StandardCharsets;
import java.util.stream.Collectors;
import java.sql.Array;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.websocket.server.PathParam;

import org.apache.catalina.util.URLEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hworld.base.service.CartService;
import com.hworld.base.service.DirectService;
import com.hworld.base.service.OrderService;
import com.hworld.base.util.Pager;
import com.hworld.base.vo.ApplicationVO;
import com.hworld.base.vo.DirectVO;
import com.hworld.base.vo.MemberVO;
import com.hworld.base.vo.OrderDirectVO;
import com.hworld.base.vo.OrderVO;
import com.hworld.base.vo.PlanVO;
import com.hworld.base.vo.QnaVO;
import com.hworld.base.vo.ReviewVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/direct/*")
@Slf4j
public class DirectController {
	
	@Autowired
	private DirectService directService;
	@Autowired
	private CartService cartService;
	
	
	// 휴대폰 리스트 페이지
	@GetMapping("phoneList")
	public ModelAndView getList(ModelAndView mv , Pager pager, @RequestParam(value = "sortType", defaultValue = "latest") String sortType) throws Exception{
		
	        // sortType에 따라 정렬 유형 설정
	        if (sortType.equals("priceHigh")) {
	            pager.setSortType("priceHigh");
	        } else if (sortType.equals("priceLow")) {
	        	pager.setSortType("priceLow");
	        } else {
	        	pager.setSortType("latest");
	        }

	        List<DirectVO> ar = directService.getList(pager); 
	        log.error(ar.get(0).getDirectCode());
	        List<PlanVO> existPlanList = directService.getExistPlanList();
		    List<PlanVO> planList = directService.getPlanList();
		    List<PlanVO> gList = new ArrayList<>();
			List<PlanVO> sList = new ArrayList<>();
			List<PlanVO> tList = new ArrayList<>();
			List<PlanVO> zList = new ArrayList<>();
			List<PlanVO> wList = new ArrayList<>();
			List<PlanVO> hList = new ArrayList<>();

		    for (PlanVO plan : planList) {
			    String planNum = plan.getPlanNum();
			    if (planNum.startsWith("G")) {
			        gList.add(plan);
			    } else if (planNum.startsWith("S")) {
			        sList.add(plan);
			    } else if (planNum.startsWith("T")) {
			        tList.add(plan);
			    } else if (planNum.startsWith("Z")) {
			        zList.add(plan);
			    } else if (planNum.startsWith("W")) {
			        wList.add(plan);
			    } else if (planNum.startsWith("H")) {
			        hList.add(plan);
			    }
			}
	        
	        
	        mv.addObject("existList", existPlanList);
			mv.addObject("gList", gList);
			mv.addObject("sList", sList);
			mv.addObject("tList", tList);
			mv.addObject("zList", zList);
			mv.addObject("wList", wList);
			mv.addObject("hList", hList);    
	        
	        
		mv.addObject("list", ar);
		mv.setViewName("hworld/phoneList2");
		
		return mv;
	}
	

	// 휴대폰 상세 페이지
	@GetMapping("phoneDetail")
	public ModelAndView getDetail(String slicedCode, QnaVO qnaVO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		if (memberVO == null || memberVO.getMemberNum() == null) {
	       
			String message="로그인이 필요합니다.";
			
			mv.addObject("url", "/member/login"); 
		    mv.addObject("result", message);
	        mv.setViewName("common/result");
	        return mv;
	    }
		
	    List<DirectVO> ar = directService.getDetail(slicedCode);
	   
	    List<PlanVO> existPlanList = directService.getExistPlanList();
	    List<PlanVO> planList = directService.getPlanList();
	    List<QnaVO> qnaList = directService.getDirectQna(qnaVO); 
	    List<QnaVO> pQna = new ArrayList<>();
		for(QnaVO qna : qnaList) {
			String newCode = qna.getNewCode();
			if(newCode.equals("P01")) {
				pQna.add(qna);
			}
		}
	    List<PlanVO> gList = new ArrayList<>();
		List<PlanVO> sList = new ArrayList<>();
		List<PlanVO> tList = new ArrayList<>();
		List<PlanVO> zList = new ArrayList<>();
		List<PlanVO> wList = new ArrayList<>();
		List<PlanVO> hList = new ArrayList<>();

	    for (PlanVO plan : planList) {
		    String planNum = plan.getPlanNum();
		    if (planNum.startsWith("G")) {
		        gList.add(plan);
		    } else if (planNum.startsWith("S")) {
		        sList.add(plan);
		    } else if (planNum.startsWith("T")) {
		        tList.add(plan);
		    } else if (planNum.startsWith("Z")) {
		        zList.add(plan);
		    } else if (planNum.startsWith("W")) {
		        wList.add(plan);
		    } else if (planNum.startsWith("H")) {
		        hList.add(plan);
		    }
		}
	    
	    List<ReviewVO> reviews = directService.getReview(slicedCode);//slicedCode로 페이징된 리뷰 목록 조회
//	    List<ReviewVO> pReview = new ArrayList<>();
//	    for(ReviewVO review : reviews) {
//	    	String categoryCode = review.getCategoryCode();
//	    	if(categoryCode.equals("00")) {
//	    		pReview.add(review);
//	    	}
//	    }
	    
	 // 세션에서 계산된 값(params)을 가져옴
	    Map<String, Object> monthlyPay = (Map<String, Object>) session.getAttribute("monthlyPay");
	 // monthlyPayParams 사용 예시
	    if (monthlyPay != null) {
	        log.info(" :::::::::::::::::::: {} ", monthlyPay.get("directCode"));
	        log.info(" :::::::::::::::::::: {} ", monthlyPay.get("disKind"));
	        log.info(" :::::::::::::::::::: {} ", monthlyPay.get("planNum"));
	    }
	    mv.addObject("monthlyPay", monthlyPay);
	    
		mv.addObject("existList", existPlanList);
		mv.addObject("gList", gList);
		mv.addObject("sList", sList);
		mv.addObject("tList", tList);
		mv.addObject("zList", zList);
		mv.addObject("wList", wList);
		mv.addObject("hList", hList);
		
		mv.addObject("qnaList", pQna);
		
	    mv.addObject("list", ar);
	    mv.addObject("review",reviews);
	    mv.setViewName("hworld/phoneDetail");

		return mv;
	}

	//월요금 계산하는 프로시저 호출 컨트롤러
	@ResponseBody
	@GetMapping("calMonthlyPay")
	public Map<String, Object> getMonthlyPay(@RequestParam Map<String, Object> params, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//String 타입의 disKind를 int로 바꿔줌
		
		params.put("disKind", Integer.parseInt((String)params.get("disKind")));
		
		//Map은 heap영역 주소값 복사가 안됨 그냥 메서드 호출하고 매개변수로 받은 기존객체에 데이터를 리턴하는식으로 써야할거같음
		directService.getMonthlyPay(params);

		 // 계산된 값(params)을 세션에 저장
	    session.setAttribute("monthlyPay", params);
		
		
		return params;
	}
	
	
	
	// 액세서리 리스트 페이지
	@GetMapping("accessoryList")
	public ModelAndView getAccList(ModelAndView mv, Pager pager, @RequestParam(value = "sortType", defaultValue = "latest") String sortType, HttpServletRequest request, HttpServletResponse response) throws Exception {

	    // sortType에 따라 정렬 유형 설정
	    if (sortType.equals("priceHigh")) {
	        pager.setSortType("priceHigh");
	    } else if (sortType.equals("priceLow")) {
	        pager.setSortType("priceLow");
	    } else {
	        pager.setSortType("latest");
	    }
	    
	    List<DirectVO> ar = directService.getAccList(pager);
	    
	    List<DirectVO> recentlyViewedProducts = directService.getSeenList(request);
	    
	    mv.addObject("recentlyViewedProducts", recentlyViewedProducts);
	    mv.addObject("list", ar);
	    mv.setViewName("hworld/accessoryList");
	    
	    return mv;
	}

	// 액세서리 디테일 페이지
	@GetMapping("accessoryDetail")
	public ModelAndView getAccDetail(DirectVO directVO, String slicedCode, HttpServletRequest request, HttpServletResponse response, QnaVO qnaVO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<DirectVO> ar = directService.getAccDetail(slicedCode);
		
		List<QnaVO> qnaList = directService.getDirectQna(qnaVO); 
		List<QnaVO> accQna = new ArrayList<>();
		for(QnaVO qna : qnaList) {
			String newCode = qna.getNewCode();
			if(!newCode.equals("P01")) {
				accQna.add(qna);
			}
		}
		
	    directService.setSeenList(request, response, slicedCode);
	    List<ReviewVO> reviews = directService.getReview(slicedCode);//slicedCode로 페이징된 리뷰 목록 조회
//	    List<ReviewVO> accReview = new ArrayList<>();
//	    for(ReviewVO review : reviews) {
//	    	String categoryCode = review.getCategoryCode();
//	    	if(!categoryCode.equals("01")) {
//	    		accReview.add(review);
//	    	}
//	    }
	    
		mv.addObject("list", ar);		
		mv.addObject("qnaList", accQna);
		mv.addObject("review",reviews);
		mv.setViewName("hworld/accessoryDetail2");
		return mv;
	}
	
	// 휴대폰 & 액세서리 상품 추가 페이지
	@GetMapping("directAdd")
	public ModelAndView setInsert() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hworld/directAdd");
		return modelAndView;
	}
	@PostMapping("directAdd")
	public ModelAndView setInsert(String categoryCode, String brandCode, String directName, String directContents,
			String[] colorCode, String[] saveCapacity, Integer[] directPrice, Integer[] directStock, String[] directCode, DirectVO directVO, MultipartFile[] multipartFiles) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		
		//반복문으로 directVO 하나 완성하기 + 완성될 때 서비스로 insert 메서드 호출
		for(int i=0; i<directCode.length; i++) {
			DirectVO directVO2 = new DirectVO();
			directVO2.setCategoryCode(categoryCode);
			directVO2.setBrandCode(brandCode);
			directVO2.setDirectName(directName);
			directVO2.setDirectContents(directContents);
			directVO2.setColorCode(colorCode[i]);
			directVO2.setSaveCapacity(saveCapacity[i]);
			directVO2.setDirectPrice(directPrice[i]);
			directVO2.setDirectStock(directStock[i]);
			directVO2.setDirectCode(directCode[i]);

			directService.setInsert(directVO2, multipartFiles);
		}
		
		modelAndView.setViewName("redirect:./phoneList");
		return modelAndView;
	}
	
	// 휴대폰 & 액세서리 상품 추가 페이지
	@GetMapping("accessoryAdd")
	public ModelAndView setAccInsert() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hworld/accessoryAdd");
		return modelAndView;
	}
	
	@PostMapping("accessoryAdd")
	public ModelAndView setAccInsert(String categoryCode, String brandCode, String directName, String directContents,
			String[] colorCode, String[] saveCapacity, Integer[] directPrice, Integer[] directStock, String[] directCode, DirectVO directVO, MultipartFile[] multipartFiles) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		
		//반복문으로 directVO 하나 완성하기 + 완성될 때 서비스로 insert 메서드 호출
		for(int i=0; i<directCode.length; i++) {
			DirectVO directVO2 = new DirectVO();
			directVO2.setCategoryCode(categoryCode);
			directVO2.setBrandCode(brandCode);
			directVO2.setDirectName(directName);
			directVO2.setDirectContents(directContents);
			directVO2.setColorCode(colorCode[i]);
			directVO2.setSaveCapacity(saveCapacity[i]);
			directVO2.setDirectPrice(directPrice[i]);
			directVO2.setDirectStock(directStock[i]);
			directVO2.setDirectCode(directCode[i]);

			directService.setInsert(directVO2, multipartFiles);
		}
		
		modelAndView.setViewName("redirect:./accessoryList");
		return modelAndView;
	}

	
	// 휴대폰 상품 수정 페이지
	@GetMapping("directUpdate")
	public ModelAndView setUpdate(DirectVO directVO, String slicedCode) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		List<DirectVO> ar = directService.getDetail(slicedCode);

		modelAndView.setViewName("hworld/directUpdate");
		modelAndView.addObject("directVO", directVO);
		modelAndView.addObject("list", ar);
		return modelAndView;
	}
	
	@PostMapping("directUpdate")
	public ModelAndView setUpdate(String categoryCode, String brandCode, String directName, String directContents,
			String[] colorCode, String[] saveCapacity, Integer[] directPrice, Integer[] directStock, String[] directCode, DirectVO directVO, MultipartFile[] multipartFiles, String slicedCode) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		
		slicedCode = directVO.getDirectCode().substring(directVO.getDirectCode().length() - 5);
		directService.setDelete(slicedCode);

		
		//반복문으로 directVO 하나 완성하기 + 완성될 때 서비스로 insert 메서드 호출
		for(int i=0; i<directCode.length; i++) {
			DirectVO directVO2 = new DirectVO();
			directVO2.setCategoryCode(categoryCode);
			directVO2.setBrandCode(brandCode);
			directVO2.setDirectName(directName);
			directVO2.setDirectContents(directContents);
			directVO2.setColorCode(colorCode[i]);
			directVO2.setSaveCapacity(saveCapacity[i]);
			directVO2.setDirectPrice(directPrice[i]);
			directVO2.setDirectStock(directStock[i]);
			directVO2.setDirectCode(directCode[i]);

			directService.setInsert(directVO2, multipartFiles);
		}

		modelAndView.setViewName("redirect:/direct/phoneDetail?slicedCode="+slicedCode);
		return modelAndView;
	}
	
	@PostMapping("directDelete")
	public ModelAndView setDelete(ModelAndView mv, @RequestParam("slicedCode") String slicedCode) throws Exception {

		int result = directService.setDelete(slicedCode);
		
		
		mv.setViewName("redirect:./phoneList");
		return mv;
	}
	
	
	@GetMapping("accessoryUpdate")
	public ModelAndView setUpdate(ModelAndView mv,DirectVO directVO, String slicedCode) throws Exception{
		List<DirectVO> ar = directService.getAccDetail(slicedCode);

		mv.setViewName("hworld/accessoryUpdate");
		mv.addObject("directVO", directVO);
		mv.addObject("list", ar);
		return mv;
	}
	
	@PostMapping("accessoryUpdate")
	public ModelAndView setUpdate(ModelAndView mv, String categoryCode, String brandCode, String directName, String directContents,
			String[] colorCode, String[] saveCapacity, Integer[] directPrice, Integer[] directStock, String[] directCode, DirectVO directVO, MultipartFile[] multipartFiles, String slicedCode) throws Exception{

		slicedCode = directVO.getDirectCode().substring(directVO.getDirectCode().length() - 5);
		directService.setDelete(slicedCode);
		
		//반복문으로 directVO 하나 완성하기 + 완성될 때 서비스로 insert 메서드 호출
		for(int i=0; i<directCode.length; i++) {
			DirectVO directVO2 = new DirectVO();
			directVO2.setCategoryCode(categoryCode);
			directVO2.setBrandCode(brandCode);
			directVO2.setDirectName(directName);
			directVO2.setDirectContents(directContents);
			directVO2.setColorCode(colorCode[i]);
			directVO2.setSaveCapacity(saveCapacity[i]);
			directVO2.setDirectPrice(directPrice[i]);
			directVO2.setDirectStock(directStock[i]);
			directVO2.setDirectCode(directCode[i]);

			directService.setInsert(directVO2, multipartFiles);
		}

		mv.setViewName("redirect:/direct/accessoryDetail?slicedCode="+slicedCode);
		return mv;
	}

	@PostMapping("accessoryDelete")
	public ModelAndView setDeleteAccessary(ModelAndView mv, @RequestParam("slicedCode") String slicedCode) throws Exception {

		int result = directService.setDelete(slicedCode);
		
		mv.setViewName("redirect:./accessoryList");
		return mv;
	}
	
	//리뷰 추가
	@PostMapping("reviewAdd")
	public ModelAndView setReviewAdd(ReviewVO reviewVO, ModelAndView mv) throws Exception {
		int result = directService.setReviewAdd(reviewVO);
		String slicedCode = reviewVO.getSlicedCode();  // reviewVO에서 slicedCode 값을 가져온다
		String redirectUrl = "/direct/phoneDetail?slicedCode=" + slicedCode;  // 리다이렉트할 URL을 생성한다
		
		mv.setViewName("redirect:" + redirectUrl);  // 리다이렉트할 URL을 설정한다
		return mv;
	}
		
	// 리뷰 수정 처리
	@PostMapping("reviewUpdate")
	public ModelAndView setReviewUpdate(ReviewVO reviewVO) throws Exception {
	    ModelAndView mv = new ModelAndView();
	    int result = directService.setReviewUpdate(reviewVO);
	    String slicedCode = reviewVO.getSlicedCode(); // reviewVO에서 slicedCode 값을 가져옵니다.
	    String redirectUrl = "/direct/phoneDetail?slicedCode=" + slicedCode;  // 리다이렉트할 URL을 생성합니다.
	    mv.setViewName("redirect:" + redirectUrl);  // 리다이렉트할 URL을 설정합니다.
	    return mv;
	}
	
	//리뷰 삭제 
	@PostMapping("reviewDelete")
	public ModelAndView setReviewDelete(ReviewVO reviewVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = directService.setReviewDelete(reviewVO);
		String slicedCode = reviewVO.getSlicedCode();  // reviewVO에서 slicedCode 값을 가져옵니다.
	    String redirectUrl = "/direct/phoneDetail?slicedCode=" + slicedCode;  // 리다이렉트할 URL을 생성합니다.
	    mv.setViewName("redirect:" + redirectUrl);  // 리다이렉트할 URL을 설정합니다.
		return mv;
	}
	
	//상품 문의 추가
	@PostMapping("directQnaAdd")
	public ModelAndView setQnaAdd(QnaVO qnaVO, ModelAndView mv) throws Exception {
		int result = directService.setQnaAdd(qnaVO);
		String slicedCode = qnaVO.getSlicedCode();  // reviewVO에서 slicedCode 값을 가져온다
		
	    
		String redirectUrl = "/direct/phoneDetail?slicedCode=" + slicedCode;  // 리다이렉트할 URL을 생성한다
		mv.setViewName("redirect:" + redirectUrl);  // 리다이렉트할 URL을 설정한다
		return mv;
	}
	//상품 답글 추가 (admin)
	@PostMapping("directReplyAdd")
	public ModelAndView setReplyAdd(QnaVO qnaVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = directService.setReplyAdd(qnaVO);
		String slicedCode = qnaVO.getSlicedCode();  // reviewVO에서 slicedCode 값을 가져온다
		String redirectUrl = "/direct/phoneDetail?slicedCode=" + slicedCode;  // 리다이렉트할 URL을 생성한다
		mv.setViewName("redirect:" + redirectUrl);  // 리다이렉트할 URL을 설정한다
		return mv;
		
	}
	
	// 휴대폰 주문 페이지
	
	@GetMapping("phoneOrder")
	public ModelAndView phoneOrder(@RequestParam Map<String, Object> map, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		
		
		if(memberVO == null) {
			
			mv.setViewName("hworld/login");
			return mv;
		}else {
		
			Integer memberNum = memberVO.getMemberNum();
		
		//회선이 없는 경우 null 뜨는거 방지해야해 진희야 까먹지마 
		PlanVO phoneNum = directService.getKingPhoneNum(memberNum);
		
		if(phoneNum != null) {
		
		mv.addObject("phoneNum", phoneNum);
		mv.addObject("map", map);
		mv.setViewName("hworld/phoneOrder");
		return mv;

		
		} else {

			mv.addObject("map", map);
			mv.setViewName("hworld/phoneOrder");
			return mv;
			
		}
		}
	}
	@Transactional
	@PostMapping("formAdd")
	public ModelAndView setFormAdd(@Valid ApplicationVO applicationVO, BindingResult bindingResult, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//에러가 발생한 경우 여기서 view 리턴
		if(bindingResult.hasErrors()) {
			log.info("========== 에러가 발생함 ==========");
			mv.setViewName("hworld/phoneOrder");
			return mv;
		}

		//에러가 없는경우 insert 작업
		int result = directService.setFormAdd(applicationVO, session);
		log.info("=============> result : {} ", result);
		
		
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		Integer memberNum = memberVO.getMemberNum();
		int ownResult = directService.setOwnCheck(memberNum);
		
		mv.setViewName("redirect:./phoneOrderResult");
		//성공하면 결과에 따라 alert띄우기 해도 될듯. 나중에 index 등으로 바꾸기
		return mv;
	}
	
	@ResponseBody
	@GetMapping("checkPhoneNum")
	public Map<String, Object> checkPhoneNum(String phoneNum, String rrnf, String rrnl, String name) throws Exception {
	    return directService.checkPhoneNum(phoneNum, rrnf, rrnl, name);
	}
	
	
	
	//휴대폰 상품 구매 후 결과 페이지
	@GetMapping("phoneOrderResult")
	public ModelAndView phoneOrderResult(@RequestParam Map<String, Object> map, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		Integer memberNum = memberVO.getMemberNum();
		
		// 신규가입인 경우 만 해당 
		PlanVO phoneNum = directService.getMemberPlan(memberNum);
		
		String directName = directService.getDirectName(memberNum);
		log.error(directName);
		mv.addObject("phone", phoneNum);
		mv.addObject("directName", directName);
		mv.setViewName("hworld/phoneOrderResult");
		return mv;
	}
	
	// 상품 번호 이동 페이지
		@GetMapping("directNumMove")
		public ModelAndView d7() throws Exception{
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("hworld/directNumMove");
			return modelAndView;
		}

}
