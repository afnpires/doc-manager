package com.docmanager.api;

import com.docmanager.model.User;

import java.util.List;

public interface UserDao {
    User insert(User user);
    void delete(User user);
    User find(int id);
    List<User> findAll();
}
