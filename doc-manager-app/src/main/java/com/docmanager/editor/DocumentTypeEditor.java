package com.docmanager.editor;

import com.docmanager.api.DocumentTypeDao;
import com.docmanager.model.DocumentType;
import org.springframework.beans.factory.annotation.Autowired;

import java.beans.PropertyEditorSupport;

public class DocumentTypeEditor extends PropertyEditorSupport {

    private DocumentTypeDao documentTypeDao;

    public DocumentTypeEditor(DocumentTypeDao documentTypeDao) {
        this.documentTypeDao = documentTypeDao;
    }

    @Override
    public void setAsText(String text) {
        int docTypeId = Integer.parseInt(text);
        DocumentType docType = documentTypeDao.find(docTypeId);
        this.setValue(docType);
    }

    @Override
    public String getAsText() {
        DocumentType docType = (DocumentType) this.getValue();
        return docType.getName();
    }

}
