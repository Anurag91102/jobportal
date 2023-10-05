package com.minijobportal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService
{
	 	@Autowired
	    private JavaMailSender javaMailSender;

	    public void sendEmail(String toEmail, String otp) 
	    {
	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setTo(toEmail);
	        message.setSubject("One-Time Password (OTP) for Password Reset");
	        message.setText("Your OTP for password reset is: " +otp);
	        message.setFrom("anurag091102@gmail.com");
	        javaMailSender.send(message);
	    }
	    
	    public String generateOtp() 
	    {	
	    	 // Generate a random OTP (6-digit number)
	        return String.valueOf((int) (Math.random() * 900000) + 100000);
	    }
}
