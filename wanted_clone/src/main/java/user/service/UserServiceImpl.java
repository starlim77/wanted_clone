package user.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import user.bean.UserDTO;
import user.dao.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private HttpSession httpSession;
	
	@Override
	public UserDTO checkId(String id) {
		return userDAO.checkId(id);
	}

	@Override
	public UserDTO login(UserDTO userDTO) {
		UserDTO userDTOLogin = userDAO.login(userDTO);
		
		httpSession.setAttribute("id", userDTOLogin.getId());
		httpSession.setAttribute("name", userDTOLogin.getName());
		httpSession.setAttribute("sortnum", userDTOLogin.getSortnum());
		
		return userDAO.login(userDTO);
	}

	@Override
	public void signUp(UserDTO userDTO) {
		
		userDAO.signUp(userDTO);
	}

}
