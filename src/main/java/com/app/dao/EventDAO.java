package com.app.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.app.model.Event;

@Repository
public interface EventDAO extends JpaRepository<Event, Integer> {

}
