package com.app.util;

import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.paytm.pg.merchant.PaytmChecksum;

@Service
public class PaymentUtlity {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private PaymentProperties paymentProperties;
	
	@Autowired
	private Environment env;
	
	public ModelAndView processPayment(String customerId, String txnAmount, String orderId) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:" + paymentProperties.getPaytmUrl());
		TreeMap<String, String> params = new TreeMap<>();
		paymentProperties.getDetails().forEach((k,v) -> params.put(k, v));
        params.put("MOBILE_NO", env.getProperty("paytm.mobile"));
        params.put("EMAIL", env.getProperty("paytm.email"));
        params.put("ORDER_ID", orderId);
        params.put("TXN_AMOUNT", "1"); // txnAmount - for testing 1
        params.put("CUST_ID", customerId);
        params.put("CHECKSUMHASH", getCheckSum(params));
        mv.addAllObjects(params);
		
		return mv;
	}
	
	private String getCheckSum(TreeMap<String, String> params) throws Exception {
		return PaytmChecksum.generateSignature(params, paymentProperties.getMerchantKey());
	}
	
	public boolean getPaymentStatus(Map<String, String[]> requestParams) {
		boolean result = false;
		TreeMap<String, String> params = new TreeMap<>();
		String paytmCheckSum = null;
		for (Entry<String, String[]> paramEntry: requestParams.entrySet()) {
			if (paramEntry.getKey().equalsIgnoreCase("CHECKSUMHASH")) {
				paytmCheckSum = paramEntry.getValue()[0];
			} else {
				params.put(paramEntry.getKey(), paramEntry.getValue()[0]);
			}
		}
		logger.info(params.toString());
		
		try {
			if (isCheckSumValid(paytmCheckSum, params) && params.containsKey("RESPCODE")) {
				if (params.get("RESPCODE").equals("01")) {
					result = true;
				}
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	private boolean isCheckSumValid(String paytmCheckSum, TreeMap<String, String> params) throws Exception {
		return PaytmChecksum.verifySignature(params, paymentProperties.getMerchantKey(), paytmCheckSum);
	}
	
}
