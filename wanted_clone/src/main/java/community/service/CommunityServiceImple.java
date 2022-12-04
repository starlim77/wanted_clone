package community.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import community.bean.CommentDTO;
import community.bean.CommunityDTO;
import community.dao.CommunityDAO;

@Service
public class CommunityServiceImple implements CommunityService {

	@Autowired
	private CommunityDAO communityDAO;

	@Autowired
	private HttpSession session;
	

	@Override
	public List<CommunityDTO> bestBoard(String pg) {
		
		return communityDAO.bestBoard(pg);
	}

	@Override
	public List<CommunityDTO> boardList(String scrollPg,String selected) {
		return communityDAO.boardList(scrollPg,selected);
	}

	@Override
	public void boardWrite(CommunityDTO communityDTO) {
		String id = (String) session.getAttribute("name");
		communityDTO.setId_(id);
		
		communityDAO.boardWrite(communityDTO);
	}

	@Override
	public CommunityDTO getBoard(int seq) {
		return communityDAO.getBoard(seq);
	}

	@Override
	public List<CommentDTO> getComment(int seq) {
		return communityDAO.getComment(seq);
	}

	@Override
	public void deleteBoard(int seq) {
		communityDAO.deleteBoard(seq);
		
	}

	@Override
	public void updateBoard(int seq, String title, String content) {
		communityDAO.updateBoard(seq,title,content);
		
	}

	@Override
	public void commentWrite(CommentDTO commentDTO) {
		communityDAO.commentWrite(commentDTO);
		
	}

	@Override
	public void likeBtn(String like,String seq) {
		communityDAO.likeBtn(like,seq);
		
	}

	@Override
	public List<CommunityDTO> myCommunityBoard(String id) {
		return communityDAO.myCommunityBoard(id);
	}

	@Override
	public List<CommentDTO> myCommunityComment(String id) {
		return communityDAO.myCommunityComment(id);
	}

}
