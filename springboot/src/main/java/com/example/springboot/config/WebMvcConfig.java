package com.example.springboot.config;

import com.example.springboot.common.JwtInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Autowired
    private JwtInterceptor jwtInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(jwtInterceptor)
                .addPathPatterns("/**") // 拦截所有路径
                .excludePathPatterns("/admin/sign")  // 排除注册接口
                .excludePathPatterns("/admin/login");// 排除登录接口
//                .excludePathPatterns("/api/public/**"); // 排除其他公开接口
    }
}