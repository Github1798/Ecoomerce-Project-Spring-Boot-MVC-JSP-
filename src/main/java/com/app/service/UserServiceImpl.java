package com.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.dao.UserRepository;
import com.app.pojos.User;
@Service
@Transactional
public class UserServiceImpl implements IUserService{

	@Autowired
	private UserRepository userRepo;
	
	public UserServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println("in user service");
	}
	
	
	@Override
	public User registerUser(User user) {
		return userRepo.save(user);	}


	@Override
	public User authenticateUser(String email, String password) {
		
		return userRepo.loginUser(email,password) ;
	}

} 
