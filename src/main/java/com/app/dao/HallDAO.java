package com.app.dao;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.app.model.Hall;

@Repository
public interface HallDAO extends JpaRepository<Hall, Integer> {
	
	@Query("select h from Hall h where h not in (select e.hall from Event e where e.fromDate = ?1 or e.toDate = ?2 or (e.fromDate between ?1 and ?2) or (e.toDate between ?1 and ?2))")
	public List<Hall> findAvailable(LocalDate fromDate, LocalDate toDate);
	
	@Query("select h from Hall h where h in (select e.hall from Event e where e.fromDate = ?1 or e.toDate = ?2 or (e.fromDate between ?1 and ?2) or (e.toDate between ?1 and ?2))")
	public List<Hall> findNotAvailable(LocalDate fromDate, LocalDate toDate);
}
