package com.hworld.base.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.hworld.base.dao.DirectDAO;
import com.hworld.base.dao.MemberDAO;
import com.hworld.base.dao.PlanDAO;
import com.hworld.base.util.Pager;
import com.hworld.base.util.SHA256Util;
import com.hworld.base.vo.BaseVO;
import com.hworld.base.vo.BillVO;
import com.hworld.base.vo.DirectVO;
import com.hworld.base.vo.ExtraPlanVO;
import com.hworld.base.vo.MemberVO;
import com.hworld.base.vo.OtherTelecomVO;
import com.hworld.base.vo.PlanVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PlanService {

	@Autowired
	private PlanDAO planDAO;
	
	//요금제 리스트
	public List<PlanVO> getPlanList() throws Exception{
		return planDAO.getPlanList();
	}
	
	//존재하는 plan 타입 가져오기
	public List<PlanVO> getExistPlanList() throws Exception {
		return planDAO.getExistPlanList();
	};
	
	//부가서비스 리스트 
	public List<ExtraPlanVO> getExtraPlanList() throws Exception {
		return planDAO.getExtraPlanList();
	}
	//부가서비스 상세
	public ExtraPlanVO getDetailExtraPlan(ExtraPlanVO extraPlanVO) throws Exception{
		return planDAO.getDetailExtraPlan(extraPlanVO);
	}
	
	//부가서비스 신청
	public int setAddServ(Map<String, Object> map) throws Exception{
		return planDAO.setAddServ(map);
	}
	//부가서비스 신청여부 확인 
	public Map<String, Object> searchExtraPlan(Map<String, Object> map) throws Exception{
		return planDAO.searchExtraPlan(map);
	}

	//요금제 이름 조회
	public PlanVO getNoteName(PlanVO planVO) throws Exception{
		return planDAO.getNoteName(planVO);
	}
	//요금제 상세페이지 
	public PlanVO getDetail(PlanVO planVO)throws Exception{
		return planDAO.getDetail(planVO);
	}
	//요금제 상세페이지 추천상품
	public List<PlanVO> recommendPlan(PlanVO planVO) throws Exception{
		return planDAO.recommendPlan(planVO);
	}
	
	//대표회선 요금제 조회
	public PlanVO getKingPlanNum(Integer memberNum) throws Exception{
		return planDAO.getKingPlanNum(memberNum);
	}
	//본인인증 (요금제 변경)
	public int getIdentify(MemberVO memberVO, HttpSession session) throws Exception{
		MemberVO sessionMember = (MemberVO)session.getAttribute("memberVO");
		Integer sessionMemberNum = sessionMember.getMemberNum();

		//입력받은 rrnl을 암호화 하고 db 정보와 비교
		String RRN = memberVO.getRrnf()+"-"+memberVO.getRrnl();
	    memberVO.setRrnl(SHA256Util.encryptMD5(RRN));
	    
	    String memberName = memberVO.getName();
	    
	    MemberVO memberCheck = planDAO.getMemberInput(memberVO);
	    
	    if (sessionMemberNum != null && memberCheck != null && sessionMemberNum.equals(memberCheck.getMemberNum())) {
            return 1;
        } else {
            return 0;
        }
    }
	//요금제 변경 > 요금제 변경일 체크 프로시저 호출
	public BillVO getCheckPlanChange(BillVO billVO) throws Exception{
		return planDAO.getCheckPlanChange(billVO);
	}
	
	//위약금 조회 프로시저 호출 
	public Map<?, ?> getCheckCancelFee(Map<String, Object> checkCancelFee) throws Exception{
		return planDAO.getCheckCancelFee(checkCancelFee);
	}
	
	//요금제 변경 > 청구내역 업데이트 프로시저 호출
	public int setPlanChange(BillVO billVO) throws Exception{
		return planDAO.setPlanChange(billVO);
	}
	//요금제 변경 전 정보 가져오기
	public PlanVO getBeforePlan(Integer memberNum) throws Exception{
		return planDAO.getBeforePlan(memberNum);
	}
	
	//번호이동 타통신사 DB 조회
	public boolean isOtherTelecom(String taPhoneNum, String telecomName) throws Exception{
		boolean check = false;
		
		String result = planDAO.isOtherTelecom(taPhoneNum, telecomName);
		if(result != null) {
			check = true;
		}
		log.info(" :::::::::::::::::::: service check value : {} ", check);
		return check;
	}
	
	
	// 선택된 타입의 공통코드 정보 가져오기 
	public List<BaseVO> getCommonCode(BaseVO baseVO) throws Exception{
		return planDAO.getCommonCode(baseVO);
	}
	// 새로운 공통코드 인서트 
	public int setCommonCode(BaseVO baseVO) throws Exception{
		return planDAO.setCommonCode(baseVO);
	}
	
	//요금제 등록 
	public int setInsert(PlanVO planVO)throws Exception{
		return planDAO.setInsert(planVO);
	}
	//요금제 수정 
	public int setPlanUpdate(PlanVO planVO) throws Exception{
		return planDAO.setPlanUpdate(planVO);
	}
	//요금제 삭제 
	public int setPlanDisabled(PlanVO planVO) throws Exception{
		return planDAO.setPlanDisabled(planVO);
	}
	
	
}
