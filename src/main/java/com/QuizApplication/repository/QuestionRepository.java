package com.QuizApplication.repository;

import com.QuizApplication.model.Question;
import com.QuizApplication.model.Quiz;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;

import java.util.List;


public class QuestionRepository {
    EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("Eclipselink_JPA");
    EntityManager entityManager = emFactory.createEntityManager();

    public List<Question> getAllQuestions() {

        TypedQuery<Question> typedQuery = entityManager.createQuery("select q from Question q ", Question.class);
        List<Question> questionList = typedQuery.getResultList();
        entityManager.close();
        emFactory.close();
        return questionList;

    }

    public List<Quiz> getAllQuizzesOneLine(){
        return entityManager.createQuery("from Quiz").getResultList();
    }

    public void addQuiz(Quiz quiz) {
        entityManager.getTransaction().begin();
        entityManager.persist(quiz);
        entityManager.getTransaction().commit();
        entityManager.close();
    }


}
