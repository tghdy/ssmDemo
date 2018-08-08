package com.dao;

import com.model.user;

import java.util.List;
import java.util.Map;


public interface IUserDao {
    user selectUser(int id);

    List<Map<String, Object>> userLogin(user u);
}
