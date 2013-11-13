package com.docmanager.api;

import com.docmanager.model.Role;

import java.util.List;

public interface RoleDao {
    Role insert(Role role);
    Role update(Role role);
    void delete(Role role);
    Role find(int id);
    List<Role> findAll();
}
