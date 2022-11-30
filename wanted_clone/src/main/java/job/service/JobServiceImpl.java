package job.service;

import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job.bean.JobDTO;
import job.dao.JobDAO;

@Service
public class JobServiceImpl implements JobService {
	@Autowired
	private JobDAO jobDAO;
	
	@Autowired
	private HttpSession httpSession;
	
	
	@Override
	public List<JobDTO> getJobList() {
		
		return jobDAO.getJobList();
	}

	@Override
	public List<JobDTO> moreJobList(String scrollPg) {
		List<JobDTO> moreJobList = jobDAO.moreJobList(scrollPg);
		for(JobDTO jobDTO : moreJobList) {
		int reward = Integer.parseInt(jobDTO.getReward());	
		DecimalFormat df = new DecimalFormat("#,###,###");
		jobDTO.setReward(df.format(reward));
		}				
		return moreJobList;
		
	}
		
	public JobDTO jobBoard(String seq) { 
		JobDTO jobDTOBoard = jobDAO.jobBoard(seq);
//		채용보상금 컴마 표시 및 나누기
		int reward = Integer.parseInt(jobDTOBoard.getReward());
		reward = reward/2;
		DecimalFormat df = new DecimalFormat("###,###");
		jobDTOBoard.setReward(df.format(reward));
		return jobDTOBoard;
	}


}
