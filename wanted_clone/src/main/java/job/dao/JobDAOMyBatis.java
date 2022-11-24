package job.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import job.bean.JobDTO;

public class JobDAOMyBatis implements JobDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<JobDTO> getJobList() {
		List<JobDTO> joblist = null;
		joblist = sqlSession.selectList("jobSQL.getJobList");
		return joblist;
	}
	

}
