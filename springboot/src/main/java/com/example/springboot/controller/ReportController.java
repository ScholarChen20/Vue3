package com.example.springboot.controller;

import com.example.springboot.entity.Result;
import com.example.springboot.pojo.vo.BookTop10ReportVo;
import com.example.springboot.pojo.vo.UsersTop10ReportVo;
import com.example.springboot.service.IReportService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

@Slf4j
@RestController
@CrossOrigin
@RequestMapping("/report")
public class ReportController {
    @Autowired
    private IReportService reportService;

    @GetMapping("/top10")
    public Result<BookTop10ReportVo> bookTop10(
            @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate begin, // 默认值
            @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate end){
        end = end == null ? LocalDate.now() : end;
        begin = begin == null ? LocalDate.now().minusMonths(6) : begin;
        log.info("图书热借开始时间：{}，结束时间：{}", begin, end);
        return Result.success(reportService.top10(begin,end));
    }

    @GetMapping("/users")
    public Result<UsersTop10ReportVo> users(
            @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate begin, // 默认值
            @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate end){
        end = end == null ? LocalDate.now() : end;
        begin = begin == null ? LocalDate.now().minusMonths(6) : begin;
        log.info("借阅次数查询开始时间：{}，结束时间：{}", begin, end);
        return Result.success(reportService.top10Users(begin,end));
    }

    @GetMapping("/test")
    public Result<String> test() {
       return Result.success("测试成功");
    }

}
