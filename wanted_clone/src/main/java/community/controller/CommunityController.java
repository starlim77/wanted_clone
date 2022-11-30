package community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import community.bean.CommentDTO;
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
	
	@PostMapping(value="boardWrite")
	@ResponseBody
	public void boardWrite(@ModelAttribute CommunityDTO communityDTO) {
		
		communityService.boardWrite(communityDTO);
	}
	
	
	
	@GetMapping(value="communityBoard")
	@ResponseBody
	public ModelAndView communityBoard(@RequestParam int seq) {
		List<CommentDTO> commentList = communityService.getComment(seq);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("commentList",commentList);
		mav.setViewName("/community/communityBoard");
		
		return mav;	
	}
	
	@PostMapping(value="getBoard")
	@ResponseBody
	public CommunityDTO getBoard(@RequestParam int seq) {
		return communityService.getBoard(seq);
	}
	
	@PostMapping(value="deleteBoard")
	@ResponseBody
	public void deleteBoard(@RequestParam int seq) {
		communityService.deleteBoard(seq);
	}
	
	@PostMapping(value="updateBoard")
	@ResponseBody
	public void updateBoard(@RequestParam int seq,@RequestParam String title,@RequestParam String content_) {
		communityService.updateBoard(seq,title,content_);
	}
	
	@PostMapping(value="commentWrite")
	@ResponseBody
	public void commentWrite(@ModelAttribute CommentDTO commentDTO) {
		communityService.commentWrite(commentDTO);
	}
	
}
