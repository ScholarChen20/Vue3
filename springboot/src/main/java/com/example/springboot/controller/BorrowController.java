package com.example.springboot.controller;

import com.example.springboot.common.Result;
import com.example.springboot.controller.request.BorrowPageRequest;
import com.example.springboot.entity.Borrow;
import com.example.springboot.entity.Return_;
import com.example.springboot.service.IBorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/borrow")
public class BorrowController {

    @Autowired
    IBorrowService borrowService;


    @PostMapping("/save")
    public Result save(@RequestBody Borrow obj){
        borrowService.save(obj);
        return Result.success();
    }
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id){
        borrowService.deleteById(id);
        return Result.success();
    }
    @PutMapping("/update")
    public Result update(@RequestBody Borrow obj){
        borrowService.update(obj);
        return Result.success();
    }
    @GetMapping("/{id}")
    public Result getById(@PathVariable Integer id) {
        Borrow obj=borrowService.getById(id);
        return Result.success(obj);
    }

    @GetMapping("/list")
    public Result list() {
        List<Borrow> list=borrowService.list();
        return Result.success(list);
    }

    @GetMapping("/page")
    public Result page(BorrowPageRequest pageRequest) {
        return Result.success(borrowService.page(pageRequest));
    }

    // 还书接口
    @GetMapping("/pageRetur")
    public Result pageReturn_(BorrowPageRequest pageRequest) {
        return Result.success(borrowService.pageReturn_(pageRequest));
    }

    @PostMapping("/saveRetur")
    public Result saveReturn_(@RequestBody Return_ obj){
        borrowService.saveRetur(obj);
        return Result.success();
    }

    @DeleteMapping("/deleteRetur/{id}")
    public Result deleteReturn_(@PathVariable Integer id){
        borrowService.deleteReturById(id);
        return Result.success();
    }

    // 还书接口
    @GetMapping("/lineCharts/{timeRange}")
    public Result lineCharts(@PathVariable String timeRange) {
        return Result.success(borrowService.getCountByTimeRange(timeRange));
    }

}
