package com.main.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import user.service.UserService;



@Controller
public class HomeController {
	
	@Autowired
	private UserService userService;
	
	
	
	@RequestMapping(value = "/")
	public String index(@RequestParam(required = false) String code, @RequestParam(required = false) String state) {
		
		if(code!=null && state!=null) {
			userService.getNaverInformation(code, state);
		}
		code=null;
		state=null;
		
		return "index";
	}
}
