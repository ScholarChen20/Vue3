package com.example.springboot.controller;

import com.example.springboot.entity.Result;
import com.example.springboot.pojo.vo.BookTop10ReportVo;
import com.example.springboot.service.IReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;

@RequestMapping("/report")
@RestController
@CrossOrigin
public class ReportController {
    @Autowired
    private IReportService reportService;

    @GetMapping("/top10")
    public Result<BookTop10ReportVo> bookTop10(
            @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate begin,
            @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate end){
        return Result.success(reportService.top10(begin,end));
    }
}
