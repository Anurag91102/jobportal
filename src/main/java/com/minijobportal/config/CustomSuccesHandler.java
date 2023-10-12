package com.minijobportal.config;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomSuccesHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException 
	{
			Set<String>  role =  AuthorityUtils.authorityListToSet(authentication.getAuthorities());
			if(role.contains("ROLE_ADMIN"))
			{
				response.sendRedirect("/admin_dashboard");
			}
			else
			{
				response.sendRedirect("/userdashboard");
			}
	}

}
