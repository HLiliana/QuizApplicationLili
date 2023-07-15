package com.QuizApplication.model.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

public class UserUpdateDto {
    private String username;
    private String password;
    private String phone;
}
