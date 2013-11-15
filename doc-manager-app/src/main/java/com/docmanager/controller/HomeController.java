package com.docmanager.controller;

import com.docmanager.TestForm;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping("/")
public class HomeController {

    @RequestMapping(method = RequestMethod.GET)
    public String index(ModelMap model) {
        model.addAttribute("message", "Hello world!");
        return "home/index";
    }

    @ModelAttribute("formDTO")
    public TestForm createFormBean() {
        return new TestForm();
    }

    @RequestMapping(value = "/", method=RequestMethod.POST)
    public String submitMessage(@Valid TestForm testForm, BindingResult result,
                                SessionStatus sessionStatus,
                                RedirectAttributes redirectAttrs) {

        if (result.hasErrors()) {
            return "home";
        }
        String message = testForm.getMessageFromUser();
        sessionStatus.setComplete();
        redirectAttrs.addFlashAttribute("message", message);

        return "redirect:/";
    }
}
