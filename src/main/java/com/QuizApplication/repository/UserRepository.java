package com.QuizApplication.repository;

import com.QuizApplication.exception.BusinessException;
import com.QuizApplication.model.User;
import jakarta.persistence.*;

public class UserRepository {
    @PersistenceContext
    EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("Eclipselink_JPA");

    public void addUser(User user) throws BusinessException {
        EntityManager entityManager = emFactory.createEntityManager();
        try {
            if (!isUsernameValid(user.getUsername())) {
                throw new BusinessException("Username should be at least 6 characters long and maxim 50 characters," +
                        " must include only letters and digits.");
            }
            if (!isPasswordValid(user.getPassword())) {
                throw new BusinessException("Password should have at least 6 characters and at least one digit.");
            }
            if (!isEmailValid(user.getEmail())) {
                throw new BusinessException("Email should be valid.");
            }
            if (!isPhoneNumberValid(user.getPhone())) {
                throw new BusinessException("Phone number should be a valid number from Romania.");
            }
            entityManager.getTransaction().begin();
            entityManager.persist(user);
            entityManager.getTransaction().commit();

        } finally {
            entityManager.close();
        }
    }

    public boolean authenticateUser(String username, String password) {
        EntityManager entityManager = emFactory.createEntityManager();
        try {
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
        } finally {
            entityManager.close();
        }
    }

    private boolean isUsernameValid(String username) {
        // string between 6-50, accepts only letters and digits
        String usernameValidation = "^[a-zA-Z0-9]{6,50}$";
        return username.matches(usernameValidation);
    }

    private boolean isPasswordValid(String password) {
        // 6 characters and requires + at least one digit
        String passwordValidation = "^(?=.*\\d)(?=.*[a-zA-Z]{6})[a-zA-Z0-9]{7,}$";
        return password.matches(passwordValidation);
    }

    private boolean isEmailValid(String email) {
        // regular email expression
        String emailValidation = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
        return email.matches(emailValidation);
    }

    private boolean isPhoneNumberValid(String phoneNumber) {
        // RO phoneNumber 10 digits starts with 07
        String phoneValidation = "^07\\d{8}$";
        return phoneNumber.matches(phoneValidation);
    }
}

