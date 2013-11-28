package com.docmanager.dao;

import com.docmanager.api.DocumentFieldDao;
import com.docmanager.model.DocumentField;
import com.docmanager.model.DocumentType;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * author: pserra
 */
@Repository
public class DocumentFieldDaoImpl implements DocumentFieldDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public DocumentField insert(DocumentField documentField) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(documentField);
        return documentField;
    }

    @Override
    @Transactional
    public void delete(DocumentField documentField) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(documentField);
    }

    @Override
    @Transactional
    public DocumentField find(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from DocumentField df where df.id = :id");
        query.setParameter("id", id);
        return (DocumentField) query.uniqueResult();
    }

    @Override
    @Transactional
    public List<DocumentField> find(String name, DocumentType documentType) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from DocumentField df where df.name = :name and df.documentType = :documentType");
        query.setParameter("name", name);
        query.setParameter("documentType", documentType);
        return (List<DocumentField>) query.list();
    }

    @Override
    @Transactional
    public List<DocumentField> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from DocumentField df");
        return (List<DocumentField>) query.list();
    }
}
