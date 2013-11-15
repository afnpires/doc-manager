package com.docmanager.controller;

import com.docmanager.api.RoleDao;
import com.docmanager.api.UserDao;
import com.docmanager.model.Role;
import com.docmanager.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping(value = "/users")
public class UserController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private RoleDao roleDao;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(ModelMap model) {
        List<User> users = userDao.findAll();
        model.addAttribute("name", "Users");
        model.addAttribute("list", users);
        return "user/list";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(ModelMap model) {
        model.addAttribute("command", new User());
        return "user/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(ModelMap model, User user) {
        Role role = roleDao.find(1);
        user.setRole(role);
        userDao.insert(user);
        return "redirect:/users/list";
    }

    @RequestMapping(value = "/remove/{userId}", method = RequestMethod.POST)
    public String remove(@PathVariable("userId") int userId) {
        User user = userDao.find(userId);
        if (user != null) {
            userDao.delete(user);
        }
        return "redirect:/users/list";
    }
}
