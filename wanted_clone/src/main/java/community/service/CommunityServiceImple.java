package community.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import community.bean.CommunityDTO;
import community.dao.CommunityDAO;

@Service
public class CommunityServiceImple implements CommunityService {

	@Autowired
	private CommunityDAO communityDAO;

	@Autowired
	private HttpSession session;
	
	@Override
	public String checkId() {
		
		String name = (String) session.getAttribute("name");
		if(name != null) {
			return name;
		}else
			return "";
	}

	@Override
	public List<CommunityDTO> bestBoard(String pg) {
		
		return communityDAO.bestBoard(pg);
	}

	@Override
	public List<CommunityDTO> boardList(String scrollPg) {
		return communityDAO.boardList(scrollPg);
	}

	@Override
	public void boardWrite(CommunityDTO communityDTO) {
		String id = (String) session.getAttribute("id");
		communityDTO.setId_(id);
		
		communityDAO.boardWrite(communityDTO);
	}

}
