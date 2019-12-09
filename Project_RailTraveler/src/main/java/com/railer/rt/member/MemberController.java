package com.railer.rt.member;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("member.memberController")
public class MemberController {
	
	@RequestMapping(value="/member/member", method=RequestMethod.GET)
	public String memberForm(Model model) {
		model.addAttribute("mode", "member");
		return ".member.member";
	}

	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public String loginForm() {
		return ".member.login";
	}
	
	@RequestMapping(value="/member/update", method=RequestMethod.GET)
	public String updateForm(Model model) throws Exception {
		model.addAttribute("mode", "update");
		return ".member.member";
	}
	@RequestMapping(value="/member/pwd", method=RequestMethod.GET)
	public String pwdForm(
			String dropout,
			Model model) {
		
		if(dropout==null) {
			model.addAttribute("mode", "update");
		} else {
			model.addAttribute("mode", "dropout");
		}
		
		return ".member.pwd";
	}
	
	@RequestMapping(value="/member/pwdFind", method=RequestMethod.GET)
	public String pwdFindForm(HttpSession session) throws Exception {
		
		return ".member.pwdFind";
	}
}

