package com.QuizApplication.repository;

import com.QuizApplication.exception.BusinessException;
import com.QuizApplication.model.User;
import jakarta.persistence.*;

public class UserRepository {
    @PersistenceContext
    EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("Eclipselink_JPA");

    public void addUser(User user) throws BusinessException {
        try (EntityManager entityManager = emFactory.createEntityManager()) {
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
    }

    public boolean authenticateUser(String email, String password) {
        try (EntityManager entityManager = emFactory.createEntityManager()) {
            try {
                Query query = entityManager.createQuery("SELECT u FROM User u WHERE u.email ILIKE :email AND u.password = :password");
                query.setParameter("email", email);
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
    }

    private boolean isUsernameValid(String username) {
        // string between 6-50, accepts only letters and digits
        String usernameValidation ="[a-zA-Z0-9]{6,50}$";
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

    public String getUsernameByEmail(String email) {
        try (EntityManager entityManager = emFactory.createEntityManager()) {
            try {
                Query query = entityManager.createQuery("SELECT u.username FROM User u WHERE u.email ILIKE :email", String.class);
                query.setParameter("email", email);
                String username;
                try {
                    username = query.getSingleResult().toString();
                } catch (NoResultException e) {
                    username = null;
                }
                return username;
            } finally {
                entityManager.close();
            }
        }
    }
    public boolean deleteUser(String email) throws BusinessException {
        try (EntityManager entityManager = emFactory.createEntityManager()) {
            try {
                if (!isEmailValid(email)) {
                    throw new BusinessException("Email should be valid.");
                }
                entityManager.getTransaction().begin();
                Query query = entityManager.createQuery("DELETE FROM User u WHERE u.email LIKE :email");
                query.setParameter("email", email);
                int deletedCount = query.executeUpdate();
                entityManager.getTransaction().commit();
//entityManager.find(User.class, email);
                if (deletedCount >0){
                    return true;
                }else{
                    return false;
                }
            }catch (NoResultException e){
                throw new BusinessException("The user was not found in our database");
            }
        }
    }

//  for update maybe we use merge
//    public void mergeMovie() {
//        EntityManager em = getEntityManager();
//        Movie movie = getMovie(1L);
//        em.detach(movie);
//        movie.setLanguage("Italian");
//        em.getTransaction().begin();
//        em.merge(movie);
//        em.getTransaction().commit();
//    }
}

