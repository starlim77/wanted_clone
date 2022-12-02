package job.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.bean.JobApplyDTO;
import job.dao.JobApplyDAO;

@Service
public class JobApplyServiceImpl implements JobApplyService {
	@Autowired
	private JobApplyDAO jobApplyDAO;
	@Autowired
	private JobApplyService jobApplyService;
	
	@Override
	public List<JobApplyDTO> getJobApply(String id) {
		List<JobApplyDTO> list = jobApplyDAO.getJobApply(id);
		return list;
	}

	@Override
	public void profileApply(JobApplyDTO jobApplyDTO) {
		jobApplyService.profileApply(jobApplyDTO);
		
		
	}



}
