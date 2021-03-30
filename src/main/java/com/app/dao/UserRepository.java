package com.app.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.app.pojos.User;


public interface UserRepository extends JpaRepository<User,Integer>
{
  @Query("Select u from User u where u.email=?1 and u.userPassword=?2")
  public User loginUser(String email,String password);
	
}

