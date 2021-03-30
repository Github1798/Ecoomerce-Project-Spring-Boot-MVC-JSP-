package com.app.service;

import com.app.pojos.User;

public interface IUserService {

	User registerUser(User user);

	User authenticateUser(String email, String password);
}
