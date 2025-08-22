package com.example.springboot.pojo.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BooksSalesDTO implements Serializable {
    //商品名称
    private String name;

    //销量
    private Integer number;
}