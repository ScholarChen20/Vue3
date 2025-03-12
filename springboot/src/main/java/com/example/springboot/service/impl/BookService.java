package com.example.springboot.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.example.springboot.controller.request.BookPageRequest;
import com.example.springboot.controller.request.CategoryPageRequest;
import com.example.springboot.entity.Book;
import com.example.springboot.mapper.BookMapper;
import com.example.springboot.mapper.CategoryMapper;
import com.example.springboot.service.IBookService;
import com.example.springboot.service.ICategoryService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

;

@Slf4j
@Service
public class BookService implements IBookService {
    @Autowired
    BookMapper bookMapper;


    @Override
    public List<Book> list(){
        return bookMapper.list();
    }

    @Override
    public PageInfo<Book> page(BookPageRequest pageRequest) {
        PageHelper.startPage(pageRequest.getPageNum(),pageRequest.getPageSize());
        return new PageInfo<>(bookMapper.listByCondition(pageRequest));
    }
    @Override
    public void save(Book obj) {
        List<String> categories = obj.getCategories();
        StringBuilder sb = new StringBuilder();
        if(CollUtil.isNotEmpty(categories)){
            categories.forEach(v -> sb.append(v).append(" > "));
            obj.setCategory(sb.toString().substring(0,sb.lastIndexOf(" > ")));
        }

        bookMapper.save(obj);
    }

    @Override
    public Book getById(Integer id) {
        return bookMapper.getById(id);
    }

    @Override
    public void update(Book obj) {
        obj.setUpdatetime(new Date());
        bookMapper.updateById(obj);
    }

    @Override
    public void deleteById(Integer id) {
        bookMapper.deleteById(id);
    }


}
