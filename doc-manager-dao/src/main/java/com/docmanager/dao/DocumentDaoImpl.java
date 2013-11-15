package com.docmanager.dao;

import com.docmanager.api.DocumentDao;
import com.docmanager.model.Document;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Blob;
import java.util.List;

@Repository
public class DocumentDaoImpl implements DocumentDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public Document insert(Document document, MultipartFile file) {
        try {
            if (document.getCreationDate() == null) {
                document.setCreationDate(DateTime.now().toDate());
            }
            Session session = sessionFactory.getCurrentSession();
            String fileName = file.getOriginalFilename();
            String contentType = file.getContentType();
            Blob blob = Hibernate.getLobCreator(session).createBlob(file.getInputStream(), file.getInputStream().available());
            document.setContentType(contentType);
            document.setFileName(fileName);
            document.setContent(blob);
            session.persist(document);
            return document;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    @Transactional
    public void delete(Document document) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(document);
    }

    @Override
    @Transactional
    public Document find(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Document r where r.id = :id");
        query.setParameter("id", id);
        return (Document) query.uniqueResult();
    }

    @Override
    @Transactional
    public List<Document> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Document");
        return (List<Document>) query.list();
    }
}
