package job.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

//	@Override
//	public List<JobDTO> moreJobList(String scrollPg) {
//		int endNum= (Integer.parseInt(scrollPg))*16;
//		int startNum = endNum-15;
//		
//		Map<String,Integer> map = new HashMap<String,Integer>();
//		map.put("startNum", startNum);
//		map.put("endNum", endNum);
//
//		List<JobDTO> moreJobList = sqlSession.selectList("jobSQL.moreJobList",map);
//		
//		return moreJobList;
//	}
	
	@Override
	public List<JobDTO> moreJobList(String seq) {
		
		List<JobDTO> moreJobList = sqlSession.selectList("jobSQL.moreJobList", seq);

		return moreJobList;
	}
	
	@Override
	public JobDTO jobBoard(String seq) {
		return sqlSession.selectOne("jobSQL.jobBoard", seq);
	}

	@Override
	public List<JobDTO> jobBoardJobList(String seq) {
		return sqlSession.selectList("jobSQL.jobBoardJobList",seq);
	}

	@Override
	public List<String> positionList() {
		return sqlSession.selectList("jobSQL.positionList");
	}

	@Override
	public List<JobDTO> getJobSortList(String jobsort) {
		String[] sort = jobsort.split("/");
		
		List<String> list = new ArrayList<String>();
		for(int i=0; i<sort.length; i++) {
			list.add(sort[i]);
		}
		
		return sqlSession.selectList("jobSQL.getJobSortList",list);
	}

	@Override
	public List<JobDTO> moreJobList(String seq, String jobsort) {
		String[] sort = jobsort.split("/");
		
		List<String> list = new ArrayList<String>();
		for(int i=0; i<sort.length; i++) {
			list.add(sort[i]);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq",seq);
		map.put("list",list);
		
		return sqlSession.selectList("jobSQL.moreJobListWithSort", map);
	}
	
}
