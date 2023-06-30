package com.QuizApplication.repository;

import com.QuizApplication.model.Quiz;
import jakarta.persistence.*;
import jakarta.servlet.annotation.WebServlet;

import java.util.List;

@WebServlet("/quiz")
@PersistenceContext
public class QuizRepository {
    EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("Eclipselink_JPA");
    EntityManager entityManager = emFactory.createEntityManager();

    public List<Quiz> getAllQuizzes() {

        TypedQuery<Quiz> typedQuery = entityManager.createQuery("select q from Quiz q ", Quiz.class);
        List<Quiz> quizList = typedQuery.getResultList();
        entityManager.close();
        emFactory.close();
        return quizList;

    }

    public List<Quiz> getAllQuizzesOneLine() {
        return entityManager.createQuery("from Quiz").getResultList();
    }

    public void addQuiz(Quiz quiz) {
        entityManager.getTransaction().begin();
        entityManager.persist(quiz);
        entityManager.getTransaction().commit();
        entityManager.close();
    }


}

