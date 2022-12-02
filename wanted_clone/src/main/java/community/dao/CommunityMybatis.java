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
		CommunityDTO communityDTO = sqlSession.selectOne("communitySQL.getBoard",seq);	
		sqlSession.update("communitySQL.viewCount",seq);
		return communityDTO;
		
	}

	@Override
	public List<CommentDTO> getComment(int seq) {

		return sqlSession.selectList("communitySQL.getComment",seq);

	}

	@Override
	public void deleteBoard(int seq) {
		sqlSession.delete("communitySQL.deleteBoardForm",seq);
		sqlSession.delete("communitySQL.deleteBoardComment",seq);
		
	}

	@Override
	public void updateBoard(int seq, String title, String content) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("seq", Integer.toString(seq));
		map.put("title", title);
		map.put("content_", content);
		sqlSession.update("communitySQL.updateBoard",map);
		
		
	}

	@Override
	public void commentWrite(CommentDTO commentDTO) {
		sqlSession.insert("communitySQL.commentWrite",commentDTO);
		String seq = commentDTO.getSeq();
		sqlSession.update("communitySQL.commentUp",seq);
		
	}

	@Override
	public void likeBtn(String like,String seq) {
		boolean check = Boolean.parseBoolean(like);
		if(check) {
			sqlSession.update("communitySQL.likeUp",seq);
		}else {
			sqlSession.update("communitySQL.likeDown",seq);
		}
		
		
	}

}
