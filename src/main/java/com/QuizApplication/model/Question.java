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
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private String questionDescription;
    private String category;
    private String difficulty;
    private String correctAnswer;
    private String incorrectAnswer1;
    private String incorrectAnswer2;
    private String incorrectAnswer3;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "quiz_id")
    private Quiz quiz;


    public Question(String questionDescription, String category, String difficulty, String correctAnswer, String incorrectAnswer1, String incorrectAnswer2, String incorrectAnswer3) {
        this.questionDescription = questionDescription;
        this.category = category;
        this.difficulty = difficulty;
        this.correctAnswer = correctAnswer;
        this.incorrectAnswer1 = incorrectAnswer1;
        this.incorrectAnswer2 = incorrectAnswer2;
        this.incorrectAnswer3 = incorrectAnswer3;
    }

    public Question(int id, String questionDescription, String category, String difficulty, String correctAnswer, String incorrectAnswer1, String incorrectAnswer2, String incorrectAnswer3) {
        this.id = id;
        this.questionDescription = questionDescription;
        this.category = category;
        this.difficulty = difficulty;
        this.correctAnswer = correctAnswer;
        this.incorrectAnswer1 = incorrectAnswer1;
        this.incorrectAnswer2 = incorrectAnswer2;
        this.incorrectAnswer3 = incorrectAnswer3;
    }
}
