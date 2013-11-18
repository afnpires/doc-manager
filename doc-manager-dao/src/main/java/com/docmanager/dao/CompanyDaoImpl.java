package com.docmanager.dao;

import com.docmanager.api.CompanyDao;
import com.docmanager.model.Company;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class CompanyDaoImpl implements CompanyDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public Company insert(Company company) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(company);
        return company;
    }

    @Override
    @Transactional
    public void delete(Company company) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(company);
    }

    @Override
    @Transactional
    public Company find(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Company r where r.id = :id");
        query.setParameter("id", id);
        return (Company) query.uniqueResult();
    }

    @Override
    @Transactional
    public List<Company> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Company");
        return (List<Company>) query.list();
    }
}
