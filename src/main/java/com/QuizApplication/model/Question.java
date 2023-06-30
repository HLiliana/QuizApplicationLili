package com.QuizApplication.model;

import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Data
@Entity
@Table(name="questions")

public class Question {

    @Id
    @Column(name ="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String question;
    private String choice1;
    private String choice2;
    private String choice3;
    private String choice4;
    private String answer;
    private String description;
    private String explanation;

    @ManyToMany(mappedBy = "questionList")
    private List<Quiz> quizList;



}
