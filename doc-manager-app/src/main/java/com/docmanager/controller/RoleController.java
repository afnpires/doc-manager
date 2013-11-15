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
@RequestMapping(value = "/roles")
public class RoleController {

    @Autowired
    private RoleDao roleDao;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(ModelMap model) {
        List<Role> roles = roleDao.findAll();
        model.addAttribute("list", roles);
        return "role/list";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(ModelMap model) {
        model.addAttribute("command", new Role());
        return "role/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(ModelMap model, Role role) {
        roleDao.insert(role);
        return "redirect:/roles/list";
    }

    @RequestMapping(value = "/remove/{roleId}", method = RequestMethod.POST)
    public String remove(@PathVariable("roleId") int roleId) {
        Role role = roleDao.find(roleId);
        if (role != null) {
            roleDao.delete(role);
        }
        return "redirect:/roles/list";
    }

}
