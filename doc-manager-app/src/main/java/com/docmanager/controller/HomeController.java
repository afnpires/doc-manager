package com.docmanager.controller;

<<<<<<< HEAD

import com.docmanager.TestForm;
=======
>>>>>>> 6957899c56a8d3b3e51847ecc6f9364323990147
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class HomeController {

    @RequestMapping(method = RequestMethod.GET)
    public String index(ModelMap model) {
        model.addAttribute("message", "Hello world!");
        return "home/index";
    }

<<<<<<< HEAD
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

=======
>>>>>>> 6957899c56a8d3b3e51847ecc6f9364323990147
}
