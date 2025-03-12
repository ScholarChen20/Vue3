package com.example.springboot.controller.request;
import com.example.springboot.controller.request.BaseRequest;
import lombok.Data;

@Data
public class UserPageRequest extends BaseRequest {
    private String name;
    private String phone;
}
