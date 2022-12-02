package insight.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import insight.dto.InsightDTO;

@Repository
@Transactional
public class InsightDAOMyBatis implements InsightDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<InsightDTO> insightList(String insightSort) {
		System.out.println(insightSort);
		return sqlSession.selectList("insightSQL.insightList", insightSort);
	}

}
