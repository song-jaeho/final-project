package kr.co.ducktube.web.controller.data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ducktube.service.interfaces.UserService;
import kr.co.ducktube.vo.form.UserSearchConditions;
import kr.co.ducktube.vo.table.User;

@Controller
@RequestMapping("/user")
public class UserDataController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/membership")
	@ResponseBody
	public User addNewMembership(@RequestBody User user) {

		if(user.getEmail().isEmpty() || user.getEmail() == null) {
			return null;
		}
		if(user.getName().isEmpty() || user.getName() == null) {
			return null;
		}		
		if(user.getNick().isEmpty() || user.getNick() == null) {
			return null;
		}
		if(user.getPassword().isEmpty() || user.getPassword() == null) {
			return null;
		}
		if(user.getAddress().isEmpty() || user.getPassword() == null) {
			return null;
		}
		if(user.getGender().isEmpty() || user.getGender() == null) {
			return null;
		}
		if (userService.getUserByConditions(new UserSearchConditions("이메일", user.getEmail())) != null) {
			return null;
		}
		if (userService.getUserByConditions(new UserSearchConditions("닉네임", user.getNick())) != null) {
			return null;
		}
		userService.addNewUser(user);
		return userService.getUserByConditions(new UserSearchConditions("이메일", user.getEmail()));
	}
	
	@RequestMapping("/nicknameCheck")
	@ResponseBody
	public User nicknameCheck(@RequestBody String nickname) {
		UserSearchConditions searchCondition = new UserSearchConditions("닉네임", nickname);
		return userService.getUserByConditions(searchCondition); 
	}
	
	@RequestMapping("/emailCheck")
	@ResponseBody
	public User emailCheck(@RequestBody String email) {
		UserSearchConditions searchCondition = new UserSearchConditions("이메일", email);	
		return userService.getUserByConditions(searchCondition);
	}
}
