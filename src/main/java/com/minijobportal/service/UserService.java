package com.minijobportal.service;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.minijobportal.model.User;
import com.minijobportal.repo.UserRepo;

@Service
public class UserService 
{
	
	@Autowired
	private UserRepo userRepo;
	
	public User save(User user)
	{	
		return userRepo.save(user);
	}					
	
	public	User findByEmail(String email)
	{
		return userRepo.findByEmail(email);
		
	}
	
	public User findById(int id)
	{
		return  userRepo.findById(id).get();
	}
	
	public User findByPhone(String phone)
	{
		return userRepo.findByPhone(phone);
	}
	
	public boolean verifyPassword(String rawPassword, String hashedPassword) 
	{
        return BCrypt.checkpw(rawPassword, hashedPassword);
    }
	
	 public String authenticateUser(String email, String password)
	 {
	        User user = userRepo.findByEmail(email);
	        if(user != null)
	        {
	        	String storedHashedPassword = user.getPassword();
		        if (verifyPassword(password, storedHashedPassword)) 
		        {
		            return user.getEmail();
		        }
		        else
		        {
		        	return "null";
		        }
	        }
	        else
	        {
	        	return "null";
	        }
	 }
	 
	 public List<User> searchUser(String query)
	 {
		 return userRepo.findByFnameOrLnameOrCity(query);
	 }
	 
	 public List<User> findAll()
	 {
		 return userRepo.findAll();
	 }
	 
	 public void deleteByID(int id)
	 {
		 userRepo.deleteById(id);
	 }
}
