package com.example.springboot.mapper;
import com.example.springboot.controller.request.BorrowPageRequest;
import com.example.springboot.entity.Borrow;
import com.example.springboot.entity.Return_;
import com.example.springboot.pojo.dto.BooksSalesDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.example.springboot.mapper.po.BorrowReturCountPO;

import java.time.LocalDateTime;
import java.util.List;

@Mapper
public interface BorrowMapper {

    List<Borrow> list();

    List<Borrow> listByCondition(BorrowPageRequest pageRequest);

    List<Return_> listReturByCondition(BorrowPageRequest pageRequest);

    void save(Borrow obj);

    void saveRetur(Return_ obj);

    Borrow getById(Integer id);

    void updateById(Borrow obj);

    void deleteById(Integer id);

    void deleteReturById(Integer id);

    void updateStatus(@Param("status")String status,@Param("id")Integer id);

    List<BorrowReturCountPO> getCountByTimeRange(@Param("timeRange") String timeRange, @Param("type") int type);

    List<BooksSalesDTO> getSalesTop10(LocalDateTime beginTime, LocalDateTime endTime);
}
