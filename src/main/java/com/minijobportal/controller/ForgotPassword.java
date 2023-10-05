package com.minijobportal.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.minijobportal.model.User;
import com.minijobportal.service.EmailService;
import com.minijobportal.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ForgotPassword 
{
	@Autowired
	private UserService userService;
	
	@Autowired
	private EmailService emailService;
	
	@RequestMapping("/forgotpassword")
	public String forgot()
	{
		return "forgotpassword";
	}
	
	@PostMapping("/forgothandle")
	public String forgothandle(@RequestParam("email") String email,RedirectAttributes redirectAttributes,HttpSession session)
	{
		User user = userService.findByEmail(email);
		 if (user != null)
		 {
	         // Generate a random OTP (e.g., a 6-digit number)
	         String otp = emailService.generateOtp();
	         session.setAttribute("generatedotp", otp);
	         session.setAttribute("userEmail",user.getEmail());
	         System.out.println(user.getEmail());
	         emailService.sendEmail(email, otp);
	         return "verify_otp";
	     }
		 else
		 {	
			 redirectAttributes.addFlashAttribute("msg", "Invalid email. Please enter a registered email.");
		     return "redirect:forgotpassword";
		 }	
	}
	
	@PostMapping("/verifyotp")
	public String verifyotp(@RequestParam("otp") String otp,HttpSession session)
	{
		String generateOtp = (String) session.getAttribute("generatedotp");
		if(generateOtp.equals(otp))
		{
			return "changepassword";
		}
		else
		{
			return "verify_otp";
		}	
	}
	
	@PostMapping("/updatepassword")
	public String updatePassword(@RequestParam("password") String password,HttpSession session)
	{
		String userUpdateEmail = (String) session.getAttribute("userEmail");
		User userDetails = userService.findByEmail(userUpdateEmail);
		
		String bcryptpassword = BCrypt.hashpw(password, BCrypt.gensalt());
		userDetails.setPassword(bcryptpassword);
		userService.save(userDetails);
		return "login";
		
	}
}
	