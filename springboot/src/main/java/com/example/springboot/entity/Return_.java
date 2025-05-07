package com.example.springboot.entity;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDate;

@Data
public class Return_ {
    private Integer id;
    private String bookName;
    private String bookNo;
    private String userNo;
    private String userName;
    private String userPhone;
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private LocalDate createtime;
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private LocalDate updatetime;
    private Integer score;
    private String status;
    private Integer days;
    private LocalDate returnDate;
//    //提醒状态 即将到期（-1）
//    private String note;
    private LocalDate realDate;
}
