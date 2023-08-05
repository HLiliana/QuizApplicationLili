package com.QuizApplication.repository;

import com.QuizApplication.exception.BusinessException;
import com.QuizApplication.model.Quiz;
import com.QuizApplication.model.User;
import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

public class UserRepository {
    Set<User> userList = new HashSet<>();
    //entityManager as private and with set,
    //so I can use it in Test as well
    private EntityManager entityManager;
    public void setEntityManager(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
    @PersistenceContext
    EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("Eclipselink_JPA");

    public boolean addUserToSet(User user) throws BusinessException {
        if (userList.contains(user)) {
            return false;
        }
        if (user.getUsername() == null || !isUsernameValid(user.getUsername())) {
            throw new BusinessException("Username should be at least 6 characters long and maxim 50 characters," +
                    " must include only spaces, letters and digits.");
        }
        if (user.getPassword() == null || !isPasswordValid(user.getPassword())) {
            throw new BusinessException("Password should have at least 6 characters and at least one digit.");
        }
        if (user.getEmail() == null || !isEmailValid(user.getEmail())) {
            throw new BusinessException("Email should be valid.");
        }
        if (user.getPhone() == null || !isPhoneNumberValid(user.getPhone())) {
            throw new BusinessException("Phone number should be a valid number from Romania.");
        }
        userList.add(user);
        return true;
    }

    public void addUserToDatabase(User user) throws BusinessException {
        try {
            if (addUserToSet(user)) {
                try (EntityManager entityManager = emFactory.createEntityManager()) {
                    entityManager.getTransaction().begin();
                    entityManager.persist(user);
                    entityManager.getTransaction().commit();
                } catch (RuntimeException e) {
                    throw new BusinessException("Internal problem with adding to data base.");
                }
            } else {
                throw new BusinessException("User already exists in our data base.");
            }
        } catch (RuntimeException e) {
            throw new BusinessException("Internal problem starting our data base.");
        }
    }

    public boolean authenticateUser(String email, String password) throws BusinessException {
        try (EntityManager entityManager = emFactory.createEntityManager()) {
            try {
                Query query = entityManager.createQuery("SELECT u FROM User u WHERE u.email ILIKE :email", User.class);
                query.setParameter("email", email);
                User user;
                try {
                    user = (User) query.getSingleResult();
                } catch (NoResultException e) {
                    throw new BusinessException("Email not found in the database.");
                }

                if (!user.getPassword().equals(password)) {
                    throw new BusinessException("Invalid password.");
                }

                return true;
            } catch (RuntimeException e) {
                e.printStackTrace();
                throw new BusinessException("An error occurred while authenticating the user.");
            }
        }
    }


    private boolean isUsernameValid(String username) {
        // string between 6-50, accepts only spaces, letters and digits
        String usernameValidation = "^[a-zA-Z0-9 ]{6,50}$";
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
                return deletedCount > 0;
            } catch (NoResultException e) {
                throw new BusinessException("The user was not found in our database");
            }
        }
    }

    public User updateUserByEmail(String username, String password, String email, String phone) throws BusinessException {
        try (EntityManager entityManager = emFactory.createEntityManager()) {
            try {
                entityManager.getTransaction().begin();

                Query query = entityManager.createQuery("SELECT u FROM User u WHERE u.email LIKE :email", User.class);
                query.setParameter("email", email);
                User user = (User) query.getSingleResult();

                if (user != null) {
                    if (!username.isEmpty()) {
                        if (isUsernameValid(username)) {
                            user.setUsername(username);
                        } else {
                            throw new BusinessException("Username should be at least 6 characters long and maximum 50 characters," +
                                    " must include only letters and digits.");
                        }
                    }
                    if (!password.isEmpty()) {
                        if (isPasswordValid(password)) {
                            user.setPassword(password);
                        } else {
                            throw new BusinessException("Password should have at least 6 characters and at least one digit.");
                        }
                    }
                    if (!phone.isEmpty()) {
                        if (isPhoneNumberValid(phone)) {
                            user.setPhone(phone);
                        } else {
                            throw new BusinessException("Phone number should be a valid number from Romania.");
                        }
                    }

                    user = entityManager.merge(user);
                    entityManager.getTransaction().commit();
                    return user;
                } else {
                    entityManager.getTransaction().rollback();
                    return null;
                }
            } catch (NoResultException e) {
                entityManager.getTransaction().rollback();
                throw new BusinessException("The user was not found in our database");
            }
        }
    }

    public User getUserByEmail(String email) throws BusinessException {
        try (EntityManager entityManager = emFactory.createEntityManager()) {
            try {
                Query query = entityManager.createQuery("SELECT u FROM User u WHERE u.email LIKE :email", User.class);
                query.setParameter("email", email);
                User user;
                try {
                    user = (User) query.getSingleResult();
                } catch (NoResultException e) {
                    user = null;
                }
                return user;
            } catch (NoResultException e) {
                throw new BusinessException("The user search by email was not found in our database");
            } finally {
                entityManager.close();
            }
        }
    }
    public void addQuizToUserToDatabase(User user, Quiz quiz) throws BusinessException {
        try {
            if (user.addQuizToUser(quiz)) {
                try (EntityManager entityManager = emFactory.createEntityManager()) {
                    entityManager.getTransaction().begin();
                    quiz.setUser(user);
                    entityManager.persist(quiz);
                    entityManager.getTransaction().commit();
                } catch (RuntimeException e) {
                    throw new BusinessException("Internal problem with adding to data base.");
                }
            }else{
                throw new BusinessException("Invalid user or quiz.");
            }
        } catch (RuntimeException e) {
            throw new BusinessException("Internal problem starting our data base.");
        }
    }

}

