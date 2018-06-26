package kr.co.ducktube.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ducktube.dao.UserDao;
import kr.co.ducktube.service.interfaces.UserService;
import kr.co.ducktube.vo.form.UserSearchConditions;
import kr.co.ducktube.vo.table.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public void addNewUser(User user) {
		user.setSequence(getUserSequence());
		user.setChannelTitle(user.getNick()+"님의 채널");
		user.setChannelImgUrl("c:/songjaeho/goodman/coolguy");
		user.setChannelLongDetail(user.getChannelTitle()+"입니다.");
		userDao.addNewUser(user);
	}

	@Override
	public User getUserByConditions(UserSearchConditions condition) {
		return userDao.getUserByConditions(condition);
	}

	@Override
	public int getUserSequence() {
		return userDao.getUserSequence();
	}
}
