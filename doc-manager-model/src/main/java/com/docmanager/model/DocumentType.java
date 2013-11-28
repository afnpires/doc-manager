package com.docmanager.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "document_types")
public class DocumentType {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(name = "name", nullable = false, unique = true)
    private String name;

    @ManyToOne
    private DocumentType parent;

    @OneToMany(mappedBy = "parent")
    private List<DocumentType> children;

    @OneToMany(mappedBy = "documentType")
    private List<DocumentField> documentFields;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public DocumentType getParent() {
        return parent;
    }

    public void setParent(DocumentType parent) {
        this.parent = parent;
    }

    public List<DocumentType> getChildren() {
        return children;
    }

    public void setChildren(List<DocumentType> children) {
        this.children = children;
    }

    public List<DocumentField> getDocumentFields() {
        return documentFields;
    }

    public void setDocumentFields(List<DocumentField> documentFields) {
        this.documentFields = documentFields;
    }
}
