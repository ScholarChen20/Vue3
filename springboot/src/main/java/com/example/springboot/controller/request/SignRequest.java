package com.example.springboot.controller.request;

import lombok.Data;

@Data
public class SignRequest {
    private String username;
    private String password;
    private String newPassword;
}
