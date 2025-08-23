package com.example.springboot.pojo;

import lombok.Data;

@Data
public class BorrowStatus {
    private static final String BORROW_STATUS_WAIT = "待借阅";
    private static final String BORROW_STATUS_BORROWING = "已借出";
    private static final String BORROW_STATUS_RETURNING = "已归还";
}
