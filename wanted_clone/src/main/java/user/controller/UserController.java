package user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import user.bean.UserDTO;
import user.service.UserService;

//@Controller
@RequestMapping(value = "user")
@Component
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "loginForm")
	public ModelAndView loginForm() {

		String naverAuthUrl = userService.naverLoginUrl();
		ModelAndView mav = new ModelAndView();
		mav.addObject("url", naverAuthUrl);
		mav.setViewName("user/loginForm");

		return mav;
	}

	@RequestMapping(value = "checkId")
	@ResponseBody
	public UserDTO checkId(@RequestParam String id) {
		return userService.checkId(id);
	}

	@RequestMapping(value = "login")
	@ResponseBody
	public UserDTO login(@ModelAttribute UserDTO userDTO) {
		return userService.login(userDTO);
	}

	@RequestMapping(value = "signUp")
	@ResponseBody
	public void signUp(@ModelAttribute UserDTO userDTO) {
		userService.signUp(userDTO);
	}

	@RequestMapping(value = "smsCertify")
	@ResponseBody
	public String smsCertify(@RequestParam String tel) {
		return userService.smsCertify(tel);
	}

	@RequestMapping(value = "logout")
	public String signUp() {
		userService.logout();
		return "index";
	}
}
