package com.docmanager.editor;

import com.docmanager.api.CompanyDao;
import com.docmanager.model.Company;
import com.docmanager.model.DocumentType;

import java.beans.PropertyEditorSupport;

public class CompanyEditor extends PropertyEditorSupport {

    private CompanyDao companyDao;

    public CompanyEditor(CompanyDao companyDao) {
        this.companyDao = companyDao;
    }

    @Override
    public void setAsText(String text) {
        int id = Integer.parseInt(text);
        Company company = companyDao.find(id);
        this.setValue(company);
    }

    @Override
    public String getAsText() {
        DocumentType docType = (DocumentType) this.getValue();
        return docType.getName();
    }

}
