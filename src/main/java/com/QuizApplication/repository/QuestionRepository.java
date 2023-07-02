package com.QuizApplication.repository;

import com.QuizApplication.model.Question;
import com.QuizApplication.model.Quiz;
import jakarta.persistence.*;

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

    public void addQuestion(Question question) {
        entityManager.getTransaction().begin();
        entityManager.persist(question);
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    public Question findQuestionById(String id) throws Exception {
        if(id == null) {
            throw new Exception("Id cannot be null");
        }
        return entityManager.find(Question.class, id);
    }

    public Question findQuestionByDescription (String name) throws Exception {
        if (name ==null) {
            throw new Exception("Name cannot be null");

        }
        Query jpqlQuery = entityManager.createQuery("SELECT q FROM Question q WHERE q.questionDescription LIKE:customQuestionDescription");
        jpqlQuery.setParameter("customQuestionDescription", name);
        return (Question) jpqlQuery.getSingleResult();
    }

    public void deleteQuestion(Question question){
        entityManager.getTransaction().begin();
        entityManager.remove(question);
        entityManager.getTransaction( ).commit( );
        entityManager.close( );
        emFactory.close( );

    }

    public void updateQuestion (Question question) throws Exception {
        if (question == null) {
            throw new Exception("There is no question");

        }
        entityManager.getTransaction().begin();
        entityManager.merge(question);
        entityManager.getTransaction( ).commit( );
        entityManager.close( );
        emFactory.close( );

    }
}
