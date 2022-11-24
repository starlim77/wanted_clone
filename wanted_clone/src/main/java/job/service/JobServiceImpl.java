package job.service;

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

}
