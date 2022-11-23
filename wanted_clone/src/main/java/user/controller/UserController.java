package user.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import user.bean.UserDTO;
import user.dao.UserDAO;


@Component
@Controller
@RequestMapping(value="views")
public class UserController {
	
	@Autowired
	UserDAO userDAO;
	
//	@GetMapping(value="/user/writeForm")
	@GetMapping(value="list")
	public void writeForm(@ModelAttribute UserDTO userDTO, Model model) {
		
		userDAO.write(userDTO);
	}

}







