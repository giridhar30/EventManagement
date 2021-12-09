package com.app.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.app.dao.EventDAO;
import com.app.dao.HallDAO;
import com.app.model.Event;
import com.app.model.Hall;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@RequestMapping(value = "/api/event/hall")
public class HallRestController {
	
	@Autowired
	HallDAO hallDao;

	@RequestMapping(value = "/{from}/{to}", method = RequestMethod.GET, produces = "application/json")
	public Map<String, List<Hall>> getHalls(@PathVariable("from") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate fromDate, 
			@PathVariable("to") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate toDate) {
		List<Hall> availableHalls = hallDao.findAvailable(fromDate, toDate);
		List<Hall> unavailableHalls = hallDao.findNotAvailable(fromDate, toDate);
	
		Map<String, List<Hall>> map = new HashMap<>();
		map.put("available", availableHalls);
		map.put("unavailable", unavailableHalls);
		
		return map;
	}
	
}
