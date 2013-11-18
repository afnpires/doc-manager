package com.docmanager.api;

import com.docmanager.model.Document;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface DocumentDao {
    Document insert(Document document, MultipartFile file);
    void delete(Document document);
    Document find(int id);
    List<Document> findAll();
}
