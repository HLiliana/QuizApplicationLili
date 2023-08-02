package com.QuizApplication.repository;

import com.QuizApplication.exception.BusinessException;
import com.QuizApplication.model.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

class UserRepositoryTest {


    private UserRepository userRepository;

    @BeforeEach
    public void setUpUserRepository() {
        userRepository = new UserRepository();
    }

    @Test
    void successAddUserToSet() throws BusinessException {
        //given
        User user = new User("HLiliana", "heyhey00", "hey@hey.co", "0723123123");
        //when
        boolean result = userRepository.addUserToSet(user);
        //then
        Assertions.assertTrue(result);
    }

    @Test
    void failAddDuplicateUserToSet() throws BusinessException {
        //given
        User user1 = new User("HLiliana", "heyhey00", "hey@hey.co", "0723123123");
        User user2 = new User("HLiliana", "heyhey00", "hey@hey.co", "0723123123");
        //when
        userRepository.addUserToSet(user1);
        boolean result = userRepository.addUserToSet(user2);
        //then
        Assertions.assertFalse(result);
    }

    @Test
    void addUserToSetUsernameValidWithSpace() throws BusinessException {
        User user = new User("H Liliana", "heyhey00", "hey@hey.co", "0723123123");
        boolean result = userRepository.addUserToSet(user);

        assertTrue(result);
    }

    @Test
    void addUserToSetUsernameTooShort() throws BusinessException {
        User user = new User("HLil", "heyhey00", "hey@hey.co", "0723123123");

        assertThrows(BusinessException.class, () -> userRepository.addUserToSet(user));
    }

    @Test
    void addUserToSetUsernameTooLong() throws BusinessException {
        User user = new User("HLi123123123123123123123123123123123123123123123123123",
                "heyhey00", "hey@hey.co", "0723123123");

        assertThrows(BusinessException.class, () -> userRepository.addUserToSet(user));
    }

    @Test
    void addUserToSetUsernameNull() throws BusinessException {
        User user = new User(null, "heyhey00", "hey@hey.co", "0723123123");

        assertThrows(BusinessException.class, () -> userRepository.addUserToSet(user));
    }

    @Test
    void addUserToSetUsernameEmpty() throws BusinessException {
        User user = new User("",
                "heyhey00", "hey@hey.co", "0723123123");

        assertThrows(BusinessException.class, () -> userRepository.addUserToSet(user));
    }

    @Test
    void addUserToSetUsernameInvalidCharacters() throws BusinessException {
        User user = new User("HLiliana@",
                "heyhey00", "hey@hey.co", "0723123123");

        assertThrows(BusinessException.class, () -> userRepository.addUserToSet(user));
    }

    @Test
    void addUserToSetPasswordTooShort() throws BusinessException {
        User user = new User("HLiliana",
                "hey", "hey@hey.co", "0723123123");

        assertThrows(BusinessException.class, () -> userRepository.addUserToSet(user));
    }

    @Test
    void addUserToSetPasswordNull() throws BusinessException {
        User user = new User("HLiliana",
                null, "hey@hey.co", "0723123123");

        assertThrows(BusinessException.class, () -> userRepository.addUserToSet(user));
    }

    @Test
    void addUserToSetPasswordIsEmpty() throws BusinessException {
        User user = new User("HLiliana",
                "", "hey@hey.co", "0723123123");

        assertThrows(BusinessException.class, () -> userRepository.addUserToSet(user));
    }

    @Test
    void addUserToSetPasswordLessCharacters() throws BusinessException {
        User user = new User("HLiliana",
                "hey00000", "hey@hey.co", "0723123123");

        assertThrows(BusinessException.class, () -> userRepository.addUserToSet(user));
    }

    @Test
    void addUserToSetPasswordLessDigits() throws BusinessException {
        User user = new User("HLiliana",
                "heyheyh", "hey@hey.co", "0723123123");

        assertThrows(BusinessException.class, () -> userRepository.addUserToSet(user));
    }

    @Test
    void addUserToSetPasswordWithSpaces() throws BusinessException {
        User user = new User("HLiliana",
                "heyh ey1", "hey@hey.co", "0723123123");

        assertThrows(BusinessException.class, () -> userRepository.addUserToSet(user));
    }

    @Test
    void addUserToSetValidEmail() throws BusinessException {
        User user = new User("HLiliana",
                "heyhey00", "hetea@example.com", "0723123123");

        boolean result = userRepository.addUserToSet(user);
        assertTrue(result);
    }

    @Test
    void addUserToSetValidEmailAndDifferentCharacters() throws BusinessException {
        User user = new User("HLiliana",
                "heyhey00", "he-te+a@example.com", "0723123123");

        boolean result = userRepository.addUserToSet(user);
        assertTrue(result);
    }

    @Test
    void addUserToSetValidEmailAndDifferentDomains() throws BusinessException {
        User user = new User("HLiliana",
                "heyhey00", "hetea@example.co.uk", "0723123123");

        boolean result = userRepository.addUserToSet(user);
        assertTrue(result);
    }

    @Test
    void addUserToSetInvalidEmail() throws BusinessException {
        User user = new User("HLiliana",
                "heyhey00", "heteaexample.co.uk", "0723123123");

        assertThrows(BusinessException.class, () -> userRepository.addUserToSet(user));
    }

    @Test
    void addUserToSetInvalidEmailMissingDomain() throws BusinessException {
        User user = new User("HLiliana",
                "heyhey00", "hetea@.com", "0723123123");

        assertThrows(BusinessException.class, () -> userRepository.addUserToSet(user));
    }

    @Test
    void addUserToSetInvalidEmailWithSpaces() throws BusinessException {
        User user = new User("HLiliana",
                "heyhey00", "hetea liliana@example.com", "0723123123");

        assertThrows(BusinessException.class, () -> userRepository.addUserToSet(user));
    }

    @Test
    void addUserToSetInvalidEmailWithInvalidCharacters() throws BusinessException {
        User user = new User("HLiliana",
                "heyhey00", "#hetea@example.com", "0723123123");

        assertThrows(BusinessException.class, () -> userRepository.addUserToSet(user));
    }

    @Test
    void addUserToSetEmailIsEmpty() throws BusinessException {
        User user = new User("HLiliana",
                "heyhey00", "", "0723123123");

        assertThrows(BusinessException.class, () -> userRepository.addUserToSet(user));
    }

    @Test
    void addUserToSetEmailNull() throws BusinessException {
        User user = new User("HLiliana",
                "heyhey00", null, "0723123123");

        assertThrows(BusinessException.class, () -> userRepository.addUserToSet(user));
    }

    @Test
    void addUserToSetPhoneTooShort() throws BusinessException {
        User user = new User("HLiliana",
                "heyhey00", "hetea@example.com", "072313123");

        assertThrows(BusinessException.class, () -> userRepository.addUserToSet(user));
    }

    @Test
    void addUserToSetPhoneTooLong() throws BusinessException {
        User user = new User("HLiliana",
                "heyhey00", "hetea@example.com", "07231231233");

        assertThrows(BusinessException.class, () -> userRepository.addUserToSet(user));
    }

    @Test
    void addUserToSetPhoneNotFromRO() throws BusinessException {
        User user = new User("HLiliana",
                "heyhey00", "hetea@example.com", "1123123123");

        assertThrows(BusinessException.class, () -> userRepository.addUserToSet(user));
    }

    @Test
    void addUserToSetPhoneIsEmpty() throws BusinessException {
        User user = new User("HLiliana",
                "heyhey00", "hetea@example.com", "");

        assertThrows(BusinessException.class, () -> userRepository.addUserToSet(user));
    }

    @Test
    void addUserToSetPhoneNull() throws BusinessException {
        User user = new User("HLiliana",
                "heyhey00", "hetea@example.com", null);

        assertThrows(BusinessException.class, () -> userRepository.addUserToSet(user));
    }

    @Test
    void addUserToSetPhoneWithSpecialCharacters() throws BusinessException {
        User user = new User("HLiliana",
                "heyhey00", "hetea@example.com", "0723123@@@");

        assertThrows(BusinessException.class, () -> userRepository.addUserToSet(user));
    }

    @Test
    void addDuplicateUserToDatabase() throws BusinessException {
        User user1 = new User("HLiliana", "heyhey00", "hey@hey.co", "0723123123");
        boolean result = userRepository.addUserToSet(user1);

        User user2 = new User("HLiliana", "heyhey00", "hey@hey.co", "0723123123");

        assertThrows(BusinessException.class, () -> userRepository.addUserToDatabase(user2));
    }

    //add to database with mocking
    //authenticateUser()  using mocking, new feature for testing without actual adding to database
    @Test
    void authenticateUserValidData() throws BusinessException {
        //real data from database
        String email = "hey@hey.com";
        String password = "heyhey99";

        EntityManager entityManager = mock(EntityManager.class);
        userRepository.setEntityManager(entityManager);
        TypedQuery query = mock(TypedQuery.class);
        when(entityManager.createQuery(anyString(), eq(User.class))).thenReturn(query);

        User mockUser = new User();
        mockUser.setEmail(email);
        mockUser.setPassword(password);
        when(query.getSingleResult()).thenReturn(mockUser);
        boolean isAuthenticated = userRepository.authenticateUser(email, password);
        assertTrue(isAuthenticated);
    }

    @Test
    void authenticateUserInvalidPassword() throws BusinessException {
        String email = "hey@hey.com";
        String password = "heyhey00";

        EntityManager entityManager = mock(EntityManager.class);
        userRepository.setEntityManager(entityManager);
        TypedQuery query = mock(TypedQuery.class);
        when(entityManager.createQuery(anyString(), eq(User.class))).thenReturn(query);

        User user = new User();
        user.setEmail(email);
        user.setPassword(password);
        when(query.getSingleResult()).thenReturn(user);

        assertThrows(BusinessException.class, () -> userRepository.authenticateUser(email, password));
    }

    @Test
    void authenticateUserInvalidEmail() throws BusinessException {
        String email = "hey@hy.com";
        String password = "heyhey99";

        EntityManager entityManager = mock(EntityManager.class);
        userRepository.setEntityManager(entityManager);
        TypedQuery query = mock(TypedQuery.class);
        when(entityManager.createQuery(anyString(), eq(User.class))).thenReturn(query);

        User user = new User();
        user.setEmail(email);
        user.setPassword(password);
        when(query.getSingleResult()).thenReturn(user);

        assertThrows(BusinessException.class, () -> userRepository.authenticateUser(email, password));
    }

    // de aici nu am mai testat
    //feed back adi
    // research DAO class
    //getUsernameByEmail with mocking
    @Test
     void getUsernameByEmail() {
    }

    @org.junit.jupiter.api.Test
    void deleteUser() {
    }

    @org.junit.jupiter.api.Test
    void updateUserByEmail() {
    }

    @org.junit.jupiter.api.Test
    void getUserByEmail() {
    }
}