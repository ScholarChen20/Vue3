package com.example.springboot.service.impl;

import com.example.springboot.entity.Borrow;
import com.example.springboot.mapper.BorrowMapper;
import com.example.springboot.pojo.dto.BooksSalesDTO;
import com.example.springboot.pojo.vo.BookTop10ReportVo;
import com.example.springboot.service.IReportService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class ReportService implements IReportService {
    private final BorrwService borrwService;
    private final BorrowMapper borrowMapper;

    public ReportService(BorrwService borrwService, BorrowMapper borrowMapper) {
        this.borrwService = borrwService;
        this.borrowMapper = borrowMapper;
    }

    @Override
    public BookTop10ReportVo top10(LocalDate begin, LocalDate end) {
        long daysBetween = ChronoUnit.DAYS.between(begin, end);
        if (daysBetween > 180) {
            throw new IllegalArgumentException("查询时间范围不能超过180天");
        }
        LocalDateTime beginTime = LocalDateTime.of(begin, LocalTime.MIN);
        LocalDateTime endTime = LocalDateTime.of(end, LocalTime.MAX);
        // 1.先查订单表
        List<BooksSalesDTO> salesTop10 = borrowMapper.getSalesTop10(beginTime, endTime);


        // 2.封装成nameList和numberList
        List<String> nameList = salesTop10.stream().map(BooksSalesDTO::getName).collect(Collectors.toList());
        List<Integer> numberList = salesTop10.stream().map(BooksSalesDTO::getNumber).collect(Collectors.toList());

        // 3.封装成BookTop10ReportVo并返回
        return BookTop10ReportVo.builder()
                .nameList(StringUtils.join(nameList, ","))
                .numberList(StringUtils.join(numberList, ","))
                .build();

    }
}
