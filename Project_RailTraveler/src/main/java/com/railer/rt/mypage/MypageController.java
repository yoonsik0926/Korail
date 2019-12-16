package com.railer.rt.mypage;

import org.springframework.stereotype.Controller;

@Controller("mypage.mypageController")
public class MypageController {
	
	public String bookmark() {
		
		return ".mypage.bookmark";
	}
	
	
}
