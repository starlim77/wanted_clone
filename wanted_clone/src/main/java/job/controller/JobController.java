package job.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import job.bean.JobApplyDTO;
import job.bean.JobDTO;
import job.dao.JobApplyDAO;
import job.service.JobApplyService;
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
	@Autowired
	private JobApplyService jobApplyService;
	@Autowired
	private JobApplyDAO jobApplyDAO;


	@RequestMapping(value = "jobList")
	public ModelAndView jobList(@RequestParam(required = false) String jobsort ){
		List<JobDTO> jobList = null;
		//System.out.println(jobsort);
		if(jobsort == null){
			jobList = jobService.getJobList();
		}else{
			jobList = jobService.getJobSortList(jobsort);
		}

		List<String> positionList = jobService.positionList();

		ModelAndView mav = new ModelAndView();
		mav.addObject("jobList",jobList);
		mav.addObject("positionList",positionList);
		mav.setViewName("job/jobList");

		return mav;
	}

	@RequestMapping(value = "moreJobList")
	@ResponseBody
	public List<JobDTO> moreJobList(@RequestParam String seq, @RequestParam(required = false) String jobsort ){
		//System.out.println(seq);
		if(jobsort == null) {
			return jobService.moreJobList(seq);
		}else {
			return jobService.moreJobList(seq, jobsort);
		}
	}

	@RequestMapping(value = "jobBoard")
	public ModelAndView jobBoard(@RequestParam String seq) {

		JobDTO jobDTO = jobService.jobBoard(seq);
		//System.out.println(jobDTO);
		List<ResumeDTO> list = resumeService.getAllResumeList();
		List<JobDTO> jobList = jobService.jobBoardJobList(seq);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("jobList", jobList);
		mav.addObject("jobDTO", jobDTO);
		mav.setViewName("job/jobBoard");

		return mav;
	}
	
	@RequestMapping(value = "jobBoardDelete")
	@ResponseBody
	public void jobBoardDelete(@RequestParam String seq) {
		jobService.jobBoardDelete(seq);
	}
	

	@RequestMapping(value = "profile")
	public ModelAndView profile(@RequestParam(required =false) String id) {
		ModelAndView mav = new ModelAndView();
		if(id != null) {
			List<JobApplyDTO> list = jobApplyService.getJobApply(id);
			String count = jobApplyService.getCount(id);
			
			mav.addObject("list", list);
			mav.addObject("count", count);
		}
		mav.setViewName("job/profile");
		return mav;
	}
	@RequestMapping(value = "profileApply")
	@ResponseBody
	public void profileApply(@ModelAttribute JobApplyDTO jobApplyDTO) {
		System.out.println(jobApplyDTO);
		jobApplyDAO.profileApply(jobApplyDTO);
	}
	
	
	
}
