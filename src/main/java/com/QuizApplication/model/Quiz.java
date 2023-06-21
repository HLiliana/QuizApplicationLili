package com.QuizApplication.model;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.util.List;
import java.util.stream.Collectors;

@Data
@Entity
@Table(name = "quizzes")
public class Quiz {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    private String category;
    private String difficulty;

    @ManyToMany(cascade = {CascadeType.ALL}, fetch = FetchType.LAZY)
    @JoinTable(
            name = "quizzes_questions",
            joinColumns = {@JoinColumn(name = "quiz_id")},
            inverseJoinColumns = {@JoinColumn(name = "question_id")}
    )
    @Fetch(FetchMode.JOIN)
    private List<Question> questionList;

    public String getQuestionsAsCsv(){
        return getQuestionList().stream().map(Question::getQuestion).collect(Collectors.joining(", "));
    }

    public Quiz(String name, String category, String difficulty) {
        this.name = name;
        this.category = category;
        this.difficulty = difficulty;
    }

    public Quiz() {
    }
}
