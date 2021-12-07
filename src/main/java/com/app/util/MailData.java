package com.app.util;

import java.util.List;

public class MailData {
	
	private String toMailId;
	private String subject;
	private String textContent;
	
	private List<MailDocument> docs;

	public String getToMailId() {
		return toMailId;
	}

	public void setToMailId(String toMailId) {
		this.toMailId = toMailId;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getTextContent() {
		return textContent;
	}

	public void setTextContent(String textContent) {
		this.textContent = textContent;
	}

	public List<MailDocument> getDocs() {
		return docs;
	}

	public void setDocs(List<MailDocument> docs) {
		this.docs = docs;
	}

}
