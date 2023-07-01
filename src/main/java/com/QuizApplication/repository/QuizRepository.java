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

    public void deleteQuiz(Quiz quiz){
        entityManager.getTransaction().begin();
        entityManager.remove(quiz);
        entityManager.getTransaction( ).commit( );
        entityManager.close( );
        emFactory.close( );

    }

    public Quiz findById(String id) throws Exception {
        if(id == null) {
            throw new Exception("Id cannot be null");
        }
        return entityManager.find(Quiz.class, id);
    }

    public Quiz findByName (String name) throws Exception {
        if (name ==null) {
            throw new Exception("Name cannot be null");

        }
        Query jpqlQuery = entityManager.createQuery("SELECT q FROM Quiz q WHERE q.name LIKE:customName");
        jpqlQuery.setParameter("customName", name);
        return (Quiz) jpqlQuery.getSingleResult();
    }

    public void updateQuiz (Quiz quiz) throws Exception {
        if (quiz == null) {
            throw new Exception("There is no quiz");

        }
        entityManager.getTransaction().begin();
        entityManager.merge(quiz);
        entityManager.getTransaction( ).commit( );
        entityManager.close( );
        emFactory.close( );

    }


}

