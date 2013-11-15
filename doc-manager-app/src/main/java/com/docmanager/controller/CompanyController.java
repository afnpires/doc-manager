package com.docmanager.controller;

import com.docmanager.api.CompanyDao;
import com.docmanager.model.Company;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping(value = "/companies")
public class CompanyController {

    @Autowired
    private CompanyDao companyDao;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(ModelMap model) {
        List<Company> roles = companyDao.findAll();
        model.addAttribute("list", roles);
        return "company/list";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(ModelMap model) {
        model.addAttribute("command", new Company());
        return "company/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(ModelMap model, Company company) {
        companyDao.insert(company);
        return "redirect:/companies/list";
    }

    @RequestMapping(value = "/remove/{companyId}", method = RequestMethod.POST)
    public String remove(@PathVariable("companyId") int companyId) {
        Company company = companyDao.find(companyId);
        if (company != null) {
            companyDao.delete(company);
        }
        return "redirect:/companies/list";
    }

}
