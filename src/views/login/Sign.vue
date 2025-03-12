<template>
  <div class="title">
    <div style="width:300px;height: 340px;background-color: #ffffff;border-radius: 10px;margin:0 400px 0 600px;padding:20px">
      <h2 style="text-align: center;font-size: 30px;font-weight:bold;color: #571a98">Sign</h2>
      <el-form :model="admin" ref="loginForm">
        <el-form-item  prop="username">
          <el-input placeholder="username" prefix-icon="el-icon-user" size="medium" v-model="admin.username" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item  prop="password">
          <el-input placeholder="username" prefix-icon="el-icon-lock" size="medium" v-model="admin.password" autocomplete="off" show-password></el-input>
        </el-form-item>
        <el-form-item  prop="newPassword">
          <el-input placeholder="newPassword" prefix-icon="el-icon-lock" size="medium" v-model="admin.newPassword"  show-password></el-input>
        </el-form-item>
        <el-form-item >
          <el-button style="margin-left: 27px;margin-top: 10px" size="30px" type="success" @click="sign()"><i class="el-icon-edit"> 注册</i></el-button>
          <el-button style="margin-left: 27px;margin-top: 10px" size="30px" type="primary" @click="reset()"><i class="el-icon-eleme"> 重置</i></el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
import request from "@/utils/request";

export default {
  name: "Sign",
  data(){
    return{
      admin:{}
    }
  },
  methods:{
    sign(){
      request.post('/admin/login',this.admin).then(res => {
        if(res.code ==='200'){
          this.$notify.success("登录成功！")
          this.$router.push('/')
        }else{
          this.$notify.error(res.msg);
        }
      })
    },
    reset(){

    }
  }
}
</script>

<style scoped>
.title {
  position: absolute;
  box-sizing: border-box;
  width: 100%;
  height: 100%;
  padding-top: 18%;
  background-image: url('@/assets/02.png');
  background-size: 100%;
}
</style>