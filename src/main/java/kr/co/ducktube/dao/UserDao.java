package kr.co.ducktube.dao;

import kr.co.ducktube.vo.form.UserSearchConditions;
import kr.co.ducktube.vo.table.User;

public interface UserDao {

	void addNewUser(User user);
	User getUserByConditions(UserSearchConditions condition);
	int getUserSequence();
	
}
