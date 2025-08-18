package com.example.springboot.controller;

import com.example.springboot.common.Result;
import com.example.springboot.controller.dto.LoginDTO;
import com.example.springboot.controller.request.*;
import com.example.springboot.entity.Admin;
import com.example.springboot.exception.ServiceException;
import com.example.springboot.service.IAdminService;
import com.example.springboot.service.impl.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    IAdminService adminService;

    /**
     * 登录接口
     * @param request
     * @return
     */
    @PostMapping("/login")
    public Result login(@RequestBody LoginRequest request) {
        LoginDTO login=adminService.login(request);
        return Result.success(login);
    }

    /**
     * 注册接口
     * @param request
     * @return
     */
    @PostMapping("/sign")
    public Result sign(@RequestBody SignRequest request) {
        try {
            adminService.sign(request);
            return Result.success("注册成功");
        } catch (ServiceException e) {
            // 捕获业务异常并返回给前端
            return Result.error(e.getCode(), e.getMessage());
        }
    }

    @PutMapping("/password")
    public Result password(@RequestBody PasswordRequest request) {
        adminService.changePass(request);
        return Result.success();
    }

    @PostMapping("/save")
    public Result save(@RequestBody Admin obj){
        adminService.save(obj);
        return Result.success();
    }
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id){
        adminService.deleteById(id);
        return Result.success();
    }
    @PutMapping("/update")
    public Result update(@RequestBody Admin obj){
        adminService.update(obj);
        return Result.success();
    }
    @GetMapping("/{id}")
    public Result getById(@PathVariable Integer id) {
        Admin obj=adminService.getById(id);
        return Result.success(obj);
    }

    @GetMapping("/list")
    public Result list() {
        List<Admin> list=adminService.list();
        return Result.success(list);
    }

    @GetMapping("/page")
    public Result page(AdminPageRequest pageRequest) {
        return Result.success(adminService.page(pageRequest));
    }
}
