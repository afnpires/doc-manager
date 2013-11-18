package com.docmanager.controller;

import com.docmanager.api.DocumentTypeDao;
import com.docmanager.model.DocumentType;
import com.docmanager.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping(value = "/document-types")
public class DocumentTypeController {
    @Autowired
    private DocumentTypeDao documentTypeDao;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(ModelMap model) {
        List<DocumentType> documentType = documentTypeDao.findAll();
        model.addAttribute("list", documentType);
        return "role/list";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(ModelMap model) {
        model.addAttribute("command", new Role());
        return "document-type/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(ModelMap model, DocumentType documentType) {
        documentTypeDao.insert(documentType);
        return "redirect:/document-types/list";
    }

    @RequestMapping(value = "/remove/{roleId}", method = RequestMethod.POST)
    public String remove(@PathVariable("roleId") int documentTypeId) {
        DocumentType documentType = documentTypeDao.find(documentTypeId);
        if (documentType != null) {
            documentTypeDao.delete(documentType);
        }
        return "redirect:/document-types/list";
    }
}
