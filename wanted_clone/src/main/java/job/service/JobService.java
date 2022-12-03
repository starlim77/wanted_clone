package job.service;

import java.util.List;

import job.bean.JobDTO;

public interface JobService {

	public List<JobDTO> getJobList();

	public List<JobDTO> moreJobList(String seq);

	public JobDTO jobBoard(String seq);

	public List<JobDTO> jobBoardJobList(String seq);

	public List<String> positionList();

	public List<JobDTO> getJobSortList(String jobsort);

	public List<JobDTO> moreJobList(String seq, String jobsort);

	public void jobBoardDelete(String seq);



}
