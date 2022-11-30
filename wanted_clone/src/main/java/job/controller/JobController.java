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
		List<String> positionList = jobService.positionList();		
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("jobList",jobList);
		mav.addObject("positionList",positionList);
		mav.setViewName("job/jobList");
		
		return mav;		
	}
	
	@RequestMapping(value = "moreJobList")
	@ResponseBody
	public List<JobDTO> moreJobList(@RequestParam String seq){
		System.out.println(seq);
		return jobService.moreJobList(seq);
	}
	
	
	@RequestMapping(value = "jobBoard")
	public ModelAndView jobBoard(@RequestParam String seq) {
		
		JobDTO jobDTO = jobService.jobBoard(seq);
		List<ResumeDTO> list = resumeService.getAllResumeList();
		List<JobDTO> jobList = jobService.jobBoardJobList(seq);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("jobList", jobList);
		mav.addObject("jobDTO", jobDTO);
		mav.setViewName("job/jobBoard");
		
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
}
