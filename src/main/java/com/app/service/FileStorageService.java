package com.app.service;

import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileStorageService {
	
	public String save(MultipartFile file, String path) {
		Path root = Paths.get("src/main/resources/static/images", path);
		String filePath = LocalDate.now().toString() + "_" +  file.getOriginalFilename();
		 try {
		      Files.copy(file.getInputStream(), root.resolve(filePath));
		    } catch (Exception e) {
		      e.printStackTrace();
		    }
		
		return "/images/" + path + "/" + filePath;
	}
}
