package com.app.util;

import java.io.ByteArrayOutputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.activation.DataSource;
import javax.mail.util.ByteArrayDataSource;

import org.springframework.stereotype.Service;

import com.app.model.Addon;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.LineSeparator;

@Service
public class PdfUtility {

	public DataSource generate(ByteArrayOutputStream os, List<Addon> content) {
		
		Document doc = new Document(PageSize.A4);
		try(os) {
			PdfWriter.getInstance(doc, os);
			doc.open();
			
			Font hfont = FontFactory.getFont(FontFactory.TIMES_BOLD, 18, BaseColor.RED);
			Font addressFont = FontFactory.getFont(FontFactory.COURIER, 12, BaseColor.BLACK);
			Paragraph heading = new Paragraph();
			heading.add(new Chunk("GRANDEUR EVENT MANAGERS", hfont));
			heading.add(Chunk.NEWLINE);
			heading.add(new Chunk("123, Oppanakara Street, Coimbatore 641 001.", addressFont));
			heading.add(Chunk.NEWLINE);
			heading.add(new Chunk("Ph: 0422-2401001 Mail: queries@grandeurevents.com", addressFont));
			heading.add(Chunk.NEWLINE);
			heading.add(new Chunk(new LineSeparator()));
			heading.add(Chunk.NEWLINE);
			heading.setAlignment(Element.ALIGN_CENTER);
			doc.add(heading);
			
			Paragraph date = new Paragraph();
			date.add(new Chunk("\nDate: " + LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/uuuu"))));
			date.setAlignment(Element.ALIGN_RIGHT);
			doc.add(date);
			
			String bodyContent = "\nGreetings!\n\nYour booking has been confirmed and the hall "
					+ "and specified add-ons has been allocated successfully. "
					+ "Please find attached the billing details in the excel file. "
					+ "The particulars that has been selected by you are listed below."
					+ "For add-on related queries, kindly refer to the contact numbers given respectively.";
			
			Paragraph para = new Paragraph();
			para.add(new Chunk(bodyContent));
			doc.add(para);
			
			doc.add(Chunk.NEWLINE);
			
			Paragraph addons = new Paragraph();
			for (Addon a: content) {
				addons.add(Chunk.TABBING);
				addons.add(new Chunk("• " + a.getName() + " - Ph: " + a.getPhone()));
				addons.add(Chunk.NEWLINE);
			}
			doc.add(addons);
			
			doc.add(Chunk.NEWLINE);
			
			Paragraph ending = new Paragraph();
			ending.add(new Chunk("The above mentioned Add-on items will be ready by the time of the event.\n"));
			doc.add(ending);
			
			doc.add(Chunk.NEWLINE);
			
			Paragraph tagline = new Paragraph();
			tagline.add(new Chunk("Now, focus on making memories! Leave the rest to us!", addressFont));
			tagline.setAlignment(Element.ALIGN_CENTER);
			doc.add(tagline);
			
			doc.close();
			
			return new ByteArrayDataSource(os.toByteArray(), "application/pdf");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
}
