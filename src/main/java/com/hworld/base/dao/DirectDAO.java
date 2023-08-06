package com.hworld.base.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Mapper;

import com.hworld.base.util.Pager;
import com.hworld.base.vo.ApplicationVO;
import com.hworld.base.vo.DirectVO;
import com.hworld.base.vo.MemberVO;
import com.hworld.base.vo.OtherTelecomVO;
import com.hworld.base.vo.PlanVO;
import com.hworld.base.vo.QnaVO;
import com.hworld.base.vo.ReviewVO;


@Mapper
public interface DirectDAO {
		
	//상품 수
	public Long getTotalCount(Pager pager) throws Exception;
	
	//휴대폰 상품 리스트 조회 
	public List<DirectVO> getList(Pager pager) throws Exception;
	
	//악세사리 상품 리스트 조회 
	public List<DirectVO> getAccList(Pager pager) throws Exception;
	
	//상품 하나 옵션 다수 조회
	public List<DirectVO> getDetail(String slicedCode) throws Exception;
	
	//getMonthlyPay - ajax 상품 예상 월 요금 프로시저 
	public Map<?, ?> getMonthlyPay(Map<String, Object> monthlyPay) throws Exception;
	
	//회원 기기변경 휴대폰 구매 시 기존 phoneNum 조회
	public PlanVO getKingPhoneNum (Integer memberNum) throws Exception;
	
	//악세사리 상품 하나 옵션 다수 조회
	public List<DirectVO> getAccDetail(String slicedCode) throws Exception;

	//상품파일 조회 
	public DirectVO getFileDetail(DirectVO directVO) throws Exception;
	
	//생성된 제품코드로 가격, 재고 조회해오기 
	public DirectVO getPrice(String directCode) throws Exception;

	//상품 추가  
	public int setInsert(DirectVO directVO) throws Exception;
	
	//파일 추가 
	public int setFileInsert(DirectVO directVO) throws Exception;

	//상품 수정 
	public int setUpdate(DirectVO directVO) throws Exception;
	
	//상품 삭제
	public int setDelete(String slicedCode) throws Exception;
	
	//파일 삭제 
	public int setFileDelete (DirectVO directVO) throws Exception;
	
	//리뷰 불러오기
	public List<ReviewVO> getReview(String slicedCode) throws Exception;	
	
	//리뷰 총 개수 가져오기
	public  Long getReviewCount(DirectVO directVO) throws Exception;
	
	//리뷰작성
	public int setReviewAdd(ReviewVO reviewVO) throws Exception;
	
	//리뷰수정
	public int setReviewUpdate(ReviewVO reviewVO) throws Exception;
	
	//리뷰삭제
	public int setReviewDelete(ReviewVO reviewVO) throws Exception;
	
	//상품문의
	public List<QnaVO> getDirectQna(QnaVO qnaVO) throws Exception;
	
	//상품문의 작성
	public int setQnaAdd(QnaVO qnaVO) throws Exception;
	
	//상품문의 답글 작성
	public int setReplyAdd(QnaVO qnaVO) throws Exception;
	
	//존재하는 plan 타입 가져오기
	public List<PlanVO> getExistPlanList() throws Exception;
	
	//plan list 가져오기
	public List<PlanVO> getPlanList() throws Exception;
	
	//plan 선택된거 가져오기
	public PlanVO getSelectedPlan(PlanVO planVO) throws Exception;

	public int setFormAdd(@Valid ApplicationVO applicationVO) throws Exception;

	//2.신청서 기반(주민번호)으로 일치하는 회원정보가 있는지 검색 - 앞자리는 세션에서 받아오고 뒷자리 입력해서 검증
	public MemberVO getMemberSearch(ApplicationVO applicationVO) throws Exception;
	
	//프로시저로 회선 테이블에 add
	public int setTelephoneInitAdd(Map<String, Integer> telephone) throws Exception;
	
	//구매완료(가입완료 후 결과안내 창)
	public PlanVO getMemberPlan(Integer memberNum) throws Exception;
	
	public String getDirectName(Integer memberNum) throws Exception;

	//타 통신사 번호 조회
	public String isOtherTelecom(String phoneNum)throws Exception;
	
	//기기변경 시 정보 일치 조회 여부
	public MemberVO getMemberInput (MemberVO memberVO)throws Exception;
	
	//휴대폰 번호 사용가능여부 조회 
	public String checkPhoneNum(String phoneNum, String rrnf, String rrnl, String name)throws Exception;
	
	//휴대폰 구매 후 ownCheck 1로 업데이트
	public int setOwnCheck(Integer memberNum) throws Exception;
}
