<template>
  <div id="app">
    <div style="height: 60px;line-height: 60px;background-color: #cdd9d7;margin-bottom: 2px;display:flex">
      <div style="width: 620px">
        <img src="@/assets/logo.png" style="width: 40px;position: relative;top: 10px;left: 10px">
        <span style="margin-left: 25px;font-size: 24px">基于心血管病风险评估的高血压居家健康管理系统</span>
      </div>
      <div style="flex: 1;text-align: right;padding-right: 20px">
        <el-dropdown size="medium">
            <span class="el-dropdown-link" style="cursor: pointer">
              {{ admin.username }}<i class="el-icon-arrow-down el-icon--right"></i>
            </span>
          <el-dropdown-menu slot="dropdown" style="margin-top: -5px">
            <el-dropdown-item><div style="width: 50px;text-align: center;" @click="logout()">退出</div></el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>

    </div>

    <div style="display: flex">
      <div style="width:200px;min-height:calc(100vh - 62px); overflow: hidden;margin-right: 2px;background-color: #ffffff">
        <el-menu :default-active="$route.path" :default-openeds="['admin']" router class="el-menu-item">
          <el-menu-item index="/">
            <i class="el-icon-s-home" style="color: #cdd9d7"></i>
            <span>首页</span>
          </el-menu-item>
          <el-menu-item index="/">
            <i class="el-icon-message" style="color: #cdd9d7"></i>
            <span>系统公告</span>
          </el-menu-item>
          <el-submenu index="category">
            <template slot="title">
              <i class="el-icon-notebook-1" style="color: #cdd9d7"></i>
              <span>图书类别管理</span>
            </template>
            <el-menu-item index="/categoryList">图书类别列表</el-menu-item>
            <el-menu-item index="/addCategory">图书类别添加</el-menu-item>
          </el-submenu>
          <el-submenu index="book">
            <template slot="title">
              <i class="el-icon-date" style="color: #cdd9d7"></i>
              <span>图书管理</span>
            </template>
            <el-menu-item index="/bookList">图书列表</el-menu-item>
            <el-menu-item index="/addBook">图书添加</el-menu-item>
          </el-submenu>
          <el-submenu index="user">
            <template slot="title">
              <i class="el-icon-user-solid" style="color: #cdd9d7"></i>
              <span>会员管理</span>
            </template>
            <el-menu-item index="/userList">会员列表</el-menu-item>
            <el-menu-item index="/addUser">会员添加</el-menu-item>
          </el-submenu>
          <el-submenu index="admin">
            <template slot="title">
              <i class="el-icon-s-tools" style="color: #cdd9d7"></i>
              <span>管理员管理</span>
            </template>
            <el-menu-item index="/adminList">管理员列表</el-menu-item>
            <el-menu-item index="/addAdmin">管理员添加</el-menu-item>
          </el-submenu>
        </el-menu>
      </div>
      <div style="flex: 1;background-color: #ffffff">
        <router-view/>
      </div>
    </div>

  </div>
</template>
<script>
import Cookies from "js-cookie";
export default {
  name: "Layout",
  data(){
    return{
      admin: Cookies.get('admin') ? JSON.parse(Cookies.get('admin')) : {}
    }
  },
  methods:{
    logout(){
      Cookies.remove('admin')
      this.$router.push('/login')
    }
  }
}
</script>

