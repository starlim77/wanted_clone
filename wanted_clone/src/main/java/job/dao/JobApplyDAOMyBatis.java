package job.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import job.bean.JobApplyDTO;
import job.service.JobApplyService;
@Repository
@Transactional
public class JobApplyDAOMyBatis implements JobApplyDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<JobApplyDTO> getJobApply(String id) {
		
		return sqlSession.selectList("jobApplySQL.getJobApply",id);
	}

	@Override
	public void profileApply(JobApplyDTO jobApplyDTO) {
		sqlSession.insert("jobApplySQL.profileApply",jobApplyDTO);
	}
	
	@Override
	public String getCount(String id) {
		return sqlSession.selectOne("jobApplySQL.getCount",id);
	}

}
