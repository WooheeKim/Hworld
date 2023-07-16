package com.hworld.base.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hworld.base.dao.CartDAO;
import com.hworld.base.service.CartService;
import com.hworld.base.service.MemberService;
import com.hworld.base.vo.ApplicationVO;
import com.hworld.base.vo.CartVO;
import com.hworld.base.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
		@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	private CartService cartService;
	
	////회원가입 파트
	//회원 확인 - 페이지 이동
	@GetMapping("precheck")
	public ModelAndView getPrecheck() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("hworld/signUpPrecheck");
		return mv;
	}
	
	//회원 확인 - 결과 전송
	@PostMapping("precheck")
	public ModelAndView getPrecheck(MemberVO memberVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> result = memberService.getPrecheck(memberVO);
		
		Integer state = (Integer)result.get("state");
		MemberVO account = (MemberVO)result.get("account");

		//응답 구분
		switch(state) {
			case 1: //(state=1)주민번호 일치x
				//신청서를 낸적 없는 회원. 회선 가입정보 없음. 홈페이지만 회원 가입하려는 회원 -> 회원가입(signUp) 페이지로
				log.error("case 1");
				log.error("========================== state: {} ", state);
				break;
			case 2: //(state=2)주민번호 일치o, 이름 일치x
				//일치하는 회원정보가 없다고 표시
				log.error("case 2");
				log.error("========================== state: {} ", state);
				log.error("========================== account's RRNF: {} ", account.getRrnf());
				log.error("========================== account's RRNL: {} ", account.getRrnl());
				break;
			case 3: //(state=3)주민번호, 이름 일치o, id/pw == null
				//신청서를 낸적 있는 회원. 회선 가입정보 있음. 기존에 입력된 정보 보여주고 id/pw 입력받기
				log.error("case 3");
				log.error("========================== state: {} ", state);
				log.error("========================== account's RRNF: {} ", account.getRrnf());
				log.error("========================== account's RRNL: {} ", account.getRrnl());
				log.error("========================== account's NAME: {} ", account.getName());
				log.error("========================== account's address: {} ", account.getAddress1());
				break;
			case 4: //(state=4)주민번호, 이름 일치o, id/pw != null
				//홈페이지에 가입한적 있는 기존 회원. 가입된 회원정보가 있으니 로그인 페이지로 넘기기
				log.error("case 4");
				log.error("========================== state: {} ", state);
				log.error("========================== account's RRNF: {} ", account.getRrnf());
				log.error("========================== account's RRNL: {} ", account.getRrnl());
				log.error("========================== account's NAME: {} ", account.getName());
				log.error("========================== account's RRNF: {} ", account.getEmail());
				log.error("========================== account's RRNF: {} ", account.getPw());
				log.error("========================== account's address: {} ", account.getAddress1());
				break;
		}
		
		mv.addObject("result", result);
		mv.setViewName("hworld/signUpPrecheckResult");
		return mv;
	}
	
	
	//회원 가입 - 페이지 이동
	@GetMapping("signUp")
	//requestParam : 요청 들어온 파라미터를 맵핑해줌
	public ModelAndView setMemberAdd(@RequestParam Map<String, Object> map) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//opt1 = state값, opt2 = memberNum값
		mv.addObject("map", map);
		mv.setViewName("hworld/signUp");
		return mv;
	}
	
	//회원 가입 - 결과 전송
	@PostMapping("signUp")
	public ModelAndView setMemberAdd(MemberVO memberVO, Integer opt1, Integer opt2) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = memberService.setMemberAdd(memberVO, opt1, opt2);
		
		mv.setViewName("hworld/signUpSuccess");
		
		return mv;
		
	}
	
	
	
	
	////로그인&아웃 파트
	
	
	// 로그인 했을 때 대표 회선 정보가 없을 때 뜨는 페이지
	@GetMapping("loginFirst")
	public ModelAndView m2() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hworld/loginFirst");
		return modelAndView;
	}
	
	// 계정 활성화 페이지
	@GetMapping("loginDormantAccount")
	public ModelAndView m3() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hworld/loginDormantAccount");
		return modelAndView;
	}
	
	// 계정 활성화 페이지 - 등록된 이메일로 임시 비밀번호 발송했다는 페이지
	@GetMapping("loginDormantAccountResult")
	public ModelAndView m4() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hworld/loginDormantAccountResult");
		return modelAndView;
	}
	
	// 계정정보 찾기 페이지(Get)
	@GetMapping("forgot")
	public ModelAndView forgot() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hworld/forgot");
		return modelAndView;
	}
	
	//아이디 찾기 페이지(Get)
	@GetMapping("forgotId")
	public ModelAndView getForgotId(HttpServletRequest request, MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("hworld/forgotId");
		return mv;
	}
	
	//아이디 찾기 페이지 조회결과(post)
	@PostMapping("forgotId")
	public ModelAndView getForgotId(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		log.error(" ::::::::::::::::: {}", memberVO.getName());
		log.error(" ::::::::::::::::: {}", memberVO.getRrnf());
		log.error(" ::::::::::::::::: {}", memberVO.getRrnl());
		
		MemberVO data = memberService.getSearchId(memberVO);
		
		mv.addObject("memberVO", data);
		
		mv.setViewName("hworld/forgotResultEmail");
		return mv;
	}
	
	// 비밀번호 찾기 페이지(Get)
	@GetMapping("forgotPw")
	public ModelAndView forgotPw(HttpServletRequest request, MemberVO memberVO) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hworld/forgotPw");
		return modelAndView;
	}
	
	// 아이디 찾기 조회결과 페이지(Post)
//	@PostMapping("forgotResultEmail")
//	public String forgotResultEmail(HttpServletRequest request, Model model, @RequestParam(required = true, value = "name") String name, @RequestParam(required = true, value = "tel") String tel, MemberVO memberVO) throws Exception{
//		
//		try {
//		    
//			//이거 바꿔야함. tel로 검색하려면 다른방식으로.
//		    memberVO.setName(name);
//		    memberVO.setTel(tel);
//		    MemberVO memberSearch = memberService.emailSearch(memberVO);
//		    
//		    model.addAttribute("memberVO", memberSearch);
//		 
//		} catch (Exception e) {
//		    System.out.println(e.toString());
//		    model.addAttribute("msg", "오류가 발생되었습니다.");
//		}
//		
//		return "/hworld/forgotResultEmail";
//	}
	
	// 비밀번호 찾기 조회결과 페이지(Post)
	@PostMapping("forgotResultPw")
	public String forgotResultPw(HttpServletRequest request, Model model, @RequestParam(required = true, value = "name") String name, @RequestParam(required = true, value = "email") String email, MemberVO memberVO) throws Exception{
		
		try {
		    
		    memberVO.setName(name);
		    memberVO.setEmail(email);	
		    int memberSearch = memberService.memberPwCheck(memberVO);
		    
		    if(memberSearch == 0) {
		        model.addAttribute("msg", "기입된 정보가 잘못되었습니다. 다시 입력해주세요.");
		        return "/hworld/forgotPw";
		    }
		    
		    String newPw = RandomStringUtils.randomAlphanumeric(10);
		    String encodePw = pwEncoder.encode(newPw);
		    memberVO.setPw(encodePw);
		    
		    memberService.passwordUpdate(memberVO);
		    
		    model.addAttribute("newPw", newPw);
		 
		} catch (Exception e) {
		    System.out.println(e.toString());
		    model.addAttribute("msg", "오류가 발생되었습니다.");
		}
		
		return "/hworld/forgotResultPw";
	}
	
	// 이메일 중복 체크
	@PostMapping("emailCheck")
	@ResponseBody
	public String emailCheck(String email) throws Exception {
		
		int result = memberService.emailCheck(email);
		
		if(result != 0) {
			return "fail"; // 중복 아이디 존재
		} else {
			return "success"; // 중복 아이디 없음
		}
	} // memberIdCheckPOST() 종료
	
	
	
	// 이메일(아이디) 중복체크(Get)
//	@GetMapping("emailCheck")
//	@ResponseBody
//	public boolean emailCheck(MemberVO memberVO) throws Exception {
//		log.debug("============ID 중복체크============");
//		boolean check = false;
//		
//		memberVO = memberService.emailCheck(memberVO);
//		
//		if(memberVO == null) {
//			check=true;
//		}
//		
//		return check;
//	}
	
	// 로그인 페이지(Get)
	@GetMapping("login")
	public ModelAndView getMemberLogin() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hworld/login");
		return modelAndView;
	}
	
	// 로그인 페이지(Post)
	@PostMapping("login")
	public String getMemberLogin(HttpSession session, HttpServletRequest request, MemberVO memberVO, RedirectAttributes rttr) throws Exception {
		String rawPw = "";
		String encodePw = "";
		
		MemberVO membercheck = memberService.getMemberLogin(memberVO); // 제출한 아이디와 일치한 아이디가 있는지 확인
		
		if(membercheck != null) { // 일치하는 아이디 존재시
			rawPw = memberVO.getPw(); // 사용자가 제출한 비밀번호
			encodePw = membercheck.getPw(); // DB에 저장한 인코딩된 비밀번호
			
			if(true == pwEncoder.matches(rawPw, encodePw)) { // 비밀번호 일치여부 판단				
				membercheck.setPw(""); // 인코딩된 비밀번호 정보 지움				
				session.setAttribute("memberVO", membercheck); // session에 사용자의 정보 저장
				MemberVO memVo = (MemberVO) session.getAttribute("memberVO");
				List<CartVO> ar = cartService.getCartList(memVo.getMemberNum());//카트 정보 불러오기 
				CartVO cartVO = cartService.getCartCount(memVo.getMemberNum());
				session.setAttribute("cartCount", cartVO);
				
				session.setAttribute("cartInfo", ar);
				return "redirect:/"; // 메인페이지로 이동
			} else {
				rttr.addFlashAttribute("result", 0);
				return "redirect:/member/login"; // 로그인 페이지로 이동
			}
		} else {								// 일치하는 아이디가 존재하지 않을 시(로그인 실패)
			rttr.addFlashAttribute("result", 0);
			return "redirect:/member/login"; // 로그인 페이지로 이동
		} 
		
	}
	
	// 로그아웃(Get)
	@GetMapping("logout")
	public String getMemberLogout(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "redirect:/";
	} 

	
	// 회원가입 완료 페이지(Get)
	@GetMapping("signUpSuccess")
	public ModelAndView signUpSuccess() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hworld/signUpSuccess");
		return modelAndView;
	}
	
	
	

	///////////////////////////////////test login start
	//테스트용 관리자계정 로그인 버튼
	@ResponseBody
	@PostMapping("testAdmin")
	public String testAdmin(HttpSession session, MemberVO memberVO, RedirectAttributes rttr) throws Exception {

		String result = "success";
		
		MemberVO membercheck = memberService.getMemberLogin(memberVO); // 제출한 아이디와 일치한 아이디가 있는지 확인
		String rawPw = memberVO.getPw(); // 사용자가 제출한 비밀번호
		String encodePw = membercheck.getPw(); // DB에 저장한 인코딩된 비밀번호

		if(true == pwEncoder.matches(rawPw, encodePw)) { // 비밀번호 일치여부 판단				
			membercheck.setPw(""); // 인코딩된 비밀번호 정보 지움				
			session.setAttribute("memberVO", membercheck); // session에 사용자의 정보 저장
			MemberVO memVo = (MemberVO) session.getAttribute("memberVO");
			System.out.println(memVo.getMemberNum());
			List<CartVO> ar = cartService.getCartList(memVo.getMemberNum()); //카트 정보 불러오기 
			CartVO cartVO = cartService.getCartCount(memVo.getMemberNum());
			session.setAttribute("cartInfo", ar);
			session.setAttribute("cartCount", cartVO);
		} else {
			rttr.addFlashAttribute("result", 0);
			result="failure";
		}
		return result;
	}
	
	//테스트용 관리자계정 로그인 버튼
	@ResponseBody
	@PostMapping("testMember")
	public String testMember(HttpSession session, MemberVO memberVO, RedirectAttributes rttr) throws Exception {
		
		String result = "success";
		
		MemberVO membercheck = memberService.getMemberLogin(memberVO); // 제출한 아이디와 일치한 아이디가 있는지 확인
		String rawPw = memberVO.getPw(); // 사용자가 제출한 비밀번호
		String encodePw = membercheck.getPw(); // DB에 저장한 인코딩된 비밀번호
		
		
		if(true == pwEncoder.matches(rawPw, encodePw)) { // 비밀번호 일치여부 판단				
			membercheck.setPw(""); // 인코딩된 비밀번호 정보 지움				
			session.setAttribute("memberVO", membercheck); // session에 사용자의 정보 저장
			MemberVO memVo = (MemberVO) session.getAttribute("memberVO");
			System.out.println(memVo.getMemberNum());
			List<CartVO> ar = cartService.getCartList(memVo.getMemberNum());
			session.setAttribute("cartInfo", ar);
		} else {
			rttr.addFlashAttribute("result", 0);
			result="failure";
		}
		return result;
	}
	///////////////////////////////////test login finish
	

}
