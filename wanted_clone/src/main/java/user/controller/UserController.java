package user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import user.bean.UserDTO;
import user.service.UserService;

//@Controller
@RequestMapping(value = "user")
@Component
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "loginForm")
	public String loginForm() {
		return "jsp/user/loginForm";
	}
	
	@RequestMapping(value = "checkId")
	@ResponseBody
	public UserDTO checkId(@RequestParam String id) {
		return userService.checkId(id);
	}
	
	@RequestMapping(value = "login")
	@ResponseBody
	public UserDTO login(@ModelAttribute UserDTO userDTO) {
		System.out.println(userDTO.getPwd());
		return userService.login(userDTO);
	}
	
	@RequestMapping(value = "signUp")
	@ResponseBody
	public void signUp(@ModelAttribute UserDTO userDTO) {
		userService.signUp(userDTO);
	}
	
}
