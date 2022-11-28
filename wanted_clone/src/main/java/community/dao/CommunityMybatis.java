package community.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import community.bean.CommentDTO;
import community.bean.CommunityDTO;

@Repository
@Transactional
public class CommunityMybatis implements CommunityDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<CommunityDTO> bestBoard(String pg) {
		int endNum =  (Integer.parseInt(pg)) * 3;
		int startNum = endNum - 2;
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		return sqlSession.selectList("communitySQL.bestBoard",map);
	}

	@Override
	public List<CommunityDTO> boardList(String scrollPg) {
		int endNum = (Integer.parseInt(scrollPg)) * 10;
		int startNum = endNum - 9;
		
//		System.out.println("startNum = " + startNum + " endNum = " + endNum);
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("communitySQL.boardList",map);
	}

	@Override
	public void boardWrite(CommunityDTO communityDTO) {
		sqlSession.insert("communitySQL.boardWrite",communityDTO);
	}

	@Override
	public CommunityDTO getBoard(int seq) {

		return sqlSession.selectOne("communitySQL.getBoard",seq);
	}

	@Override
	public List<CommentDTO> getComment(int seq) {

		return sqlSession.selectList("communitySQL.getComment",seq);

	}

}
