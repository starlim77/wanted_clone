package job.dao;

import java.util.List;

import job.bean.JobApplyDTO;

public interface JobApplyDAO {

	public List<JobApplyDTO> getJobApply(String id);

	public void profileApply(JobApplyDTO jobApplyDTO);


}
