package com.yc.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {
	
	
	@RequestMapping(value="/index.action")
	public String index(){
		return "/page/shouye";
		//return "/WEB-INF/page/login.jsp";
	}
	
	
	@RequestMapping(value="/toRegister.action")
	public String toRegister(){
		return "/page/register";
	}
}







































