package com.hworld.base.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.hworld.base.dao.DirectDAO;
import com.hworld.base.util.FileManager;
import com.hworld.base.util.Pager;
import com.hworld.base.util.SHA256Util;
import com.hworld.base.vo.ApplicationVO;
import com.hworld.base.vo.DirectVO;
import com.hworld.base.vo.MemberVO;
import com.hworld.base.vo.OtherTelecomVO;
import com.hworld.base.vo.PlanVO;
import com.hworld.base.vo.QnaVO;
import com.hworld.base.vo.ReviewVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class DirectService {

	@Autowired
	private DirectDAO directDAO;
	@Autowired
	private FileManager fileManager;

	
	//휴대폰 상품 리스트
	public List<DirectVO> getList(Pager pager) throws Exception{
		pager.makeStartRow();
		pager.makeNum(directDAO.getTotalCount(pager));
		return directDAO.getList(pager);
	}
	
	//악세사리 상품 리스트
	public List<DirectVO> getAccList(Pager pager) throws Exception{
		pager.makeStartRow();
		pager.makeNum(directDAO.getTotalCount(pager));
		return directDAO.getAccList(pager);
	}
	
	// 상품 하나 옵션 다수 조회
	public List<DirectVO> getDetail(String slicedCode) throws Exception {
	    return directDAO.getDetail(slicedCode);
	}
	
	//getMonthlyPay 월 예상 요금 조회
	public Map<?, ?> getMonthlyPay(Map<String, Object> monthlyPay) throws Exception{
		return directDAO.getMonthlyPay(monthlyPay);
	}
	
	//회원 휴대폰 기기변경 구매시 기존 kingPhoneNum 조회
	public PlanVO getKingPhoneNum(Integer memberNum) throws Exception{
		return directDAO.getKingPhoneNum(memberNum);
	}
	
	// 악세사리상세페이지 
	public List<DirectVO> getAccDetail(String slicedCode) throws Exception {
		return directDAO.getAccDetail(slicedCode);
	}
	
	// 상품 리뷰 전체 불러오기
	public List<ReviewVO> getReview(String slicedCode) throws Exception {
		return directDAO.getReview(slicedCode);
	}
	
	// 상품 리뷰 작성 
	public int setReviewAdd(ReviewVO reviewVO) throws Exception {
		return directDAO.setReviewAdd(reviewVO);
	}
	

		
	//상품 등록 
	public int setInsert(DirectVO directVO, MultipartFile[] multipartFiles)throws Exception{
		String fileName = fileManager.deleteFile(multipartFiles, directVO);
		fileName = fileManager.saveFile(multipartFiles, directVO);
		int result = directDAO.setInsert(directVO);
		return result;
	}

	//상품 수정 
	public int setUpdate(DirectVO directVO, MultipartFile[] multipartFiles) throws Exception{
		String fileName = fileManager.deleteFile(multipartFiles, directVO);
		fileName = fileManager.saveFile(multipartFiles, directVO);	
		return directDAO.setUpdate(directVO);
	}

	//상품 삭제 
	public int setDelete(String slicedCode) throws Exception{
		return directDAO.setDelete(slicedCode);
	}
	
	public void setSeenList(HttpServletRequest request, HttpServletResponse response, String slicedCode) {
	    Cookie[] cookies = request.getCookies();

	    if (slicedCode != null && slicedCode.length() >= 5) {
	        boolean found = false;
	        String updatedCodes = "";

	        if (cookies != null) {
	            for (Cookie cookie : cookies) {
	                if (cookie.getName().equals("recentlyViewedProduct")) {
	                    String currentCodes = cookie.getValue();
	                    String[] slicedCodes = currentCodes.split("_");
	                    List<String> directList = new ArrayList<>(Arrays.asList(slicedCodes));

	                    // 중복된 상품 ID가 있는 경우 기존 항목 제거
	                    if (directList.contains(slicedCode)) {
	                        directList.remove(slicedCode);
	                    }

	                    // 상품 ID 추가
	                    directList.add(0, slicedCode);

	                    // 최대 개수를 초과하는 경우 맨 뒤 항목 삭제
	                    if (directList.size() > 20) {
	                        directList = directList.subList(0, 20);
	                    }

	                    // 쿠키값 업데이트
	                    updatedCodes = String.join("_", directList);

	                    found = true;
	                    break;
	                }
	            }
	        }

	        // 쿠키에 최근 본 상품 ID가 없는 경우 새로운 쿠키 생성
	        if (!found) {
	            updatedCodes = slicedCode;
	        }

	        Cookie cookie = new Cookie("recentlyViewedProduct", updatedCodes);
	        cookie.setMaxAge(12 * 60 * 60); // 12시간 설정
	        cookie.setPath("/");
	        response.addCookie(cookie);
	    }
	}

	public List<DirectVO> getSeenList(HttpServletRequest request) throws Exception {
	    Cookie[] cookies = request.getCookies();
	    List<DirectVO> recentlyViewedProducts = new ArrayList<>();

	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().equals("recentlyViewedProduct")) {
	                String slicedCode5 = cookie.getValue();
	                String[] slicedCodes = slicedCode5.split("_");

	                // 가격이 가장 낮은 상품들을 저장하는 맵
	                Map<String, DirectVO> lowestPriceProductsMap = new LinkedHashMap<>();
	                int lowestPrice = Integer.MAX_VALUE;

	                for (String slicedCode : slicedCodes) {
	                    // productId를 사용하여 상품 정보를 조회하는 로직을 구현
	                    List<DirectVO> directVO = getAccDetail(slicedCode);
	                    if (directVO != null) {
	                        for (DirectVO product : directVO) {
	                            if (!lowestPriceProductsMap.containsKey(slicedCode) || product.getDirectPrice() < lowestPrice) {
	                                lowestPriceProductsMap.put(slicedCode, product);
	                                lowestPrice = product.getDirectPrice();
	                            }
	                        }
	                    }
	                }

	             // 최근 추가된 3개의 가격이 가장 낮은 상품들을 리스트에 추가
	                int count = 0;
	                for (DirectVO product : lowestPriceProductsMap.values()) {
	                    recentlyViewedProducts.add(product);
	                    count++;
	                    if (count >= 3) {
	                        break;
	                    }
	                }

	                break; // 한 번만 처리하고 반복문 종료
	            }
	        }
	    }

	    return recentlyViewedProducts;
	}


	//리뷰삭제
	public int setReviewDelete(ReviewVO reviewVO) throws Exception{
		return directDAO.setReviewDelete(reviewVO);	
	}
	
	//리뷰수정
	public int setReviewUpdate(ReviewVO reviewVO) throws Exception{
		return directDAO.setReviewUpdate(reviewVO);
	}
	
	//상품문의 가져오기 
	public List<QnaVO> getDirectQna(QnaVO qnaVO) throws Exception{
		return directDAO.getDirectQna(qnaVO);
	}
	//상품문의 작성
	public int setQnaAdd(QnaVO qnaVO) throws Exception{
		return directDAO.setQnaAdd(qnaVO);
	}
	//상품문의 답글작성
	public int setReplyAdd(QnaVO qnaVO) throws Exception{
		return directDAO.setReplyAdd(qnaVO);
	}

	//getExistPlanList
	public List<PlanVO> getExistPlanList() throws Exception{
		return directDAO.getExistPlanList();
	}
	
	//getPlanList
	public List<PlanVO> getPlanList() throws Exception{
		return directDAO.getPlanList();
	}
	
	//getSelectedPlan
	public PlanVO getSelectedPlan(PlanVO planVO) throws Exception{
		return directDAO.getSelectedPlan(planVO);
	}
	@Transactional(rollbackFor = Exception.class)
	public int setFormAdd(@Valid ApplicationVO applicationVO, HttpSession session) throws Exception {
		//1.회원가입은 되어있고 회선이 없는 회원이 휴대폰 구매하면서 신규가입 or 번호이동 (둘다 ownCheck 0 , 가입완료(구매) 후 1)
		//신청서페이지에 세션 받아와서 기본정보 출력 
		//-> 1.1 신규가입 : 타통신사 DB & 우리 DB에 없는 번호로 가입가능 
		//-> 1.2 번호이동 : 타통신사 DB에는 있고, 우리 DB에 없는 번호로 가입가능 
		//세션에서 정보 받아오기때문에 주민등록번호 뒷자리로만 본인정보 조회 
		
				//평문 주민뒷자리를 rrnlOrigin에 저장 -> 나중에 실제로 사용할땐 지우면 됨 
				applicationVO.setRrnlOrigin(applicationVO.getRrnl());
				
				//SHA256Util을 이용해서 RRNL 암호화(RRN 값 기반)
				String RRN = applicationVO.getRrnf()+"-"+applicationVO.getRrnl();
				applicationVO.setRrnl(SHA256Util.encryptMD5(RRN));
				
				//신청서 db에 insert  appNum 생성
				int result = directDAO.setFormAdd(applicationVO);
				log.error(">>>>>>>>>>>>>>>>>>>>>>>>>> appNum: {} ", applicationVO.getAppNum());

				
				//회원번호 조회하기 ( 주민번호 뒷자리 입력하면 그 값으로 ) 
				MemberVO memberVO = directDAO.getMemberSearch(applicationVO);
				
				
				
				//세션에서 정보 가져오기 (회원번호)
				
				MemberVO sessionMember = (MemberVO) session.getAttribute("memberVO");
				Integer sessionMemberNum = sessionMember.getMemberNum();
				
				log.error("{}<============멤버넘 ",memberVO.getMemberNum());
				log.error("{}<=========세션멤버",sessionMemberNum);
				
				
				applicationVO.setMemberNum(memberVO.getMemberNum());
				//3-2b.회원번호(신청서VO)로 회선VO 만들기
				//프로시저 호출해서 회선VO INSERT
				Map<String, Integer> telephone = new HashMap<>();
				telephone.put("appNum", applicationVO.getAppNum());
				telephone.put("memberNum", applicationVO.getMemberNum());
				log.info(" :::::::::::::::::::::::: {} ", telephone.get("appNum"));
				log.info(" :::::::::::::::::::::::: {} ", telephone.get("memberNum"));
				
				result = directDAO.setTelephoneInitAdd(telephone);
				
				log.info(" :::::::::::::::::::::::: {} ", result);
				
				
				return result;
	}

	//구매완료(가입완료 후 결과안내 창)
	public PlanVO getMemberPlan(Integer memberNum) throws Exception{
			return directDAO.getMemberPlan(memberNum);
	}
	
	public String getDirectName(Integer memberNum) throws Exception{
		return directDAO.getDirectName(memberNum);
	}
	
	//ownCheck 1로 변경 
	public int setOwnCheck(Integer memberNum) throws Exception{
		return directDAO.setOwnCheck(memberNum);
	}

	
	// 휴대폰 번호 사용가능 여부 조회 
	public Map<String, Object> checkPhoneNum(String phoneNum, String rrnf, String rrnl, String name) throws Exception {
		// 휴대폰 번호 사용가능 여부 조회
	
		String encryptedRrnl = SHA256Util.encryptMD5(rrnf + "-" + rrnl); // 주민등록번호 뒷자리 암호화
		  
	    String result = directDAO.checkPhoneNum(phoneNum, rrnf, encryptedRrnl, name);
	    
	    Map<String, Object> resultMap = new HashMap<>();
	    resultMap.put("result", result);
	    
	    return resultMap;
	}
}
