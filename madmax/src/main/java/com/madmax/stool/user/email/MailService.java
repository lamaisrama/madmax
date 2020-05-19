package com.madmax.stool.user.email;

import java.util.List;

import org.springframework.mail.MailException;
import org.springframework.mail.MailMessage;

public interface MailService {
	
	void send(MailMessage message) throws MailException;

    void send(List<MailMessage> messages) throws MailException;
    
}
