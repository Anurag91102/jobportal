package com.minijobportal.controller;

import java.util.List;
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


@Controller
public class AdminController 
{
	@Autowired
	private UserService userService;
	
	@GetMapping("/admin_dashboard")
	public String adminLanding(Model model)
	{
		return "admin_dashboard";
	}
	
	@GetMapping("/admin_dashboard/adminsearch")
    public String searchUsers(@RequestParam("query") String query, Model model)
	{
        List<User> searchResults = userService.searchUser(query);
        if (searchResults.isEmpty()) 
        {
            model.addAttribute("noResults", true);
        }
        else 
        {
        	model.addAttribute("query",query);
            model.addAttribute("results",searchResults);
        }
        return "admin_dashboard";
    }
	
	@GetMapping("/adminprofile/{id}")
	public String onlyView(@PathVariable("id") int id,Model model)
	{
		User user = userService.findById(id);
		model.addAttribute("users", user);
		return "admin_view_profile";
	}
	
	@GetMapping("/admin_userupdate/{id}")
	public String adminUserUpdate(@PathVariable("id") int id,Model model)
	{
		User user = userService.findById(id);
		model.addAttribute("user", user);
		return "admin_editprofile";
	}
	
	@GetMapping("/viewAfterUpdate/{id}")
	public String viewAfterUpdate(@PathVariable("id") int id,Model model)
	{
		User user = userService.findById(id);
		model.addAttribute("users", user);
		return "onlyview";
	}
	
	@PostMapping("/admin_updateuser/updated=true")
	public String adminUserrUpdate(@RequestParam("id") int id, @ModelAttribute User user)
	{
		User userDetails = userService.findById(id);
		user.setPassword(userDetails.getPassword());
		user.setRoles(userDetails.getRoles());
		userService.save(user);
		return "redirect:/viewAfterUpdate/"+id;
	}

	@GetMapping("/deleteUser/{id}")
	public String deleteUser(@PathVariable("id") int id)
	{
		userService.deleteByID(id);
		return "redirect:/admin_dashboard";
	}
}
