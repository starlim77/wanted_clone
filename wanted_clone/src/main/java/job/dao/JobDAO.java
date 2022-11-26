package job.dao;

import java.util.List;

import job.bean.JobDTO;

public interface JobDAO {

	public List<JobDTO> getJobList();

	public List<JobDTO> moreJobList(String scrollPg);

	JobDTO jobBoard(String seq);

}
