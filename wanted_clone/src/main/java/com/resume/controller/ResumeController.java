package com.resume.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "resume")
public class ResumeController {
	
	@GetMapping(value = "resume")
	public String resume() {
		return "resume/resume";
	}
}
