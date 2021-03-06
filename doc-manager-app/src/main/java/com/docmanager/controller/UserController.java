package com.docmanager.controller;

import com.docmanager.api.RoleDao;
import com.docmanager.api.UserDao;
import com.docmanager.editor.RoleEditor;
import com.docmanager.model.Role;
import com.docmanager.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping(value = "/users")
@PreAuthorize("hasRole('ADMIN')")
public class UserController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private RoleDao roleDao;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Role.class, new RoleEditor(roleDao));
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(ModelMap model) {

        List<User> users = userDao.findAll();
        model.addAttribute("name", "Users");
        model.addAttribute("list", users);

        return "/user/list";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(ModelMap model) {
        List<Role> roles = roleDao.findAll();
        model.addAttribute("roles", roles);
        return "/user/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(ModelMap model,
                      @RequestParam("username") String username,
                      @RequestParam("password") String password,
                      @RequestParam("name") String name,
                      @RequestParam("email") String email,
                      @RequestParam("enabled") boolean enabled,
                      @RequestParam("role") Role role) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setName(name);
        user.setEmail(email);
        user.setEnabled(enabled);
        user.setRole(role);
        userDao.insert(user);
        return "redirect:/users/list";
    }


}
