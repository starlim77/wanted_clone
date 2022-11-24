package job.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import job.bean.JobDTO;
import job.service.JobService;

@RequestMapping(value = "job")
@Controller
public class JobController {
	@Autowired
	private JobService jobService;
	
	@RequestMapping(value = "jobList")
	public ModelAndView jobList(){
		List<JobDTO> jobList = jobService.getJobList();
		
		for(JobDTO job : jobList) {
			System.out.print(job.getSeq());
			System.out.print(job.getLogtime());
			System.out.println();
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("jobList",jobList);
		mav.setViewName("job/jobList");
		
		return mav;
		
	}
}
