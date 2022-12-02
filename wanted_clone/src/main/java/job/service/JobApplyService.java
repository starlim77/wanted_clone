package job.service;

import java.util.List;

import job.bean.JobApplyDTO;


public interface JobApplyService {

	public List<JobApplyDTO> getJobApply(String id);

	public void profileApply(JobApplyDTO jobApplyDTO);

	public String getCount(String id);


}
