package community.service;

import java.util.List;

import community.bean.CommunityDTO;

public interface CommunityService {

	public String checkId();

	public List<CommunityDTO> bestBoard(String pg);

	public List<CommunityDTO> boardList(String scrollPg);

}
