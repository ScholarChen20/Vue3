<template>
  <div style="padding: 20px">
    <div style="margin-bottom: 30px">新增管理员</div>
    <el-form :inline="true" :model="form" :rules="rules" ref="ruleForm" style="width: 100%" label-width="100px" >
      <el-form-item label="用户名" prop="username">
        <el-input v-model="form.username" placeholder="请输入用户名"/>
      </el-form-item>
      <el-form-item label="联系方式" prop="phone">
        <el-input v-model="form.phone" placeholder="请输入联系方式"/>
      </el-form-item>
      <el-form-item label="邮箱" prop="email">
        <el-input v-model="form.email" placeholder="请输入邮箱"/>
      </el-form-item>
    </el-form>

    <div style="text-align: center;margin-top: 30px">
      <el-button type="primary" @click="save"><i class="el-icon-sunset"></i> 提交</el-button>
      <el-button type="danger" @click="reset"><i class="el-icon-refresh"></i> 重置</el-button>
    </div>
  </div>
</template>

<script>
import request from "@/utils/request";

export default {
  name: "Add",
  data(){
    //const checkAge = (rule, value, callback) => {
    //  if (!value) {
    //    return callback(new Error('年龄不能为空'));
    //  }
    //  if (!/^[0-9]+$/.test(value)) {
    //    callback(new Error('请输入数字值'));
    //  }
    //  if(parseInt(value)>120||parseInt(value)==0){
    //    callback(new Error('请输入合理的数值'));
    //  }
    //  callback();
    //}
    const checkPhone =(rule ,value,callback) => {
      if (!/^[1][3,4,5,6,7,8,9][0-9]{9}$/.test(value)) {
        callback(new Error('请输入合法的手机号'));
      }
      callback();
    };
    return{
      form:{},
      rules:{
        username:[
          {required: true, message: '请输入用户名', trigger: 'blur'},
          {min: 3,max: 10,message:'长度在3-10个字符', trigger: 'blur'}
        ],
        phone:[
          { validator: checkPhone ,trigger:'blur'}
        ],
        email:[
          {required: true, message: '请输入地址', trigger: 'blur'}
        ],
      }
    }
  },
  methods:{
    save(){
      this.$refs['ruleForm'].validate((valid) =>{
        if(valid){
          request.post( '/admin/save',this.form).then(res => {
            if(res.code === '200'){
              this.$notify.success('新增成功！')
              this.$refs['ruleForm'].resetFields();
              this.$router.push("/adminList")
            }else{
              this.$notify.error(res.data)
            }
          })
        }
      })
    },
    reset(){
      this.$refs['ruleForm'].resetFields();
    }
  }
}
</script>

