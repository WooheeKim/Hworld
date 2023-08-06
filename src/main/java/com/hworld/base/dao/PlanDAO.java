package com.hworld.base.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hworld.base.util.Pager;
import com.hworld.base.vo.BaseVO;
import com.hworld.base.vo.BillVO;
import com.hworld.base.vo.ExtraPlanVO;
import com.hworld.base.vo.MemberVO;
import com.hworld.base.vo.OtherTelecomVO;
import com.hworld.base.vo.PlanVO;

@Mapper
public interface PlanDAO {
	
	// 전체 요금제 갯수 조회
    public Long getTotalCount() throws Exception;
	
	// 요금제 리스트 조회
    public List<PlanVO> getPlanList() throws Exception;
  //존재하는 plan 타입 가져오기
  	public List<PlanVO> getExistPlanList() throws Exception;
    public List<PlanVO> getGeneralList() throws Exception;
    public List<PlanVO> getSeniorList() throws Exception;
    public List<PlanVO> getTeenList() throws Exception;
    public List<PlanVO> getWelfareList() throws Exception;
    public List<PlanVO> getZemList() throws Exception;
    public List<PlanVO> getHeroList() throws Exception;
	
	// 요금제 하나 조회
    public PlanVO getDetail(PlanVO planVO) throws Exception;
    // 추천상품 
    public List<PlanVO> recommendPlan(PlanVO planVO);
    
    public PlanVO getNoteName(PlanVO planVO) throws Exception;
    
    //대표회선 요금제 조회
    public PlanVO getKingPlanNum(Integer memberNum) throws Exception;
 
    //로그인 후 본인인증 절차 (요금제 변경)
    public MemberVO getMemberInput(MemberVO memberVO) throws Exception;
    
    //요금제 변경 페이지에서 이전 요금제 정보 불러오기
    public PlanVO getBeforePlan(Integer memberNum) throws Exception;
    
    //요금제 변경 페이지에서 요금제 변경일 체크 
    public BillVO getCheckPlanChange(BillVO billVO) throws Exception;
    
    //위약금 조회 프로시저 호출
    public Map<?, ?> getCheckCancelFee(Map<String, Object> checkCancelFee) throws Exception;
    
    //요금제 변경 후 청구내역 변경되는 프로시저 호출
    public int setPlanChange(BillVO billVO) throws Exception;
    
    //타통신사 조회 
    public String isOtherTelecom(String taPhoneNum, String telecomName) throws Exception;
    
    // 공통코드 정보 가져오고 insert 
    public List<BaseVO> getCommonCode(BaseVO baseVO) throws Exception;
    public int setCommonCode(BaseVO baseVO) throws Exception;
	
	// 요금제 등록
    public int setInsert(PlanVO planVO) throws Exception;
	
	// 요금제 수정
    public int setPlanUpdate(PlanVO planVO) throws Exception;
	
	// 요금제 삭제
    public int setPlanDisabled(PlanVO planVO) throws Exception;

	// 부가서비스 갯수
	//public Long getTotalCount(Pager pager) throws Exception;
	
	// 부가서비스 리스트 조회
	public List<ExtraPlanVO> getExtraPlanList() throws Exception;
	
	// 부가서비스 하나 조회
	public ExtraPlanVO getDetailExtraPlan(ExtraPlanVO extraPlanVO) throws Exception;
	
	// 부가서비스 신청 프로시저 
	public int setAddServ(Map<String, Object> map) throws Exception;
	
	// 부가서비스 신청 여부 확인
	public Map<String, Object> searchExtraPlan(Map<String, Object> map) throws Exception;

	// 부가서비스 추가
	public int setEPlanInsert(ExtraPlanVO extraPlanVO) throws Exception;
	
	// 부가서비스 수정
	public int setExtraPlanUpdate(ExtraPlanVO extraPlanVO) throws Exception;
	
	// 부가서비스 삭제
	public int setExtraPlanDelete(ExtraPlanVO extraPlanVO) throws Exception;

	

	
}
