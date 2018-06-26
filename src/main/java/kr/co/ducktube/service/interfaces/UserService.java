package kr.co.ducktube.service.interfaces;

import org.springframework.transaction.annotation.Transactional;
import kr.co.ducktube.vo.form.UserSearchConditions;
import kr.co.ducktube.vo.table.User;

@Transactional
public interface UserService {

	void addNewUser(User user);
	User getUserByConditions(UserSearchConditions condition);
	int getUserSequence();
}
