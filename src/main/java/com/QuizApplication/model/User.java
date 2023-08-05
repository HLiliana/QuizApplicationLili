package com.QuizApplication.model;

import com.QuizApplication.exception.BusinessException;
import jakarta.persistence.*;
import lombok.*;
import lombok.EqualsAndHashCode;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import java.util.List;

@Entity
@Table(name = "users")
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = {"username", "password", "userRole", "email", "phone"})
public class User {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String username;
    private String password;
    private String userRole;
    private String email;
    private String phone;
    @OneToMany(cascade = {CascadeType.MERGE}, fetch = FetchType.LAZY, mappedBy = "user")
//    @JoinTable(
//            name = "users_quizzes",
//            joinColumns = {@JoinColumn(name="users_id")},
//            inverseJoinColumns = {@JoinColumn(name="quizzes_id")}
//    )
    @Fetch(FetchMode.JOIN)
    private List<Quiz> quizCustomList;

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(String username, String password, String email, String phone) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.phone = phone;
    }

    public boolean createQuizByUser(String name, String category, String difficulty, List<Question> questions) throws BusinessException {
        if (isQuizDataValid(name)) {
            throw new BusinessException("Quiz name should be at least 4 characters long and maxim 50 characters,"
                    + " must include only letters, digits and spaces.");
        }
        if (isQuizDataValid(category)) {
            throw new BusinessException("Quiz category should be at least 4 characters long and maxim 50 characters,"
                    + " must include only letters, digits and spaces.");
        }
        if (isQuizDataValid(difficulty)) {
            throw new BusinessException("Quiz new difficulty should be at least 4 characters long and maxim 50 characters,"
                    + " must include only letters, digits and spaces.");
        }
        if (questions.size()<4) {
            throw new BusinessException("Quiz list of questions should have 4 answers");
        }
        Quiz quiz = new Quiz(name, category, difficulty, questions);
        quizCustomList.add(quiz);
        return true;
    }

    public boolean isQuizDataValid(String data) {
        String dataValidation = "^[a-zA-Z0-9 ]{4,50}$";
        return data.matches(dataValidation);
    }

    public boolean addQuizToUser(Quiz quiz) throws BusinessException {
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
        quizCustomList.add(quiz);
        return true;
    }
    public List<Quiz> getAllQuizzesForSpecificUser(User user) {
        List<Quiz> quizList = user.getQuizCustomList();
        return quizList;
    }
}
