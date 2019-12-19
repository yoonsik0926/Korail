package com.railer.rt.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.railer.rt.mail.Mail;
import com.railer.rt.mail.MailSender;


@Controller("member.memberController")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder bcryptEncoder;	
	
	@Autowired
	private MailSender mailSender;
	
	@RequestMapping(value="/member/member", method=RequestMethod.GET)
	public String memberForm(Model model) {
		
		model.addAttribute("mode","member");
		return ".member.member";
	}
	
	@RequestMapping(value="/member/member", method=RequestMethod.POST)
	public String memberSubmit(Member dto,
			final RedirectAttributes reAttr,
			Model model) {

		try {
			//패스워드 암호화
			String encPwd = bcryptEncoder.encode(dto.getUserPwd());
			dto.setUserPwd(encPwd);
			
			service.insertMember(dto);
		} catch (Exception e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "아이디 중복으로 회원가입이 실패했습니다.");
				
			return ".member.member";
		}
		
		StringBuilder sb=new StringBuilder();
		sb.append(dto.getUserName()+ "님의 회원 가입이 정상적으로 처리되었습니다.<br>");
		sb.append("당신만의 내일로 여행 계획을 RailTraveler와 함께 만들어보세요 ! <br>");
		
		String title = "회원 가입 완료 !";
		
		reAttr.addFlashAttribute("title", title);
        reAttr.addFlashAttribute("message", sb.toString());
        reAttr.addFlashAttribute("button","login");
		
		return "redirect:/member/complete";
	}
	
	@RequestMapping(value="/member/complete")
	public String complete(@ModelAttribute("message") String message) throws Exception{
		
		// 컴플릿 페이지(complete.jsp)의 출력되는 message와 title는 RedirectAttributes 값이다. 
		// F5를 눌러 새로 고침을 하면 null이 된다.
		
		if(message==null || message.length()==0) // F5를 누른 경우
			return "redirect:/";
		
		return ".member.complete";
	}
	
	@RequestMapping(value="/member/userIdCheck", method=RequestMethod.GET)
	public Map<String, Object> idCheck(
			@RequestParam(value="userId") String userId
			) throws Exception {
		
		String p="true";
		Member dto=service.readMember(userId);
		if(dto!=null)
			p="false";
		
		Map<String, Object> model=new HashMap<>();
		model.put("passed", p);
		return model;
	}
	
/*	@RequestMapping(value="/member/login", method=RequestMethod.GET)*/
	@RequestMapping(value="/member/login")
	public String loginForm() throws Exception {		
		
		return ".member.login";
	}

	@RequestMapping(value="/member/noAuthorized")
	public String noAuth() throws Exception {
		// 접근 권한이 없는 경우
		return ".member.noAuthorized";
	}
	
	@RequestMapping(value="/member/expired")
	public String expired() throws Exception {
		// 세션이 만료된 경우
		return ".member.expired";
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
	
	@RequestMapping(value="/member/pwd", method=RequestMethod.POST)
	public String pwdSubmit(
			@RequestParam String userPwd,
			@RequestParam String mode,
			final RedirectAttributes reAttr,
			Model model,
			HttpSession session) {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Member dto = service.readMember(info.getUserId());
		if(dto==null) {
			session.invalidate();
			return "redirect:/";
		}
		
		//패스워드 검사
		boolean bPwd = bcryptEncoder.matches(userPwd, dto.getUserPwd());
		
		if(! bPwd) {
			if(mode.equals("update")) {
				model.addAttribute("mode", "update");
			} else {
				model.addAttribute("mode", "dropout");
			}
			model.addAttribute("message", "패스워드가 일치하지 않습니다.");
			return ".member.pwd";
		}
		
		// 회원정보수정폼
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		return ".member.member";
	}
	
	@RequestMapping(value="/member/update", method=RequestMethod.POST)
	public String updateSubmit(
			Member dto,
			final RedirectAttributes reAttr,
			Model model) {
		
		try {
			String encPwd = bcryptEncoder.encode(dto.getUserPwd());
			dto.setUserPwd(encPwd);
			
			service.updateMember(dto);
		} catch (Exception e) {
		}
		
		StringBuilder sb=new StringBuilder();
		sb.append(dto.getUserName()+ "님의 회원정보가 정상적으로 변경되었습니다.<br>");
		sb.append("메인화면으로 이동 하시기 바랍니다.<br>");
		
		String title = "회원 정보 수정 완료 !";
		
		reAttr.addFlashAttribute("title", title);
		reAttr.addFlashAttribute("message", sb.toString());
		reAttr.addFlashAttribute("button","main");
		
		return "redirect:/member/complete";
		
	}

	@RequestMapping(value="/member/pwdFind", method=RequestMethod.GET)
	public String pwdFind() {
		return ".member.pwdFind";
	}
	
	@RequestMapping(value="/member/pwdFind", method=RequestMethod.POST)
	public String pwdFindSubmit(
			@RequestParam String userId,
			final RedirectAttributes reAttr,
			Model model
			) throws Exception{
		
		Member dto = service.readMember(userId);
		if(dto == null) {
			model.addAttribute("message","아이디가 일치하지 않습니다.");
			return ".member.pwdFind";
		}
		
		Mail mail = new Mail();
		mail.setSenderEmail("railtraveler12@gmail.com");
		mail.setSenderName("레일 트레블러");
		mail.setReceiverEmail(dto.getEmail());
		
		String newPwd = "";
		char[] c = new char[3];
		int[] num = new int[3];
		
		for(int i = 0;i<3;i++) {
			c[i] = (char)((Math.random()*26)+65);
			num[i] = (int)(Math.random()*10)+1;
		}
		String p1 = String.valueOf(c);
		String p2 = String.valueOf(num);
		String [] s = {"!","@","#","$","%","^","&","*"};
		
		int j = (int)(Math.random()*7);
		String p3 = s[j];
		
		newPwd = p1+p2+p3;
		
		StringBuilder sb=new StringBuilder();
		sb.append("새로운 비밀번호는  "+newPwd+" 입니다.");
		sb.append("Rail Traveler 서비스를 이용하려면 해당 비밀번호로 재로그인 해주세요.");
		
		mail.setContent(sb.toString()); //내용
		mail.setSubject("Rail Traveler 비밀번호 찾기 결과");
		
		boolean b = mailSender.mailSend(mail);
		String title = null;
		String msg="<span style='color:blue;'>"+dto.getUserName()+"</span> 님에게<br>";
		String encPwd = null;
		
		if(b) {
			msg+="해당 메일로 새로운 비밀번호를 성공적으로 전송 했습니다.";
			title = "비밀번호 찾기 성공 !";
			
			encPwd = bcryptEncoder.encode(newPwd);
			dto.setUserPwd(encPwd);
			try {
				service.updateMember(dto);
			} catch (Exception e) {
			}
		} else {
			title = "비밀번호 찾기 실패 !";
			msg+="메일을 전송하는데 실패했습니다.";
		}
		
		reAttr.addFlashAttribute("title", title);
		reAttr.addFlashAttribute("message", msg);
		
		
		return "redirect:/member/complete";
	}
	
	
	
	@RequestMapping(value="/member/idFind" , method=RequestMethod.GET)
	public String idFind() {
		
		return ".member.idFind";
	}
	
	@RequestMapping(value="/member/idFind", method=RequestMethod.POST)
	public String idFindSubmit(
			@RequestParam String email,
			@RequestParam String birth,
			final RedirectAttributes reAttr,
			Model model) {
		Member dto = null;
		Map<String, Object> map = new HashMap<>();
		map.put("email", email);
		map.put("birth", birth);
		
		try {
			dto = service.findId(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		if(dto==null) {
			model.addAttribute("message", "해당 회원정보가 존재하지 않습니다.");
			return ".member.idFind";
		}
		
		StringBuilder sb=new StringBuilder();
		sb.append("회원님의 아이디는 <b>"+dto.getUserId()+"</b>입니다.");
		
		String title = "아이디 찾기 성공 !";
		
		reAttr.addFlashAttribute("title", title);
        reAttr.addFlashAttribute("message", sb.toString());
        reAttr.addFlashAttribute("button","pwdFind");
		
		
        return "redirect:/member/complete";
	}
	
	@RequestMapping(value="/member/deleteMember", method= RequestMethod.GET)
	public String deleteMember(
/*			@RequestParam String userId,*/
			HttpSession session,
			final RedirectAttributes reAttr) {

		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("enabled", 0);
			map.put("userId",info.getUserId());
			
			service.updateEnabled(map);
			
			Member dto = new Member();
    		dto.setUserId(info.getUserId());
    		dto.setStateCode(2);
    		dto.setMemo("회원 탈퇴");
    		service.insertMemberState(dto);
    		
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 세션 정보 삭제
		session.removeAttribute("member");
		session.invalidate();

		StringBuilder sb=new StringBuilder();
		sb.append("회원 탈퇴 처리가 정상적으로 처리되었습니다.<br>");
		sb.append("그동안 Rail Traveler를 이용해주셔서 감사합니다.<br>");
					
		reAttr.addFlashAttribute("title", "회원 탈퇴 성공!");
		reAttr.addFlashAttribute("message", sb.toString());
					
		return "redirect:/member/complete";
	}
	
}

