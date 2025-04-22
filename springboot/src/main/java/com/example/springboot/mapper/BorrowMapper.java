package com.example.springboot.mapper;
import com.example.springboot.controller.request.BorrowPageRequest;
import com.example.springboot.entity.Borrow;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BorrowMapper {

    List<Borrow> list();

    List<Borrow> listByCondition(BorrowPageRequest pageRequest);

    void save(Borrow obj);

    Borrow getById(Integer id);

    void updateById(Borrow obj);

    void deleteById(Integer id);


}
