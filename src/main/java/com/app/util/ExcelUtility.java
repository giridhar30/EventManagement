package com.app.util;

import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.util.Map;

import javax.activation.DataSource;
import javax.mail.util.ByteArrayDataSource;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

@Service
public class ExcelUtility {

	public DataSource generate(ByteArrayOutputStream os, Map<Integer, String[]> content) {
		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet sheet = workbook.createSheet();
		
		try(os; workbook;) {
			int rn = 0;
			for (int key: content.keySet()) {
				Row row = sheet.createRow(rn ++);
				String[] values = content.get(key);
				for (int cn = 0; cn < values.length; cn ++) {
					Cell cell = row.createCell(cn);
					cell.setCellValue(values[cn]);
				}
			}
			
			workbook.write(os);
			
			return new ByteArrayDataSource(os.toByteArray(), "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}		
		
	}
	
}
