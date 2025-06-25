# 图书管理系统

本项目是使用 SpringBoot + Vue3 框架开发的一个在线图书管理系统。

## 技术栈

- 后端框架
  - SpringBoot
  - mybatis
  - hutool
- 数据库
  - MySql
- 前端框架
  - Vue
  - ElementUI
  - Vue-Router
  - Axios
  - ECharts
    
## Windows 开发环境搭建

1. 安装 Java JDK 8 并配置环境变量
2. 安装 MySQL、Redis 数据库并创建相应数据库

   - 创建 MySQL 数据库与表: 运行 [mysql.sql](./db_library.sql)

3. 安装 Maven 构建工具
4. 克隆项目到本地 `git clone https://github.com/ScholarChen20/Vue3.git `
5. 修改后端代码配置文件 [application.yml](./springboot/src/main/resources/application.yml)
   
    ```yml
    spring:
       datasource:
          driver-class-name: com.mysql.jdbc.Driver
          url: jdbc:mysql://localhost:3306/数据库名?useUnicode=true&characterEncoding=utf8&useSSL=false
          username: mysql用户账号
          password: mysql用户密码
   
    server: 
      9090
    mybatis:
        mapper-locations: classpath:mapper/*.xml
        configuration:
        map-underscore-to-camel-case: true
    ```
6. 配置node.js运行前端框架
7. 运行SpringBoot框架和前端界面即可
8. 系统功能图

![SystemInfo.png](assert/SystemInfo.png)

9.系统展示

### 登录页面

![login](https://github.com/user-attachments/assets/3b157c1e-499c-4ca2-8acd-824685b53e4d)

### 系统首页

![home](https://github.com/user-attachments/assets/fd8ee6b1-9e7c-4d84-8fbc-31b3bca75eee)

### 借书页面

![borrow](https://github.com/user-attachments/assets/40b8cf07-501b-403d-a02a-03bfe1de4577)

### 还书页面

![returnList](https://github.com/user-attachments/assets/1771cf66-71dd-4076-946d-1630037e083c)

### 图书页面

![bookList](https://github.com/user-attachments/assets/c70308cc-aade-4b77-944a-a364eb62174c)

### 图书类别页面

![categoryList](https://github.com/user-attachments/assets/b2364aeb-0ad0-436c-8e2c-2ae8b3b4dece)

### 会员页面

![userList](https://github.com/user-attachments/assets/ad780837-b722-429c-b441-c6a2f47655f3)

### 管理员页面

![adminList](https://github.com/user-attachments/assets/2b79b693-6e6f-4764-84c5-7daa1cf74fc3)
   
# vue项目运行步骤

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).
