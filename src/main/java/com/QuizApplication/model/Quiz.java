package com.QuizApplication.model;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.util.List;
import java.util.stream.Collectors;

@ToString
@Getter
@Setter
@Entity
@Table(name = "quizzes")
@AllArgsConstructor
@NoArgsConstructor
public class Quiz {

    @Id
    @Column(name ="id")
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
        return getQuestionList().stream().map(Question::getQuestionDescription).collect(Collectors.joining(", "));
    }

    public Quiz(String name, String category, String difficulty) {
        this.name = name;
        this.category = category;
        this.difficulty = difficulty;
    }

}
