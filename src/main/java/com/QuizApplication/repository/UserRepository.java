package com.QuizApplication.repository;

import com.QuizApplication.model.User;
import jakarta.persistence.*;

public class UserRepository {
    @PersistenceContext
    EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("Eclipselink_JPA");
    EntityManager entityManager = emFactory.createEntityManager();

    public void addUser(User user) {
        entityManager.getTransaction().begin();
        entityManager.persist(user);
        entityManager.getTransaction().commit();
        entityManager.close();
        emFactory.close();
    }

    public boolean authenticateUser(String username, String password) {
        Query query = entityManager.createQuery("SELECT u FROM User u WHERE u.username = :username AND u.password = :password");
        query.setParameter("username", username);
        query.setParameter("password", password);
        User user;
        try {
            user = (User) query.getSingleResult();
        } catch (NoResultException e) {
            user = null;
        }
        return user != null;
    }

}
//change the code for user to user dto and
//add the parameter emeail
//add validation for name/email/and password
//the new page quiz jsp should have 5 buttons with quiz category
