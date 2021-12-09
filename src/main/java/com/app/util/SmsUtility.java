package com.app.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

@Service
public class SmsUtility {

	@Value("${twilio.account.sid}")
	private String accountSID;
	
	@Value("${twilio.auth.token}")
	private String authToken;
	
	@Value("${twilio.from.number}")
	private String fromNumber;
	
	public boolean sendSMS(String toNumber, String msgBody) {
		try {
			Twilio.init(accountSID, authToken);
			Message msg = Message.creator(new PhoneNumber(toNumber), new PhoneNumber(fromNumber), msgBody).create();
			System.out.println(msg.getSid());
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public String getAccountSID() {
		return accountSID;
	}

	public void setAccountSID(String accountSID) {
		this.accountSID = accountSID;
	}

	public String getAuthToken() {
		return authToken;
	}

	public void setAuthToken(String authToken) {
		this.authToken = authToken;
	}

	public String getFromNumber() {
		return fromNumber;
	}

	public void setFromNumber(String fromNumber) {
		this.fromNumber = fromNumber;
	}
	
}
