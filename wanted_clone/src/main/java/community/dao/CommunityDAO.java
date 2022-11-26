package community.dao;

import java.util.List;

import community.bean.CommunityDTO;

public interface CommunityDAO {

	public List<CommunityDTO> bestBoard(String pg);

	public List<CommunityDTO> boardList(String scrollPg);

	public void boardWrite(CommunityDTO communityDTO);

}
