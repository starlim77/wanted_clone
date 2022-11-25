package community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import community.bean.CommunityDTO;
import community.service.CommunityService;

@Controller
@RequestMapping(value="community")
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;

	@GetMapping(value="communityForm")
	public String communityForm() {
		
		return "/community/communityForm";	
	}
	
	@PostMapping(value="checkId")
	@ResponseBody
	public String checkId(){
		return communityService.checkId();
	}
	
	@PostMapping(value="bestBoard")
	@ResponseBody
	public List<CommunityDTO> bestBoard(@RequestParam("pg") String pg){
		return communityService.bestBoard(pg);
	}
	
	@PostMapping(value="boardList")
	@ResponseBody
	public List<CommunityDTO> boardList(@RequestParam("scrollPg") String scrollPg){
		
		return communityService.boardList(scrollPg);
	}
	
}
