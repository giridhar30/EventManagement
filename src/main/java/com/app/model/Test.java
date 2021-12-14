package com.app.model;

import java.lang.reflect.Field;

import antlr.collections.List;

public class Test {
	public static void main(String[] args) throws IllegalArgumentException, IllegalAccessException {
		User user = new User();
		user.setId(1);
		user.setMailId("bala@gmail.com");
		user.setName("Bala");
		user.setPhone("9444285564");
		Class className = User.class;
		
//		for(Field f: className.getDeclaredFields()) {
//			if(f.getGenericType().getTypeName().contains("List")) {
//				continue;
//			}
//			System.out.println(f.getName().substring(0,1).toUpperCase() + f.getName().substring(1));
//			
//		}
		
		
		
//		Class class1 = user.getClass();
//		for(Field f: class1.getDeclaredFields()) {
//			if(f.getGenericType().getTypeName().contains("List")) {
//				continue;
//			}
//			f.setAccessible(true);
//			System.out.println(f.get(user));
//			
//		}
	}
}
