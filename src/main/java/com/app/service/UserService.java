package com.app.service;

import java.util.Optional;

import javax.transaction.Transactional;

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
	
	@Transactional
	public boolean saveUser(User user) {	
		User already = userDao.findByMailId(user.getMailId()).orElse(null);
		if (already != null) {
			return false;
		} else {
			user.setPassword(passwordEncoder.encode(user.getPassword()));
			user.setPhone("+91" + user.getPhone());
			userDao.save(user);
			return true;
		}
	}
	
	@Transactional
	public Optional<User> findByMailId(String mailId) {
		return userDao.findByMailId(mailId);
	}

}
