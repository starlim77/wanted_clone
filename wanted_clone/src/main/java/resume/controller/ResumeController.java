package resume.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "resume")
public class ResumeController {
	
	@GetMapping(value = "/")
	public String resume() {
		return "resume/resume";
	}
	
	@GetMapping(value = "resumeForm")
	public String resumeForm() {
		return "resume/resumeForm";
	}
}
