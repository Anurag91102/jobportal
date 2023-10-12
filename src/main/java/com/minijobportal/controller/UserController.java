package com.minijobportal.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
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


@Controller
public class UserController 
{
	@Autowired
	private PasswordEncoder passwordEncoder;
	
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
			user.setPassword(passwordEncoder.encode(plainpassword));;
			user.setRoles("ROLE_USER");
			userService.save(user);
			redirectAttributes.addFlashAttribute("registerMessage", "Registered Successfully");
			return "redirect:/login";
		}	
	}
	
	@PostMapping("/useraccess")
	public String useraccess(@RequestParam("username") String email,@RequestParam("password") String password, HttpSession session)
	{
		String valid = userService.authenticateUser(email,password);
		if(!valid.equals("null"))
		{	User userDetails = userService.findByEmail(valid);
			session.setAttribute("fname", userDetails);
			return "redirect:userdashboard";
		}
		else 
		{
			return "redirect:/login";
		}	 
	}
	
	@ModelAttribute
	public void commonUser(Principal p, Model m) 
	{
		if (p != null) 
		{
			String email = p.getName();
			User user = userService.findByEmail(email);
			m.addAttribute("user", user);
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
		User updateUser = userService.findByEmail(email);
		model.addAttribute("users", updateUser);
		return "user_view_profile";
	}
	
	@GetMapping("/userdashboard/search")
	public String searchUsers(@RequestParam("query") String query, Model model) {
	    if (query != null && !query.isEmpty()) {
	        List<User> searchResults = userService.searchUser(query);
	        for (User user : searchResults) {
	            System.out.println(user);
	        }
	        if (searchResults.isEmpty()) 
	        {
	            model.addAttribute("noResults", true);
	        } else {
	        	model.addAttribute("query",query);
	            model.addAttribute("results", searchResults);
	        }
	    }
	    return "userdashboard";
	}

	
	@PostMapping("/updateuser")
	public String updateuser(@RequestParam("id") int id,@ModelAttribute User user, HttpSession session)
	{
		User userStoredDetails = userService.findById(id);
		user.setPassword(userStoredDetails.getPassword());
		user.setRoles(userStoredDetails.getRoles());
		session.setAttribute("name", user.getFname());
		userService.save(user);
		return "redirect:userdashboard";
	}
	
	@GetMapping("/logoutpage")
	public String logout(RedirectAttributes redirectAttributes)
	{
		redirectAttributes.addFlashAttribute("successMessage", "Logout Successfully");
		return "redirect:login";
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
