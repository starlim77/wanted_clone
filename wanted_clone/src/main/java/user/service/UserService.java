package user.service;

import user.bean.UserDTO;

public interface UserService {
	
	public UserDTO checkId(String id);

	public UserDTO login(UserDTO userDTO);

	public void signUp(UserDTO userDTO);

	public String smsCertify(String tel);

	public void logout();

	public String naverLoginUrl();

	public String getNaverInformation(String code, String state);
}
