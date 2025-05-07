package com.example.springboot.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.example.springboot.controller.request.BaseRequest;
import com.example.springboot.controller.request.BorrowPageRequest;
import com.example.springboot.entity.Book;
import com.example.springboot.entity.Borrow;
import com.example.springboot.entity.Return_;
import com.example.springboot.entity.User;
import com.example.springboot.exception.ServiceException;
import com.example.springboot.mapper.BookMapper;
import com.example.springboot.mapper.BorrowMapper;
import com.example.springboot.mapper.UserMapper;
import com.example.springboot.mapper.po.BorrowReturCountPO;
import com.example.springboot.service.IBorrowService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import lombok.val;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.time.temporal.TemporalUnit;
import java.util.*;

;

@Slf4j
@Service
public class BorrwService implements IBorrowService {
    @Autowired
    BorrowMapper borrowMapper;
    @Autowired
    UserMapper userMapper;
    @Autowired
    BookMapper bookMapper;


    @Override
    public List<Borrow> list(){
        return borrowMapper.list();
    }

    @Override
    public PageInfo<Borrow> page(BorrowPageRequest baseRequest) {
        PageHelper.startPage(baseRequest.getPageNum(),baseRequest.getPageSize());
        List<Borrow> borrows = borrowMapper.listByCondition(baseRequest);
        for(Borrow borrow : borrows){
            LocalDate returnDate = borrow.getReturnDate();
            LocalDate now = LocalDate.now();
            if(now.plusDays(1).isEqual(returnDate)){ // 当前日期比归还的日期小一天
                borrow.setNote("即将到期");
            }else if(now.isEqual(returnDate)){
                borrow.setNote("已到期");
            }else if(returnDate.isAfter(now)){
                borrow.setNote("已过期");
            }else{
                borrow.setNote("正常");
            }
        }
        return new PageInfo<>(borrows);
//        return new PageInfo<>(borrowMapper.listByCondition(baseRequest));
    }

    @Override
    public PageInfo<Return_> pageReturn_(BorrowPageRequest baseRequest) {
        PageHelper.startPage(baseRequest.getPageNum(),baseRequest.getPageSize());
        return new PageInfo<>(borrowMapper.listReturByCondition(baseRequest));
    }

    @Override
    public void save(Borrow obj) {
        // 1.校验用户积分是否足够
        String userNo  = obj.getUserNo();
        User user = userMapper.getByUsername(userNo);
        if(Objects.isNull(user)){
            throw new ServiceException("用户不存在");
        }
        // 2.校验图书数量是否足够
        Book book = bookMapper.getByNo(obj.getBookNo());
        if(Objects.isNull(book)){
            throw new ServiceException("图书不存在");
        }
        // 3.检验图书数量
        if(book.getNums() < 1){
            throw new ServiceException("图书数量不足");
        }
        // 4.检验用户余额
        Integer score = book.getScore() * obj.getDays() ; // score = 借出1本积分*天数
        Integer account = user.getAccount();
        if(score > account){
            throw  new ServiceException("用户积分不够");
        }
        // 5.更新余额
        user.setAccount(user.getAccount()-score);
        userMapper.updateById(user);
        // 6.更新图书数量
        book.setNums(book.getNums()-1);
        bookMapper.updateById(book);
        // 当前日期加days得到归还日期
        obj.setReturnDate(LocalDate.now().plus(obj.getDays(), ChronoUnit.DAYS));
        // 7.更新借书记录
        obj.setUpdatetime(LocalDate.now());
        borrowMapper.save(obj);
    }

    @Transactional
    @Override
    public void saveRetur(Return_ obj){
        obj.setStatus("已归还");
        borrowMapper.updateStatus("已归还",obj.getId()); // 前端传来的借书id

//        obj.setId(null);   //新数据
        obj.setRealDate(LocalDate.now());
        borrowMapper.saveRetur(obj);
        bookMapper.updateNumByNo(obj.getBookNo());
        // 返回待归还积分
        Book book = bookMapper.getByNo(obj.getBookNo());
        if(book != null) {
            long util = 0;
            if (obj.getRealDate().isBefore(obj.getReturnDate())) {
                util = obj.getRealDate().until(obj.getReturnDate(), ChronoUnit.DAYS);
            } else if (obj.getRealDate().isAfter(obj.getReturnDate())) {
                // 逾期归还，扣除积分，不够积分则封禁账户
                util = -obj.getReturnDate().until(obj.getRealDate(), ChronoUnit.DAYS);
            }
            int score = (int) util * book.getScore();  // 获取待归还的积分
            User user = userMapper.getByUsername(obj.getUserNo());
            int account = user.getAccount() + score;
            user.setAccount(account);
            if(account < 0){
                //锁定账号
                user.setStatus(false);
            }
            userMapper.updateById(user);
        }
    }

    @Override
    public Borrow getById(Integer id) {
        return borrowMapper.getById(id);
    }

    @Override
    public void update(Borrow obj) {
        obj.setUpdatetime(LocalDate.now());
        borrowMapper.updateById(obj);
    }

    @Override
    public void deleteById(Integer id) {
        borrowMapper.deleteById(id);
    }

    @Override
    public void deleteReturById(Integer id) {
        borrowMapper.deleteReturById(id);
    }

    @Override
    public Map<String, Object> getCountByTimeRange(String timeRange) {
        Map<String, Object> map = new HashMap<>();
        Date today = new Date();
        List<DateTime> dateRange;
        switch (timeRange) {
            // offsetDay 计算时间的一个工具方法
            // rangeToList 返回从开始时间到借书时间的一个时间范围
            case  "week":
                dateRange = DateUtil.rangeToList(DateUtil.offsetDay(today,-6),today, DateField.DAY_OF_WEEK);
                break;
            case "month":
                dateRange = DateUtil.rangeToList(DateUtil.offsetDay(today,-29),today, DateField.DAY_OF_MONTH);
                break;
            case "month2":
                dateRange = DateUtil.rangeToList(DateUtil.offsetDay(today,-59),today, DateField.DAY_OF_MONTH);
                break;
            case "month3":
                dateRange = DateUtil.rangeToList(DateUtil.offsetDay(today,-89),today, DateField.DAY_OF_MONTH);
                break;
            default:
                dateRange = new ArrayList<>();
        }
        // 处理方法 把datetime类型的list转换成一个String的list
        // 1.
        List<String> dateStrRange = datetimeToDateStr(dateRange);
        map.put("date", dateStrRange);
        // 2.and3. getcountbytimrange 不会统计数据库已有的日期
        // timeRange = week or month
        List<BorrowReturCountPO> borrowCount = borrowMapper.getCountByTimeRange(timeRange,1);
        List<BorrowReturCountPO> returnCount = borrowMapper.getCountByTimeRange(timeRange,2);
        map.put("borrow", countList(borrowCount, dateStrRange));
        map.put("retur", countList(returnCount, dateStrRange));
        return map;
    }
// 对数据库统计的时间进行处理
    private List<Integer> countList(List<BorrowReturCountPO> countPOList, List<String> dateStrRange) {
        List<Integer> list = CollUtil.newArrayList();
        if (CollUtil.isEmpty(countPOList)) {
            return list;
        }
        for (String date : dateStrRange) {
            //.map(BorrowReturCountPO::getCount)取出对象里的count值
            //orELse 对没匹配的数据返回0
            // "2022-11-02" 没有的话就返回0
            Integer count = countPOList.stream().filter(countPO -> date.equals(countPO.getDate()))
                    .map(BorrowReturCountPO::getCount).findFirst().orElse(0);
            list.add(count);
        }
        return list;
//        dataRange:[
//                "2022-11-29"
//                "2022-11-29",
//                "2022-11-29",
//                "2022-11-29",
//                "2022-11-29"
//                ],
//        borrow:[
//                0,
//                0,
//                2
//                ],
//          retur:[
//                0,
//                2,
//                1
//                ]
    }
// 把datetime的list数据转为一个String的list
    private List<String> datetimeToDateStr(List<DateTime> dateTimeList) {
        List<String> list = CollUtil.newArrayList();
        if (CollUtil.isEmpty(dateTimeList)){
            return list;
        }
        for (DateTime dateTime : dateTimeList) {
            String date = DateUtil.formatDate(dateTime);
            list.add(date);
        }
        return list;
    }


}
