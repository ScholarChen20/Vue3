package com.example.springboot.service;

import com.example.springboot.pojo.vo.BookTop10ReportVo;

import java.time.LocalDate;

public interface IReportService {
    BookTop10ReportVo top10(LocalDate begin, LocalDate end);
}
