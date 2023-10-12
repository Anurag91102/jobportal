package com.minijobportal.config;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.minijobportal.model.User;
import com.minijobportal.repo.UserRepo;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private  UserRepo userRepo;
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException 
	{
		User user = userRepo.findByEmail(email);
		if(user==null)
		{
		 throw new UsernameNotFoundException("Username not found.");
		}
		else
		{
			return new CustomUserDetails(user);
		}
		
	}

}
