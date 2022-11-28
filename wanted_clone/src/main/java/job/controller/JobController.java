package job.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import job.bean.JobDTO;
import job.service.JobService;
import resume.bean.ResumeDTO;
import resume.service.ResumeService;

@RequestMapping(value = "job")
@Controller
public class JobController {
	@Autowired
	private JobService jobService;
	@Autowired
	private ResumeService resumeService;
	
	@RequestMapping(value = "jobList")
	public ModelAndView jobList(){
		List<JobDTO> jobList = jobService.getJobList();
				
		ModelAndView mav = new ModelAndView();
		mav.addObject("jobList",jobList);
		mav.setViewName("job/jobList");
		
		return mav;		
	}
	
	@RequestMapping(value = "moreJobList")
	@ResponseBody
	public List<JobDTO> moreJobList(@RequestParam("scrollPg") String scrollPg){
		System.out.println( "스크롤 " +scrollPg);
		return jobService.moreJobList(scrollPg);
	}
	
	
	@RequestMapping(value = "jobBoard")
	public ModelAndView jobBoard(@RequestParam String seq) {
		JobDTO jobDTO = jobService.jobBoard(seq);
		List<ResumeDTO> list = resumeService.getAllResumeList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("jobDTO", jobDTO);
		mav.setViewName("job/jobBoard");
		
		return mav;
	}
	
	
	
	
	
	
}
