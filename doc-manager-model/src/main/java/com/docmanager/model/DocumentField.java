package com.docmanager.model;

import com.docmanager.model.enums.FieldTypeEnum;

import javax.persistence.*;

/**
 * author: pserra
 */
@Entity
@Table(name = "document_fields")
public class DocumentField {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(name = "name", nullable = false, unique = true)
    private String name;

    @ManyToOne
    @JoinColumn(name = "doc_type_id")
    private DocumentType documentType;

    @Column(name="field_type")
    @Enumerated(value= EnumType.STRING)
    private FieldTypeEnum fieldType;

    public FieldTypeEnum getFieldType() {
        return fieldType;
    }

    public void setFieldType(FieldTypeEnum fieldType) {
        this.fieldType = fieldType;
    }

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

    public DocumentType getDocumentType() {
        return documentType;
    }

    public void setDocumentType(DocumentType documentType) {
        this.documentType = documentType;
    }
}
