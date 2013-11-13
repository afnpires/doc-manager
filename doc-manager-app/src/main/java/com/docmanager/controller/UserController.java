package com.docmanager.controller;

import com.docmanager.api.RoleDao;
import com.docmanager.api.UserDao;
import com.docmanager.model.Role;
import com.docmanager.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping(value = "/users")
public class UserController {

    @Autowired
    private UserDao userMapper;

    @Autowired
    private RoleDao roleMapper;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(ModelMap model) {
        List<User> users = userMapper.findAll();
        model.addAttribute("name", "Users");
        model.addAttribute("list", users);
        return "list";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(ModelMap model) {
        model.addAttribute("command", new User());
        return "user/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(ModelMap model, User user) {
        Role role = roleMapper.find(1);
        user.setRole(role);
        userMapper.insert(user);
        return "redirect:/users/list";
    }


}
