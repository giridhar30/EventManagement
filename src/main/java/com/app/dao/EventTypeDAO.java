package com.app.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.app.model.EventType;

@Repository
public interface EventTypeDAO extends JpaRepository<EventType, Integer> {

}
