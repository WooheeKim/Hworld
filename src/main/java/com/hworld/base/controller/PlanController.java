package com.hworld.base.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hworld.base.dao.PlanDAO;
import com.hworld.base.service.PlanService;
import com.hworld.base.util.Pager;
import com.hworld.base.vo.BaseVO;
import com.hworld.base.vo.BillVO;
import com.hworld.base.vo.ExtraPlanVO;
import com.hworld.base.vo.MemberVO;
import com.hworld.base.vo.OtherTelecomVO;
import com.hworld.base.vo.PlanVO;
import com.hworld.base.vo.TelephoneVO;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/plan/*")
public class PlanController {
	
	@Autowired
	private PlanService planService;
	
	
	// 요금제 리스트
	@GetMapping("planList")
	public ModelAndView getList() throws Exception{
		ModelAndView mv= new ModelAndView();
		List<PlanVO> existPlanList = planService.getExistPlanList();
		List<PlanVO> planList = planService.getPlanList();
		List<PlanVO> gList = new ArrayList<>();
		List<PlanVO> sList = new ArrayList<>();
		List<PlanVO> tList = new ArrayList<>();
		List<PlanVO> zList = new ArrayList<>();
		List<PlanVO> wList = new ArrayList<>();
		List<PlanVO> hList = new ArrayList<>();
		List<ExtraPlanVO> ePlanList = planService.getExtraPlanList(); 
	
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
        
//		
		mv.addObject("gList", gList);
		mv.addObject("sList", sList);
		mv.addObject("tList", tList);
		mv.addObject("zList", zList);
		mv.addObject("wList", wList);
		mv.addObject("hList", hList);
		mv.addObject("planList",existPlanList);
		
		mv.addObject("ePlan", ePlanList);
		mv.setViewName("hworld/planList");
		return mv;
	}
	//요금제 상세페이지
	@GetMapping("planDetail")
	public ModelAndView getDetail(PlanVO planVO, HttpSession session, BillVO billVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		PlanVO plan = planService.getDetail(planVO); //페이지에 필요한 요금제 정보
		PlanVO note = planService.getNoteName(planVO);// 페이지 요금제 공통코드에 있는 NOTE 명 
		
		List<PlanVO> recommend = planService.recommendPlan(planVO); // 추천상품 
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		
		if(memberVO ==null) {
			mv.setViewName("hworld/login");
			return mv;
		}else {
			Integer memberNum = memberVO.getMemberNum();
		//이전 요금제 정보 가져오기
		PlanVO bfPlan = planService.getBeforePlan(memberNum);
		
		if(bfPlan!=null && bfPlan.getSerialNum()!=null) {
		billVO.setSerialNum(bfPlan.getSerialNum());
		
		billVO.setPlanNum(planVO.getPlanNum());
		
		planService.getCheckPlanChange(billVO);

		
		int changeOk=billVO.getResult();
		
		mv.addObject("ok", changeOk);
		
		}

		mv.addObject("bfPlan", bfPlan);
		
		mv.addObject("planNote", note);
        mv.addObject("planVO", plan);
        mv.addObject("recommend", recommend);
        
        mv.setViewName("hworld/planDetail");
		
		}
		return mv;
	}
	//요금제 추가 및 수정 시 필요한 공통코드 테이블 데이터 
	@ResponseBody
	@PostMapping("getCommonCode")
	public List<BaseVO> getCommonCode(String type) throws Exception {
	    BaseVO baseVO = new BaseVO();
	    baseVO.setType(type);
	    return planService.getCommonCode(baseVO);
	  }
	// 요금제 추가 
	@GetMapping("planAdd")
	public ModelAndView setPlanAdd(PlanVO planVO, BaseVO baseVO, ModelAndView mv) throws Exception{
	
		mv.setViewName("hworld/planAdd");
		return mv;
	}
	
	@PostMapping("planAdd")
	public ModelAndView setPlanAdd(PlanVO planVO, BaseVO baseVO) throws Exception{
		ModelAndView mv= new ModelAndView();
		int common = planService.setCommonCode(baseVO);
		int result = planService.setInsert(planVO);
		
		
		mv.setViewName("redirect:./planList");
		return mv;
	}

	// 요금제 변경 본인인증 
	@PostMapping("identify")
	public ModelAndView getIdentify(@RequestParam("planNum") String planNum, MemberVO memberVO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = planService.getIdentify(memberVO, session);
		
		PlanVO planVO = new PlanVO();
		planVO.setPlanNum(planNum);		
		planVO=planService.getDetail(planVO);
		
		if(result==1) {
			String message="확인이 완료되었습니다.";
			mv.addObject("url","./planChange");
			mv.addObject("result", message);
			
			session.setAttribute("planVO", planVO);
		}else {
			String message="일치하는 정보가 없습니다. 다시 확인하고 입력해주세요.";
			mv.addObject("url", "./planDetail?planNum="+planNum);
			mv.addObject("result", message);
		}

			mv.setViewName("common/result");
		return mv;
	}
	
	// 요금제 디테일 > 요금제 변경 확인
	@GetMapping("planChange")
	public ModelAndView getBeforPlan(Integer memberNum, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO sessionMember = (MemberVO)session.getAttribute("memberVO");
		memberNum = sessionMember.getMemberNum();
		
		PlanVO planVO = planService.getBeforePlan(memberNum);
		
		mv.addObject("bfPlan", planVO);
		mv.setViewName("hworld/planChange");

		return mv;
	}
	// 요금제 변경 완료 
	@PostMapping("planChange")
	public ModelAndView setPlanChange(BillVO billVO,HttpSession session, Integer memberNum) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = planService.setPlanChange(billVO);

		MemberVO sessionMember = (MemberVO)session.getAttribute("memberVO");
		memberNum = sessionMember.getMemberNum();

		PlanVO phoneNum = planService.getBeforePlan(memberNum);
		
		 // 세션에서 선택한 요금제 데이터 삭제
	    session.removeAttribute("planVO");

		mv.addObject("phoneNum", phoneNum);
		mv.setViewName("hworld/planResult");
		
		

		return mv;
	}
	
	//위약금 조회
	@ResponseBody
	@GetMapping("checkCancelFee")
	public Map<String, Object> getCheckCancleFee(@RequestParam Map<String, Object> params, HttpSession session) throws Exception{
		
		params.put("serialNum", Integer.parseInt((String)params.get("serialNum")));
		params.put("requestCode", Integer.parseInt((String)params.get("requestCode")));
		
		String nowDateStr = (String) params.get("nowDate");
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        params.put("nowDate", sdf.parse(nowDateStr));

		planService.getCheckCancelFee(params);

		return params;
	}
	
	//타통신사 조회
	@ResponseBody
	@PostMapping("otherTelecom")
	public boolean isOtherTelecom(String taPhoneNum, String telecomName) throws Exception{
		return planService.isOtherTelecom(taPhoneNum, telecomName);
	}
	
	// 요금제 수정
	@GetMapping("planUpdate")
	public ModelAndView e2() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hworld/planUpdate");
		return modelAndView;
	}
	
	//요금제 비활성화 - 관리자는 리스트나 디테일 확인 가능 / 소비자는 확인 불가능
	@PostMapping("planDisabled")
	public ModelAndView setPlanDisabled(PlanVO planVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = planService.setPlanDisabled(planVO);
		
		mv.setViewName("redirect:./planList");
		return mv;
	}
	
	// 부가서비스 디테일
	@GetMapping("ePlanDetail")
	public ModelAndView getDetailExtraPlan(@RequestParam("extraPlanNum") String extraPlanNum, ExtraPlanVO extraPlanVO, Map<String, Object> map, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		ExtraPlanVO eplanVO = planService.getDetailExtraPlan(extraPlanVO);
		
		//세션에서 멤버넘 받아서 시리얼넘, 가져오기
		MemberVO sessionMember = (MemberVO)session.getAttribute("memberVO");
		PlanVO planVO = new PlanVO();
		
		if(sessionMember==null) {
			mv.setViewName("hworld/login");
		
		} else {
		Integer memberNum = sessionMember.getMemberNum();
		planVO =planService.getBeforePlan(memberNum);
		
		
		if(planVO==null) {
			mv.addObject("eplan", eplanVO);
			mv.setViewName("hworld/ePlanDetail");
			return mv;
		} else {
		
		map.put("memberNum", memberNum);
		map.put("serialNum", planVO.getSerialNum());
		map.put("extraPlanNum", extraPlanNum);

		map = planService.searchExtraPlan(map);
		
		mv.addObject("map",map);
		mv.addObject("eplan", eplanVO);
		mv.setViewName("hworld/ePlanDetail");
		
			}
		}
		return mv;
	}
		
	
	// 부가서비스 디테일 > 신청하기
	@PostMapping("ePlanApply")
	public ModelAndView setAddServ(@RequestParam Map<String, Object> map, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		MemberVO sessionMember = (MemberVO)session.getAttribute("memberVO");
		Integer memberNum = sessionMember.getMemberNum();
		PlanVO planVO =planService.getBeforePlan(memberNum);
		
		if (planVO == null || planVO.getSerialNum() == null) {
	        // serialNum이 없는 경우, 클라이언트에게 메시지를 보냅니다.
			String message="휴대폰 개통 및 회선 등록 후 사용 가능합니다.";
			
			mv.addObject("url", "/direct/phoneList"); 
		    mv.addObject("result", message);
	        mv.setViewName("common/result");
	        return mv;
	    }
		
		map.put("phoneNum", planVO.getPhoneNum());
		map.put("serialNum", planVO.getSerialNum());

		int result=planService.setAddServ(map);

		mv.addObject("map", map);
		mv.setViewName("hworld/extraResult");
		return mv;
	}
	
	// 부가서비스 추가
	@GetMapping("ePlanAdd")
	public ModelAndView e4() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("hworld/ePlanAdd");
		return mv;
	}
	
	// 부가서비스 수정
	@GetMapping("ePlanUpdate")
	public ModelAndView e6() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("hworld/ePlanUpdate");
		return mv;
	}
	
	// 부가서비스 디테일 >> 신청 성공
	@GetMapping("planResult")
	public ModelAndView e7() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("hworld/planResult");
		return mv;
	}
	
}
