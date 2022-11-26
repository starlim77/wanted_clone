package user.dao;

import user.bean.UserDTO;

public interface UserDAO {
	
	public UserDTO checkId(String id);

	public UserDTO login(UserDTO userDTO);

	public void signUp(UserDTO userDTO);

}
