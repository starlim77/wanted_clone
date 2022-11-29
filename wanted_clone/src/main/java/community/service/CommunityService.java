package community.service;

import java.util.List;

import community.bean.CommentDTO;
import community.bean.CommunityDTO;

public interface CommunityService {

	public String checkId();

	public List<CommunityDTO> bestBoard(String pg);

	public List<CommunityDTO> boardList(String scrollPg);

	public void boardWrite(CommunityDTO communityDTO);

	public CommunityDTO getBoard(int seq);

	public List<CommentDTO> getComment(int seq);

}
