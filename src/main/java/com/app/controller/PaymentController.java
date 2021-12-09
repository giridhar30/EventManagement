package com.app.controller;

import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.app.model.User;
import com.app.security.MyUserDetails;
import com.app.util.MailData;
import com.app.util.MailDocument;
import com.app.util.MailUtility;
import com.app.util.PaymentUtlity;
import com.app.util.PdfUtility;
import com.app.util.SmsUtility;

@Controller
public class PaymentController {

	@Autowired
	private PaymentUtlity paymentUtility;
	
	@Autowired
	private MailUtility mailUtility;
	
	@Autowired
	private PdfUtility pdfUtility;
	
	@Autowired
	private SmsUtility smsUtility;
	
	@GetMapping("/payment")
	public ModelAndView processPayment(@RequestParam(name = "CUST_ID") String customerId,
            @RequestParam(name = "TXN_AMOUNT") String txnAmount,
            @RequestParam(name = "ORDER_ID") String orderId) throws Exception {
		
		return paymentUtility.processPayment(customerId, txnAmount, orderId);
		
	}
	
	@PostMapping("/payment/response")
	public String loadPostPaymentReport(HttpServletRequest req, ModelMap mm) {
		Map<String, String[]> requestParams = req.getParameterMap();
		
		String paymentStatus = paymentUtility.getPaymentStatus(requestParams);
		mm.addAttribute("paymentStatus", paymentStatus);
		if (paymentStatus.equals("payment success")) {
			User user = null;
			Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();  
			if (obj instanceof MyUserDetails) { 
				user = ((MyUserDetails) obj).getUser(); 
			} 
			if (user == null) return "payment-response";
			MailData mailData = new MailData();
			mailData.setToMailId(user.getMailId());
			mailData.setSubject("Confirmation: Event booking - reg");
			mailData.setTextContent("Hi,\nYour event booking has been confirmed. "
					+ "Please find attached the invoice and detailing document of the event.\n\n"
					+ "Thanks & Regards\nGrandeur Event Managers\nCoimbatore.");
			
			MailDocument mDocPdf = new MailDocument();
			mDocPdf.setTitle("confirmation-details.pdf");
			mDocPdf.setDataSource(pdfUtility.generate(new ByteArrayOutputStream(), user.getEvents().get(1).getAddons()));
			
			List<MailDocument> docs = new ArrayList<>();
			docs.add(mDocPdf);
			mailData.setDocs(docs);
			
			mailUtility.sendMail(mailData);
			
			smsUtility.sendSMS(user.getPhone(), "Your event booking has been confirmed. Rs. "
					+ user.getEvents().get(1).getTotalPrice()
					+ " received successfully. ~ GEM");
			
		}
		
		return "payment-response";
	}
	
}
