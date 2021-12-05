package com.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.app.dao.UserDAO;
import com.app.model.User;

@Service
public class UserService {
	
	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public boolean saveUser(User user) {	
		User already = userDao.findByMailId(user.getMailId()).orElse(null);
		if (already != null) {
			return false;
		} else {
			user.setPassword(passwordEncoder.encode(user.getPassword()));
			userDao.save(user);
			return true;
		}
	}

}
