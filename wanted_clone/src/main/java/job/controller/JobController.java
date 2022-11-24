package job.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import job.bean.JobDTO;
import job.service.JobService;

@RequestMapping(value = "job")
@Component
public class JobController {
	@Autowired
	private JobService jobService;
	
	@RequestMapping(value = "jobList")
	public String jobList(){
		List<JobDTO> joblist = jobService.getJobList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject(joblist);
		
		return "job/jobList";
		
	}
}
