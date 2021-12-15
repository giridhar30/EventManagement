package com.app.service;


import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.app.dao.EventDAO;
import com.app.dao.HallDAO;
import com.app.model.Addon;
import com.app.model.Event;
import com.app.model.Hall;
import com.app.model.User;
import com.app.security.MyUserDetails;
import com.app.util.ExcelUtility;
import com.app.util.MailData;
import com.app.util.MailDocument;
import com.app.util.MailUtility;
import com.app.util.PaymentUtlity;
import com.app.util.PdfUtility;
import com.app.util.SmsUtility;

@Service
public class PaymentService {
	
	@Autowired
	private EventDAO eventDao;
	
	@Autowired
	private HallDAO hallDao;
	
	@Autowired
	private PaymentUtlity paymentUtility;
	
	@Autowired
	private MailUtility mailUtility;
	
	@Autowired
	private PdfUtility pdfUtility;
	
	@Autowired
	private ExcelUtility xlUtility;
	
	@Autowired
	private SmsUtility smsUtility;

	public ModelAndView blockHallAndReceivePayment(Event event) throws Exception {
		List<Hall> halls = hallDao.findAvailable(event.getFromDate(), event.getToDate());
		if (halls.contains(event.getHall())) {
			Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();  
			if (obj instanceof MyUserDetails) { 
				User user = ((MyUserDetails) obj).getUser(); 
				event.setId(eventDao.findTopByOrderByIdDesc().getId() + 100);
				event.setUser(user);
				eventDao.save(event);
				String customerId = String.valueOf(user.getId());
				String txnAmount = String.valueOf(event.getTotalPrice());
				String orderId = String.valueOf(event.getId());
				
				return paymentUtility.processPayment(customerId, txnAmount, orderId);
			} else {
				ModelAndView mv = new ModelAndView("homePage");
				mv.addObject("error", "An error occurred!");
				return mv;
			}
		} else {
			ModelAndView mv = new ModelAndView("homePage");
			mv.addObject("error", "Hall already booked!");
			return mv;
		}
	}
	
	public RedirectView respondToPayment(Map<String, String[]> requestParams, RedirectAttributes ras, Event event) {
		boolean paymentSuccess = paymentUtility.getPaymentStatus(requestParams);
		
		if (paymentSuccess) {
			ras.addFlashAttribute("paymentSuccess", paymentSuccess);
			event.setPaymentStatus(true);
			eventDao.save(event);
			User user = null;
			Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();  
			if (obj instanceof MyUserDetails) { 
				user = ((MyUserDetails) obj).getUser(); 
			} 
			if (user == null) return new RedirectView("/", true);
			MailData mailData = new MailData();
			mailData.setToMailId(user.getMailId());
			mailData.setSubject("Confirmation: Event booking - reg");
			mailData.setTextContent("Hi,\nYour event booking has been confirmed. "
					+ "Please find attached the invoice and detailing document of the event.\n\n"
					+ "Thanks & Regards\nGrandeur Event Managers\nCoimbatore.");
			
			MailDocument mDocPdf = new MailDocument();
			mDocPdf.setTitle("confirmation-details.pdf");
			mDocPdf.setDataSource(pdfUtility.generate(new ByteArrayOutputStream(), event.getAddons()));
			
			MailDocument mDocXl = new MailDocument();
			mDocXl.setTitle("invoice.xlsx");
			TreeMap<Integer, String[]> content = new TreeMap<>();
			int key = 1;
			content.put(key ++, "S.No|Booking Name|Price| |Extra data".split("\\|"));
			content.put(key ++, new String[] {key-2+"", event.getHall().getName(), event.getHall().getPrice()*event.getNoOfDays()+"", " ", "No. of days: " + event.getNoOfDays()});
			for (Addon a: event.getAddons()) {
				String[] usualContent = new String[] {key-1+"", a.getName(), a.getPrice()+"", " "};
				content.put(key ++, usualContent);
			}
			content.put(key ++, new String[] {" ", " ", " "});
			content.put(key ++, new String[] {" ", "Total:", event.getTotalPrice()+""});
			mDocXl.setDataSource(xlUtility.generate(new ByteArrayOutputStream(), content));
			
			List<MailDocument> docs = new ArrayList<>();
			docs.add(mDocPdf);
			docs.add(mDocXl);
			mailData.setDocs(docs);
			
			mailUtility.sendMail(mailData);
			
			smsUtility.sendSMS(user.getPhone(), "Your event booking has been confirmed. Rs. "
					+ event.getTotalPrice()
					+ " received successfully. ~ GEM");
			
			return new RedirectView("/user/events", true);
		} else {
			ras.addFlashAttribute("error", "Transaction failed! Event not booked!");
			eventDao.delete(event);
			return new RedirectView("/", true);
		}
	}
	
}
