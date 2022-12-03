package user.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import user.bean.UserDTO;

@Repository
@Transactional
public class UserDAOMyBatis implements UserDAO {


	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public UserDTO checkId(String id) {
		UserDTO userDTO = null;
		userDTO = sqlSession.selectOne("userSQL.checkId" ,id);
		return userDTO;
	}

	@Override
	public UserDTO login(UserDTO userDTO) {
		UserDTO userDTOLogin = null;
		userDTOLogin = sqlSession.selectOne("userSQL.login", userDTO);
		return userDTOLogin;
	}

	@Override
	public void signUp(UserDTO userDTO) {
		sqlSession.insert("userSQL.signUp", userDTO);
	}

	@Override
	public void changePwd(String id, String pwd) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pwd", pwd);
		
		sqlSession.update("userSQL.changePwd", map);
	}

}
