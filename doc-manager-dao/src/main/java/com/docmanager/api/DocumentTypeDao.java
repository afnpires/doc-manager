package com.docmanager.api;

import com.docmanager.model.DocumentType;

import java.util.List;

public interface DocumentTypeDao {
    DocumentType insert(DocumentType documentType);
    void delete(DocumentType documentType);
    DocumentType find(int id);
    List<DocumentType> findAll();
}
