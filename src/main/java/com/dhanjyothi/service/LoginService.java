package com.dhanjyothi.service;

import com.dhanjyothi.model.User;

public interface LoginService {

	public long saveUser(User user);

	public User getUserByUserId(long userId);

	public User getUserByUserName(String userName);

	public void updateCustomerUserStatus(long userId, char userStatus);
}
