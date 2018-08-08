package com.service;

import com.model.user;


public interface IUserService {
    public user selectUser(int id);

    //用户登陆
    public int userLogin(user u);
}
