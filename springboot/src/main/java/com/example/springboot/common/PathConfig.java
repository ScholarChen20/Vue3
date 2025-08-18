package com.example.springboot.common;

import lombok.Data;

@Data
public class PathConfig {
    // 定义需要排除的路径（白名单）
    public static final String[] EXCLUDE_PATHS = {
            "/admin/sign",  // 注册接口
            "/admin/login",  // 登录接口
    };
}
