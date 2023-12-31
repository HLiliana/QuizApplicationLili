package com.QuizApplication.repository;

import com.QuizApplication.exception.BusinessException;
import com.QuizApplication.model.Question;
import com.QuizApplication.model.Quiz;
import jakarta.persistence.*;
import jakarta.servlet.annotation.WebServlet;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@WebServlet("/quiz")
@PersistenceContext
public class QuizRepository {


    EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("Eclipselink_JPA");
    EntityManager entityManager = emFactory.createEntityManager();
    private List<Quiz> quizList;
    Set<Quiz> quizSet = new HashSet<>();
    public List<Quiz> getAllQuizzes() {

        TypedQuery<Quiz> typedQuery = entityManager.createQuery("SELECT q FROM Quiz q ", Quiz.class);
        List<Quiz> quizList = typedQuery.getResultList();
        entityManager.close();
        emFactory.close();
        return quizList;

    }

    public List<Quiz> getAllQuizzesOneLine() {
        return entityManager.createQuery("from Quiz").getResultList();
    }

    public void addQuiz(Quiz quiz) throws BusinessException {
        try {
            if (!isQuizDataValid(quiz.getName())) {
                throw new BusinessException("Quiz name should be at least 4 characters long and maxim 50 characters,"
                        + " must include only letters, digits and spaces.");
            }
            if (!isQuizDataValid(quiz.getCategory())) {
                throw new BusinessException("Quiz category should be at least 4 characters long and maxim 50 characters,"
                        + " must include only letters, digits and spaces.");
            }
            if (!isQuizDataValid(quiz.getDifficulty())) {
                throw new BusinessException("Quiz difficulty should be at least 4 characters long and maxim 50 characters,"
                        + " must include only letters, digits and spaces.");
            }
            entityManager.getTransaction().begin();
            entityManager.persist(quiz);
            try{
                quizSet.add(quiz);
            } catch (Exception e) {
                throw new BusinessException("Cannot add to Set");
            }
            entityManager.getTransaction().commit();
        } finally {
            entityManager.close();
        }
    }

//    public void deleteQuiz(Quiz quiz) {
//        entityManager.getTransaction().begin();
//        entityManager.remove(quiz);
//        entityManager.getTransaction().commit();
//        entityManager.close();
//        emFactory.close();

    //}
    public Quiz findByName(String name) throws BusinessException {
        Quiz quiz;
        try {
            Query query = entityManager.createQuery("SELECT q FROM Quiz q WHERE q.name ILIKE :name", Quiz.class);
            query.setParameter("name", name);
            quiz = (Quiz) query.getSingleResult();
        } catch (Exception e) {
            throw new BusinessException("Quiz does not exist");
        }

        return quiz;
    }

        public Quiz findById(String id) throws BusinessException {
        if (id == null) {
            throw new BusinessException("Id cannot be null");
        }
        return entityManager.find(Quiz.class, id);
    }

    public Quiz updateQuiz(String name, String newName, String newCategory, String newDifficulty) throws BusinessException {

        entityManager.getTransaction().begin();
        try {
            Query query = entityManager.createQuery("SELECT q FROM Quiz q WHERE q.name ILIKE :name", Quiz.class);
            query.setParameter("name", name);
            Quiz quiz = (Quiz) query.getSingleResult();
            if (!name.equals(newName)) {

                if (newName != null && isQuizDataValid(newName)) {
                    quiz.setName(newName);
                } else {
                    throw new BusinessException("Quiz new name should be at least 4 characters long and maxim 50 characters,"
                            + " must include only letters, digits and spaces.");
                }
                if (newCategory != null && isQuizDataValid(newCategory)) {
                    quiz.setCategory(newCategory);
                } else {
                    throw new BusinessException("Quiz new category should be at least 4 characters long and maxim 50 characters,"
                            + " must include only letters, digits and spaces.");
                }
                if (newDifficulty != null && isQuizDataValid(newDifficulty)) {
                    quiz.setDifficulty(newDifficulty);
                } else {
                    throw new BusinessException("Quiz new difficulty should be at least 4 characters long and maxim 50 characters,"
                            + " must include only letters, digits and spaces.");
                }
                quiz = entityManager.merge(quiz);
                entityManager.getTransaction().commit();
                return quiz;
            } else {
                throw new BusinessException("Name and new name cannot be the same.");
            }
        } catch (NoResultException e) {
            entityManager.getTransaction().rollback();
            throw new BusinessException("Quiz cannot be found in database.");
        }
    }

    public boolean isQuizDataValid(String data) {
        String dataValidation = "^[a-zA-Z0-9 ]{4,50}$";
        return data.matches(dataValidation);
    }

    public boolean deleteQuiz(String name) throws BusinessException {
        if (!isQuizDataValid(name)) {
            throw new BusinessException("Name cannot be empty or is not correct");
        }
        try {

            entityManager.getTransaction().begin();
            Query query = entityManager.createQuery("SELECT q FROM Quiz q WHERE q.name  ILIKE :name", Quiz.class);
            query.setParameter("name", name);
            Quiz quiz = (Quiz) query.getSingleResult();
            entityManager.remove(quiz);
            entityManager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            throw new BusinessException("Quiz cannot be found in database.");
        } finally {
            entityManager.close();
        }

    }

//    public void updateQuiz1(Quiz quiz) {
//        entityManager.getTransaction().begin();
//        entityManager.merge(quiz);
//        entityManager.getTransaction().commit();
//        entityManager.close();
//        emFactory.close();
//
//    }


    public Quiz createQuiz(String name,String category, String difficulty, List<Question> questions) throws BusinessException {
        Quiz quiz = new Quiz();
        if (isQuizDataValid(name)) {
            quiz.setName(name);
        }
        else {
            throw new BusinessException("Quiz name should be at least 4 characters long and maxim 50 characters,"
                    + " must include only letters, digits and spaces.");
        }
        if(isQuizDataValid(category)) {
            quiz.setCategory(category);
        }
        else {
            throw new BusinessException("Quiz category should be at least 4 characters long and maxim 50 characters,"
                    + " must include only letters, digits and spaces.");
        }
        if(isQuizDataValid(difficulty)) {
            quiz.setDifficulty(difficulty);
        }
        else {
            throw new BusinessException("Quiz new difficulty should be at least 4 characters long and maxim 50 characters,"
                    + " must include only letters, digits and spaces.");
        }
        if(questions.size() > 0) {
            quiz.setQuestionList(questions);
        }
        else {
            throw new BusinessException("Quiz list of questions cannot be empty");
        }
        return quiz;
        }

    }



