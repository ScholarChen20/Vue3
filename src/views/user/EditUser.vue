<template>
  <div style="padding: 20px">
    <div style="margin-bottom: 30px">编辑用户信息</div>
    <el-form :inline="true" :model="form" style="width: 80%" label-width="100px" >
      <el-form-item label="卡号" prop="username">
        <el-input v-model="form.username" disabled/>
      </el-form-item>
      <el-form-item label="姓名" prop="name">
        <el-input v-model="form.name" placeholder="请输入姓名"/>
      </el-form-item>
      <el-form-item label="年龄" prop="age">
        <el-input v-model="form.age" placeholder="请输入年龄"/>
      </el-form-item>
      <el-form-item label="性别" prop="sex">
        <el-input v-model="form.sex" placeholder="请输入性别"/>
      </el-form-item>
      <el-form-item label="联系方式" prop="phone">
        <el-input v-model="form.phone" placeholder="请输入联系方式"/>
      </el-form-item>
      <el-form-item label="地址" prop="address">
        <el-input v-model="form.address" placeholder="请输入地址"/>
      </el-form-item>

    </el-form>

    <div style="text-align: center;margin-top: 30px">
      <el-button type="primary" @click="update"><i class="el-icon-edit"></i> 更新</el-button>
      <el-button type="danger" @click="$router.push('/userList')"><i class="el-icon-remove"></i> 返回</el-button>
    </div>
  </div>
</template>

<script>
import request from "@/utils/request";

export default {
  name: "EditUser",
  data(){
    return{
      form:{}
    }
  },
  created() {
    const id=this.$route.query.id;
    request.get("/user/"+id).then(res =>{
      this.form=res.data;
    })
  },
  methods:{
    update(){
      request.put( '/user/update',this.form).then(res => {
        if(res.code === '200'){
          this.$notify.success('更新成功！')
          this.$router.push("/userList")
        }else{
          this.$notify.error(res.msg)
        }
      })
    }
  }
}
</script>

