package com.app.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.app.model.Cake;

@Repository
public interface CakeDAO extends JpaRepository<Cake, Integer> {

}
