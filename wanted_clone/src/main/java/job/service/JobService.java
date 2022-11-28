package job.service;

import java.util.List;

import job.bean.JobDTO;

public interface JobService {

	public List<JobDTO> getJobList();

	public List<JobDTO> moreJobList(String scrollPg);

	JobDTO jobBoard(String seq);

	
	
}
