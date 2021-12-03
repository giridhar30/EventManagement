package com.app.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.app.model.Decoration;

@Repository
public interface DecorationDAO extends JpaRepository<Decoration, Integer> {

}
