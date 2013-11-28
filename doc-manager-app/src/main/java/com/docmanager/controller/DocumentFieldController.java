package com.docmanager.controller;

import com.docmanager.api.DocumentFieldDao;
import com.docmanager.api.DocumentTypeDao;
import com.docmanager.editor.DocumentTypeEditor;
import com.docmanager.editor.FieldTypeEditor;
import com.docmanager.model.DocumentField;
import com.docmanager.model.DocumentType;
import com.docmanager.model.enums.FieldTypeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * author: jalexmach
 */

@Controller
@RequestMapping(value = "/document-fields")
public class DocumentFieldController {

    @Autowired
    private DocumentFieldDao documentFieldDao;

    @Autowired
    private DocumentTypeDao documentTypeDao;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(DocumentType.class, new DocumentTypeEditor(documentTypeDao));
        binder.registerCustomEditor(FieldTypeEnum.class, new FieldTypeEditor());
    }

    @RequestMapping(value = "/list")
    public String list(ModelMap model) {
        List<DocumentField> documentFields = documentFieldDao.findAll();
        model.addAttribute("list", documentFields);
        return "document-field/list";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(ModelMap model) {
        List<DocumentType> documentTypes = documentTypeDao.findAll();
        model.addAttribute("docTypes", documentTypes);
        model.addAttribute("fieldTypes", FieldTypeEnum.values());
        return "document-field/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(ModelMap model,
                      @RequestParam("docType") DocumentType docType,
                      @RequestParam("name") String name,
                      @RequestParam("fieldType") FieldTypeEnum fieldType) {
        DocumentField docField = new DocumentField();
        docField.setDocumentType(docType);
        docField.setName(name);
        docField.setFieldType(fieldType);
        documentFieldDao.insert(docField);
        return "redirect:/document-fields/list";
    }
}
