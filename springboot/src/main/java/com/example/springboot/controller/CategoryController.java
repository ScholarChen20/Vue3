package com.example.springboot.controller;

import cn.hutool.core.collection.CollUtil;
import com.example.springboot.common.Result;
import com.example.springboot.controller.request.*;
import com.example.springboot.entity.Category;
import com.example.springboot.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    ICategoryService categoryService;


    @PostMapping("/save")
    public Result save(@RequestBody Category obj){
        categoryService.save(obj);
        return Result.success();
    }
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id){
        categoryService.deleteById(id);
        return Result.success();
    }
    @PutMapping("/update")
    public Result update(@RequestBody Category obj){
        categoryService.update(obj);
        return Result.success();
    }
    @GetMapping("/{id}")
    public Result getById(@PathVariable Integer id) {
        Category obj=categoryService.getById(id);
        return Result.success(obj);
    }

    @GetMapping("/list")
    public Result list() {
        List<Category> list=categoryService.list();
        return Result.success(list);
    }

    @GetMapping("/tree")
    public Result tree() {
        List<Category> list=categoryService.list();
        return Result.success(createTree(null,list));//null 表示从第一级开始递归
    }
    //完全递归方法来实现递归树
    private List<Category> createTree(Integer pid,List<Category> categories){
        List<Category> treeList=new ArrayList<>();
        for(Category category : categories){
            if(pid == null){
                if(category.getPid() == null){
                    treeList.add(category);
                    category.setChildren(createTree(category.getId(),categories));
                }
            }else{
                if(pid.equals(category.getPid())){
                    treeList.add(category);
                    category.setChildren(createTree(category.getId(),categories));
                }
            }
            if(CollUtil.isEmpty(category.getChildren())){
                category.setChildren(null);
            }
        }
        return treeList;
    }

    @GetMapping("/page")
    public Result page(CategoryPageRequest baseRequest) {
        return Result.success(categoryService.page(baseRequest));
    }
}
