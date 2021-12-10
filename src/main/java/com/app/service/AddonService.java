package com.app.service;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.app.model.Addon;

@Service
public class AddonService {
	
	public void addToSession(HttpSession session, Addon addon, int size) {
		Set<Addon> addonSet = (Set<Addon>)session.getAttribute("addonSet");
		
		if(addonSet == null || size == 0) {
			addonSet = new HashSet<>();
			session.setAttribute("addonSet", addonSet);
		}
		addonSet.add(addon);
		
	}
	
	public void removeFromSession(HttpSession session, Addon addon) {
		Set<Addon> addonSet = (Set<Addon>)session.getAttribute("addonSet");
		addonSet.remove(addon);
	}
}
