package job.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import job.bean.JobDTO;

@Repository
@Transactional
public class JobDAOMyBatis implements JobDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<JobDTO> getJobList() {
		List<JobDTO> joblist = sqlSession.selectList("jobSQL.getJobList");
		return joblist;
	}
}
