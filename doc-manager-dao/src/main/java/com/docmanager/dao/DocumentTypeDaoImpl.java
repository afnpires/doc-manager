package com.docmanager.dao;

import com.docmanager.api.DocumentTypeDao;
import com.docmanager.model.DocumentType;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class DocumentTypeDaoImpl implements DocumentTypeDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public DocumentType insert(DocumentType documentType) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(documentType);
        return documentType;
    }

    @Override
    @Transactional
    public void delete(DocumentType documentType) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(documentType);
    }

    @Override
    @Transactional
    public DocumentType find(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from DocumentType r where r.id = :id");
        query.setParameter("id", id);
        return (DocumentType) query.uniqueResult();
    }

    @Override
    @Transactional
    public List<DocumentType> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from DocumentType");
        return (List<DocumentType>) query.list();
    }
}
