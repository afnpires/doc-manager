package com.docmanager.dao;

import com.docmanager.api.UserDao;
import com.docmanager.model.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {

    private SecureRandom random;

    @Autowired
    private SessionFactory sessionFactory;

//    @Autowired
//    private PasswordEncoder passwordEncoder;

    public UserDaoImpl() {
        random = new SecureRandom();
    }

    @Override
    @Transactional
    public User insert(User user) {
        if (user.getRegistrationDate() == null) {
            user.setRegistrationDate(DateTime.now().toDate());
        }
        user.setEnabled(true);
        user.setSalt(nextSalt());
        encodePassword(user);
        Session session = sessionFactory.getCurrentSession();
        session.persist(user);
        return user;
    }

    @Override
    @Transactional
    public void delete(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(user);
    }

    @Override
    @Transactional
    public User find(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from User u where u.id = :id");
        query.setParameter("id", id);
        return (User) query.uniqueResult();
    }

    @Override
    @Transactional
    public List<User> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from User");
        return query.list();
    }

    private void encodePassword(User user) {
        //user.setPassword(passwordEncoder.encodePassword(user.getPassword(), user.getSalt()));
    }

    private String nextSalt() {
        return new BigInteger(50, random).toString(32);
    }
}

