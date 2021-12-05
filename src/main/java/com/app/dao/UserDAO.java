package com.app.dao;

import java.util.Optional;

import com.app.model.User;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDAO extends JpaRepository<User, Integer> {
    Optional<User> findByMailId(String mailId);
}
