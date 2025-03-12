<template>
  <div style="padding: 20px">
    <div style="margin-bottom: 30px">编辑管理员</div>
    <el-form :inline="true" :model="form" :rules="rules" ref="ruleForm" style="width: 80%" label-width="100px" >
      <el-form-item label="用户名" prop="username">
        <el-input v-model="form.username" placeholder="请输入用户名"/>
      </el-form-item>
      <el-form-item label="密码" prop="password">
        <el-input v-model="form.password" placeholder="请输入密码"/>
      </el-form-item>
      <el-form-item label="联系方式" prop="phone">
        <el-input v-model="form.phone" placeholder="请输入联系方式"/>
      </el-form-item>
      <el-form-item label="邮箱" prop="email">
        <el-input v-model="form.email" placeholder="请输入邮箱"/>
      </el-form-item>
    </el-form>


    <div style="text-align: center;margin-top: 30px">
      <el-button type="primary" @click="update"><i class="el-icon-edit"></i> 更新</el-button>
      <el-button type="danger" @click="$router.push('/adminList')"><i class="el-icon-remove"></i> 返回</el-button>
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
    request.get("/admin/"+id).then(res =>{
      this.form=res.data;
    })
  },
  methods:{
    update(){
      request.put( '/admin/update',this.form).then(res => {
        if(res.code === '200'){
          this.$notify.success('更新成功！')
          this.$router.push("/adminList")
        }else{
          this.$notify.error(res.msg)
        }
      })
    }
  }
}
</script>

