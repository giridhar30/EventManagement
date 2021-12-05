package com.app.security;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import com.app.model.User;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class MyUserDetails implements UserDetails {

    private User user;
    
    public User getUser() {
		return user;
	}

	private List<? extends GrantedAuthority> grantedAuthorities;

    MyUserDetails(User user) {
        this.user = user;
        this.grantedAuthorities = Arrays.asList(new SimpleGrantedAuthority(user.getRole()));
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return grantedAuthorities;
    }

    @Override
    public String getPassword() {
        return user.getPassword();
    }

    @Override
    public String getUsername() {
        return user.getMailId();
    }

    @Override
	public String toString() {
		return "MyUserDetails [user=" + user + "]";
	}

	@Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

}
