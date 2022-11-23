package community.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="community")
public class CommunityController {

	@GetMapping(value="communityForm")
	public String communityForm() {
		return "/community/communityForm";
	}
	
	
}
