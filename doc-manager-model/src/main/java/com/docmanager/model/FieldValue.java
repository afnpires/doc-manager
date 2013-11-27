package com.docmanager.model;

import javax.persistence.*;

/**
 * author: pserra
 */
@Entity
@Table(name = "field_values")
public class FieldValue {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(nullable = false)
    private String value;

    @ManyToOne
    @JoinColumn(name = "document_id")
    private Document document;

    @ManyToOne
    @JoinColumn(name = "document_field_id")
    private DocumentField documentField;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Document getDocument() {
        return document;
    }

    public void setDocument(Document document) {
        this.document = document;
    }

    public DocumentField getDocumentField() {
        return documentField;
    }

    public void setDocumentField(DocumentField documentField) {
        this.documentField = documentField;
    }
}
