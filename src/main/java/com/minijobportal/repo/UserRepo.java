package com.minijobportal.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.minijobportal.model.User;

@Repository
public interface UserRepo extends JpaRepository<User, Integer> 
{
	User findByEmail(String email);
	
	User findByPhone(String phone);
	
	@Query("SELECT u FROM User u WHERE u.fname LIKE %:searchTerm% OR u.lname LIKE %:searchTerm% OR u.city LIKE %:searchTerm% OR u.qualification LIKE %:searchTerm% OR u.designation LIKE %:searchTerm% ")
	List<User> findByFnameOrLnameOrCity(@Param("searchTerm") String query);

}
