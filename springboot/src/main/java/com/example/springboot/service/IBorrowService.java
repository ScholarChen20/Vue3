package com.example.springboot.service;

import com.example.springboot.controller.request.BorrowPageRequest;
import com.example.springboot.entity.Borrow;
import com.example.springboot.entity.Return_;
import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;
import java.util.Objects;

public interface IBorrowService {
    List<Borrow> list();

    PageInfo<Borrow> page(BorrowPageRequest baseRequest);

    PageInfo<Return_> pageReturn_(BorrowPageRequest baseRequest);

    void saveRetur(Return_ obj);

    void save(Borrow obj);

    Borrow getById(Integer id);

    void update(Borrow obj);

    void deleteById(Integer id);

    void deleteReturById(Integer id);

    Map<String, Object> getCountByTimeRange(String timeRange);
}
