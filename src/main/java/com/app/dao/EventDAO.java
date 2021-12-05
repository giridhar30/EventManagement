package com.app.dao;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.app.model.Event;

@Repository
public interface EventDAO extends JpaRepository<Event, Integer> {
	
//	@Query("select e from event e where e.fromDate = ?1 or e.toDate = ?2 or (e.fromDate between ?1 and ?2) or (e.toDate between ?1 and ?2)")
//	public List<Event> filterByDateRange(LocalDate fromDate, LocalDate toDate);
}
