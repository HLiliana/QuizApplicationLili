package com.QuizApplication.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Getter
@Setter
@Entity
@Table(name="questions")
@AllArgsConstructor
@NoArgsConstructor
public class Question {

    @Id
    @Column(name ="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String questionDescription;
    private String incorrectAnswer1;
    private String incorrectAnswer2;
    private String incorrectAnswer3;
    private String correctAnswer;
    private String category;
    private String difficulty;

    @ManyToMany(mappedBy = "questionList")
    private List<Quiz> quizList;

    public Question(String category, String difficulty, String questionDescription, String correctAnswer, String incorrectAnswer1, String incorrectAnswer2, String incorrectAnswer3) {
        this.questionDescription = questionDescription;
        this.incorrectAnswer1 = incorrectAnswer1;
        this.incorrectAnswer2 = incorrectAnswer2;
        this.incorrectAnswer3 = incorrectAnswer3;
        this.correctAnswer = correctAnswer;
        this.category = category;
        this.difficulty = difficulty;
    }
}
