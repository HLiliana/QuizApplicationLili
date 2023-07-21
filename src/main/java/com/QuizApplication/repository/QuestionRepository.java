package com.QuizApplication.repository;

import com.QuizApplication.exception.BusinessException;
import com.QuizApplication.model.Question;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import jakarta.persistence.*;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.List;

@PersistenceContext
public class QuestionRepository {
    EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("Eclipselink_JPA");
    EntityManager entityManager = emFactory.createEntityManager();

    List<Question> questionList = new ArrayList<>();

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
        if (id == null) {
            throw new Exception("Id cannot be null");
        }
        return entityManager.find(Question.class, id);
    }

    public Question findQuestionByDescription(String name) throws Exception {
        if (name == null) {
            throw new Exception("Name cannot be null");

        }
        Query query = entityManager.createQuery("SELECT q FROM Question q WHERE q.questionDescription ILIKE:customQuestionDescription");
        query.setParameter("customQuestionDescription", name);
        Question question = (Question) query.getSingleResult();
        return question;
    }

    public void deleteQuestion(Question question) {
        entityManager.getTransaction().begin();
        entityManager.remove(question);
        entityManager.getTransaction().commit();
        entityManager.close();
        emFactory.close();

    }

    public void updateQuestion(Question question) throws Exception {
        if (question == null) {
            throw new Exception("There is no question");

        }
        entityManager.getTransaction().begin();
        entityManager.merge(question);
        entityManager.getTransaction().commit();
        entityManager.close();
        emFactory.close();

    }

    public Question getQuestionsFromApi() throws BusinessException {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("https://opentdb.com/api.php?amount=10&category=22&type=multiple"))
                .build();

        try {
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            if (response.statusCode() == 200) {
                String responseBody = response.body();
                Gson gson = new Gson();
                JsonObject json = gson.fromJson(responseBody, JsonObject.class);

                JsonArray results = json.getAsJsonArray("results");
                JsonObject questionData = results.get(4).getAsJsonObject();

                String category = questionData.get("category").getAsString();
                String difficulty = questionData.get("difficulty").getAsString();
                String questionDescription = questionData.get("question").getAsString();
                String correctAnswer = questionData.get("correct_answer").getAsString();

                JsonArray incorrectAnswers = questionData.getAsJsonArray("incorrect_answers");
                String incorrectAnswer1 = incorrectAnswers.get(0).getAsString();
                String incorrectAnswer2 = incorrectAnswers.get(0).getAsString();
                String incorrectAnswer3 = incorrectAnswers.get(0).getAsString();


                return new Question(category, difficulty, questionDescription, correctAnswer,
                        incorrectAnswer1, incorrectAnswer2, incorrectAnswer3);

            }
        } catch (IOException | InterruptedException ignored) {
            throw new BusinessException("Can not Read correctly the API objects. ");
        }
        throw new RuntimeException("can't get data");
    }

    public List<Question> getMultipleQuestions() throws BusinessException {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("https://opentdb.com/api.php?amount=20&category=22&difficulty=medium&type=multiple"))
                .build();

        try {
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            if (response.statusCode() == 200) {
                String responseBody = response.body();
                Gson gson = new Gson();

                JsonObject json = gson.fromJson(responseBody, JsonObject.class);

                JsonArray results = json.getAsJsonArray("results");

                for (int i = 0; i < results.size(); i++) {

                    JsonObject questionData = results.get(i).getAsJsonObject();

                    String category = questionData.get("category").getAsString();
                    String difficulty = questionData.get("difficulty").getAsString();
                    String questionDescription = questionData.get("question").getAsString();
                    String correctAnswer = questionData.get("correct_answer").getAsString();

                    JsonArray incorrectAnswers = questionData.getAsJsonArray("incorrect_answers");
                    String incorrectAnswer1 = incorrectAnswers.get(0).getAsString();
                    String incorrectAnswer2 = incorrectAnswers.get(1).getAsString();
                    String incorrectAnswer3 = incorrectAnswers.get(2).getAsString();

                    Question question = new Question(category, difficulty, questionDescription, correctAnswer,
                            incorrectAnswer1, incorrectAnswer2, incorrectAnswer3);
                    questionList.add(question);
                }
                return questionList;
            }
        } catch (IOException | InterruptedException ignored) {
            throw new BusinessException("Did not receive questions from API");
        }
        throw new RuntimeException("can't get data");
    }
}

