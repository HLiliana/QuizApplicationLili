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
import java.util.Random;

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


    public void addQuestion(Question question) throws BusinessException {
        try {
            if (!isQuestionDataValid(question.getQuestionDescription())) {
                throw new BusinessException("Question cannot be null and should be between 1 and 255"
                        + "characters.");
            }
            if (!isQuestionDataValid(question.getCategory())) {
                throw new BusinessException("Question category cannot be null and should be between 1 and 255"
                        + "characters.");
            }
            if (!isQuestionDataValid(question.getDifficulty())) {
                throw new BusinessException("Question difficulty cannot be null and should be between 1 and 255"
                        + "characters.");
            }
            if (!isQuestionDataValid(question.getCorrectAnswer())) {
                throw new BusinessException("Correct answer cannot be null and should be between 1 and 255"
                        + "characters.");
            }
            if (!isQuestionDataValid(question.getIncorrectAnswer1())) {
                throw new BusinessException("Incorrect answer 1 cannot be null and should be between 1 and 255"
                        + "characters.");
            }
            if (!isQuestionDataValid(question.getIncorrectAnswer2())) {
                throw new BusinessException("Incorrect answer 2 cannot be null and should be between 1 and 255"
                        + "characters.");
            }
            if (!isQuestionDataValid(question.getIncorrectAnswer3())) {
                throw new BusinessException("Incorrect answer 3 cannot be null and should be between 1 and 255"
                        + "characters.");
            }
            entityManager.getTransaction().begin();
            entityManager.persist(question);
            entityManager.getTransaction().commit();
        } finally {
            entityManager.close();
        }
    }

    public boolean isQuestionDataValid(String data) {
        String dataValidation = "^[\\s\\S]{0,255}$";
        return data.matches(dataValidation);
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
        Query jpqlQuery = entityManager.createQuery("SELECT q FROM Question q WHERE q.questionDescription LIKE:customQuestionDescription");
        jpqlQuery.setParameter("customQuestionDescription", name);
        return (Question) jpqlQuery.getSingleResult();
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

        try {
            entityManager.getTransaction().begin();
            entityManager.merge(question);
            entityManager.getTransaction().commit();
            entityManager.close();
            emFactory.close();
        } catch (NoResultException e) {
            throw new Exception("Cannot update");
        }
    }
//public Question updateQuestion(String id, String newCategory, String newDifficulty, String newCorrectAnswer, String newIncorrectAnswer1, String newIncorrectAnswer2, String newIncorrectAnswer3, String newQuestionDescription) throws BusinessException {
//
//    entityManager.getTransaction().begin();
//    try {
//        Query query = entityManager.createQuery("SELECT q FROM Question q WHERE q.id ILIKE :id", Question.class);
//        query.setParameter("id", id);
//        Question question = (Question) query.getSingleResult();
//        if (id!= null) {
//
//            if (newCategory!=null) {
//                question.setCategory(newCategory);
//            } else {
//                throw new BusinessException("Question category cannot be null");
//            }
//            if (newDifficulty != null) {
//                question.setDifficulty(newDifficulty);
//            } else {
//                throw new BusinessException("Question category cannot be null");
//            }
//            if (newCorrectAnswer != null) {
//                question.setCorrectAnswer(newCorrectAnswer);
//            } else {
//                throw new BusinessException("Question correctAnswer cannot be null");
//            }
//            if (newIncorrectAnswer1 != null) {
//                question.setIncorrectAnswer1(newIncorrectAnswer1);
//            } else {
//                throw new BusinessException("Question incorrectAnswer1 cannot be null");
//            }
//            if (newIncorrectAnswer2 != null) {
//                question.setIncorrectAnswer2(newIncorrectAnswer2);
//            } else {
//                throw new BusinessException("Question incorrectAnswer2 cannot be null");
//            }
//            if (newIncorrectAnswer3 != null) {
//                question.setIncorrectAnswer3(newIncorrectAnswer3);
//            } else {
//                throw new BusinessException("Question incorrectAnswer3 cannot be null");
//            }
//            if (newQuestionDescription != null) {
//                question.setQuestionDescription(newQuestionDescription);
//            } else {
//                throw new BusinessException("Question question description cannot be null");
//            }
//            question = entityManager.merge(question);
//            entityManager.getTransaction().commit();
//            return question;
//        } else {
//            throw new BusinessException("Name and new name cannot be the same.");
//        }
//    } catch (NoResultException e) {
//        entityManager.getTransaction().rollback();
//        throw new BusinessException("Quiz cannot be found in database.");
//    }
//}

    public Question getQuestionsFromApi() throws BusinessException {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("https://opentdb.com/api.php?amount=20&category=22&difficulty=easy&type=multiple"))
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
                String correctAnswer = questionData.get("correct_answer").getAsString();

                JsonArray incorrectAnswers = questionData.getAsJsonArray("incorrect_answers");
                String incorrectAnswer1 = incorrectAnswers.get(0).getAsString();
                String incorrectAnswer2 = incorrectAnswers.get(0).getAsString();
                String incorrectAnswer3 = incorrectAnswers.get(0).getAsString();
                String questionDescription = questionData.get("question").getAsString();


                return new Question(category, difficulty, correctAnswer, incorrectAnswer1, incorrectAnswer2,
                        incorrectAnswer3, questionDescription);

            }
        } catch (IOException | InterruptedException ignored) {
            throw new BusinessException("Can not Read correctly the API objects. ");
        }
        throw new RuntimeException("can't get data");
    }

    public List<Question> getMultipleQuestions() throws BusinessException {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("https://opentdb.com/api.php?amount=20&category=27&difficulty=easy&type=multiple"))
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

    public List<Question> randomQuestionList(String numberOfQuestions, List<Question> questionList) {
        Random rand = new Random();

        return rand.
                ints(Long.parseLong(numberOfQuestions), 0, questionList.size())

                .mapToObj(i -> questionList.get(i)).
                toList();
    }

    public List<Question> groupByCategoryAndDifficulty(String category, String difficulty, List<Question> questionList) {

        return questionList.stream()
                .filter(question -> question.getCategory().equals(category) && question.getDifficulty().equals(difficulty))
                .toList();

    }

    public List<Question> completeRandomQuestionList(String numberOfQuestions, List<Question> aQuestionList) throws BusinessException {
        Random rand = new Random();
        List<Question> aRandomList;
        if (Integer.parseInt(numberOfQuestions) >= aQuestionList.size()) {
            throw new BusinessException("The number of questions must be lower then " + aQuestionList.size());
        }
        try {

            aRandomList = rand

                    .ints(Long.parseLong(numberOfQuestions), 0, aQuestionList.size())
                    .mapToObj(aQuestionList::get)
                    .toList();
        } catch (Exception e) {
            throw new BusinessException("Something went wrong");
        }
        return aRandomList;
    }
}

