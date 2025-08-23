package com.example.springboot.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BookTop10ReportVo {
    //图书名称列表，以逗号分隔，例如：数据挖掘,深度学习,机器学习
    private String nameList;

    //借出列表，以逗号分隔，例如：260,215,200
    private String numberList;
}
