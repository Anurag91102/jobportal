package com.minijobportal.controller;

import java.util.List;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.minijobportal.model.User;
import com.minijobportal.service.UserService;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController 
{
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	public String login()
	{
		return "login";
	}
	
	@RequestMapping("/register")
	public String register()
	{
		return "register";
	}
	
	@PostMapping("/userregister")
	public String userhandle(@ModelAttribute User user,RedirectAttributes redirectAttributes)
	{
		if(userService.findByEmail(user.getEmail()) !=null)
		{
			redirectAttributes.addFlashAttribute("message", "Email Already Exists.");
			return "redirect:register";
		}
		else if (userService.findByPhone(user.getPhone()) !=null) 
		{
			redirectAttributes.addFlashAttribute("message", "Phone Number Already Exists.");
			return "redirect:register";
		}
		else
		{	
			String plainpassword = user.getPassword();
			String bcryptpassword = BCrypt.hashpw(plainpassword, BCrypt.gensalt());
			user.setPassword(bcryptpassword);
			userService.save(user);
			return "redirect:/login";
		}	
	}
	
	@PostMapping("/useraccess")
	public String useraccess(@RequestParam("email") String email,@RequestParam("password") String password,
			RedirectAttributes redirectAttributes, HttpSession session)
	{
		String valid = userService.authenticateUser(email,password);
		if(!valid.equals("null"))
		{	User userDetails = userService.findByEmail(valid);
			System.out.println(userDetails);
			session.setAttribute("id", userDetails.getId());
			session.setAttribute("name", userDetails.getFname());
			session.setAttribute("username", valid);
			return "redirect:userdashboard";
		}
		else 
		{
			redirectAttributes.addFlashAttribute("error", "Please Enter Valid Credentials.");
			return "redirect:login";
		}	 
	}
	
	@GetMapping("/userdashboard")
	public String userdashboard()
	{
		return "userdashboard";
	}
	
	@GetMapping("/usereditprofile/{username}")
	public String editprofile(@PathVariable("username") String email,Model model)
	{
		User updateuser = userService.findByEmail(email);
		model.addAttribute("users", updateuser);
		return "user_view_profile";
	}
	
	@PostMapping("/search")
    public String searchUsers(@RequestParam("query") String query, Model model)
	{
        List<User> searchResults = userService.searchUser(query);
        for (User user : searchResults) 
        {
			System.out.println(user);
		}
        if (searchResults.isEmpty()) 
        {
            model.addAttribute("noResults", true);
        }
        else 
        {
            model.addAttribute("results",searchResults);
        }
        return "userdashboard";
    }
	
	@PostMapping("/updateuser")
	public String updateuser(@RequestParam("email") String email,@ModelAttribute User user, HttpSession session)
	{
		User userStoredDetails = userService.findByEmail(email);
		user.setPassword(userStoredDetails.getPassword());
		session.setAttribute("name", user.getFname());
		userService.save(user);
		return "redirect:userdashboard";
	}
	
	@GetMapping("/logout")
	public String logout()
	{
		return "login";
	} 
	
	
	@GetMapping("/profile/{id}")
	public String onlyView(@PathVariable("id") int id,Model model)
	{
		User user = userService.findById(id);
		model.addAttribute("users", user);
		return "view_profile";
	}
	
	@GetMapping("/updateuserdata/{email}")
	public String updateuserdata(@PathVariable("email") String email, Model model)
	{
		User user_details = userService.findByEmail(email);
		model.addAttribute("user", user_details);
		return "usereditprofile";
	}
}
