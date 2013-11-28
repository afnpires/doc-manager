package com.docmanager.api;

import com.docmanager.model.DocumentField;
import com.docmanager.model.DocumentType;

import java.util.List;

/**
 * author: pserra
 */
public interface DocumentFieldDao {
    DocumentField insert(DocumentField documentField);
    void delete(DocumentField documentField);
    DocumentField find(int id);
    List<DocumentField> find(String name, DocumentType documentType);
    List<DocumentField> findAll();
}
