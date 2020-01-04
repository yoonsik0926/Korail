package com.railer.rt.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.railer.rt.member.Member;
import com.railer.rt.member.MemberService;
import com.railer.rt.member.SessionInfo;


// 로그인 성공후 세션 및 쿠키등의 처리를 할 수 있다.
// 로그인 전 정보를 Cache : 로그인 되지 않은 상태에서 로그인 상태에서만 사용할 수 있는 페이지로 이동할 경우 로그인 페이지로 이동하고 로그인 후 로그인 전 페이지로 이동
public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	private RequestCache requestCache = new HttpSessionRequestCache();
    private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();
    private String defaultUrl;
	
	@Autowired
	private MemberService memberService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication authentication)
			throws ServletException, IOException {
		HttpSession session=request.getSession();
		
		
		try {
			// 로그인 날짜 변경
			memberService.updateLastLogin(authentication.getName());
			
			memberService.updateFailureCountReset(authentication.getName());
		} catch (Exception e) {
		}
		
		// 로그인 정보 저장
		Member member=memberService.readMember(authentication.getName());
		SessionInfo info=new SessionInfo();
		info.setUserId(member.getUserId());
		info.setUserName(member.getUserName());
		info.setUserNum(member.getUserNum());
		
		session.setAttribute("member", info);	

		resultRedirectStrategy(request, response, authentication);
	}
	
	protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        
        SavedRequest savedRequest = requestCache.getRequest(request, response);
        
         HttpSession session = request.getSession();
         Object object = session.getAttribute("realPath");
         

         if(object != null) {
        	 defaultUrl = (String) object;
         }
         
        
        if(savedRequest!=null) {
        	// 권한이 필요한 페이지에 접근했을 경우(게시판 등)
            String targetUrl = savedRequest.getRedirectUrl();
            redirectStratgy.sendRedirect(request, response, targetUrl);
        } else {
        	// 직접 로그인 url로 이동했을 경우
            redirectStratgy.sendRedirect(request, response, defaultUrl);
        }
    }
	
	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}	
}
