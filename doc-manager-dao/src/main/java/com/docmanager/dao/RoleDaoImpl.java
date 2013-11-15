package com.docmanager.dao;

import com.docmanager.api.RoleDao;
import com.docmanager.model.Role;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class RoleDaoImpl implements RoleDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public Role insert(Role role) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(role);
        return role;
    }

    @Override
    @Transactional
    public void delete(Role role) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(role);
    }

    @Override
    @Transactional
    public Role find(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Role r where r.id = :id");
        query.setParameter("id", id);
        return (Role) query.uniqueResult();
    }

    @Override
    @Transactional
    public List<Role> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Role");
        return (List<Role>) query.list();
    }
}
