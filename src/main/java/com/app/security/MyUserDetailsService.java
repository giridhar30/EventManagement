package com.app.security;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.app.dao.UserDAO;
import com.app.model.User;

@Service
public class MyUserDetailsService implements UserDetailsService {

	@Autowired
	private UserDAO userDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<User> user = userDao.findByMailId(username);
        user.orElseThrow(() -> new UsernameNotFoundException("Mail Id not yet registered!"));

        return user.map(MyUserDetails::new).get();
    }

}
