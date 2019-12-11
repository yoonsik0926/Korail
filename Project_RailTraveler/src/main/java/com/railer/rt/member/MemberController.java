package com.railer.rt.member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("member.memberController")
public class MemberController {
	
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public String loginForm(String login_error, Model model) {
		
		boolean bLoginError=login_error !=null;
		String msg="";
		if(bLoginError) {
			msg="아이디 또는 비밀번호가 일치하지 않습니다.";
			model.addAttribute("message", msg);
		}
		
		return ".member.login";
	}
	@RequestMapping(value="/member/member")
	public String memberForm() {
		return ".member.member";
	}
	@RequestMapping(value="/member/noAuthorized")
	public String noAuth() {
		// 접근 권한이 없는 경우
		return ".member.noAuthorized";
	}
	
	@RequestMapping(value="/member/expired")
	public String expired() {
		// 세션이 만료된 경우
		return ".member.expired";
	}
	
	@RequestMapping(value="/member/complete")
	public String complete(@ModelAttribute("message") String message) throws Exception{
		
		// 컴플릿 페이지(complete.jsp)의 출력되는 message와 title는 RedirectAttributes 값이다. 
		// F5를 눌러 새로 고침을 하면 null이 된다.
		
		if(message==null || message.length()==0) // F5를 누른 경우
			return "redirect:/";
		
		return ".member.complete";
	}
	
}

