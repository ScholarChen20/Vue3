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

    /**
     * 创建树形结构, pid为null表示从第一级开始递归, 否则递归到指定pid的子节点    //完全递归方法来实现递归树
     * @param pid
     * @param categories
     * @return
     */
    private List<Category> createTree(Integer pid,List<Category> categories){
        List<Category> treeList=new ArrayList<>(); //树形结构的list
        for(Category category : categories){ // 遍历所有节点
            if(pid == null){ // 根节点
                if(category.getPid() == null){ // 根节点
                    treeList.add(category); // 添加根节点
                    category.setChildren(createTree(category.getId(),categories)); // 递归添加子节点
                }
            }else{
                if(pid.equals(category.getPid())){ // 父节点
                    treeList.add(category);// 添加父节点
                    category.setChildren(createTree(category.getId(),categories)); // 递归添加子节点
                }
            }
            if(CollUtil.isEmpty(category.getChildren())){ // 父节点没有子节点, 则将children置空
                category.setChildren(null); // 父节点没有子节点, 则将children置空
            }
        }
        return treeList;
    }

    @GetMapping("/page")
    public Result page(CategoryPageRequest baseRequest) {
        return Result.success(categoryService.page(baseRequest));
    }
}
