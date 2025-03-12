<template>
  <div style="padding: 20px">
    <div style="margin-bottom: 30px">编辑分类</div>
    <el-form :inline="true" :model="form" :rules="rules" ref="ruleForm" style="width: 80%" label-width="100px" >
      <el-form-item label="名称" prop="name">
        <el-input v-model="form.name" placeholder="请输入名称"/>
      </el-form-item>
      <el-form-item label="备注" prop="remark">
        <el-input v-model="form.remark" placeholder="请输入备注"/>
      </el-form-item>
    </el-form>


    <div style="text-align: center;margin-top: 30px">
      <el-button type="primary" @click="update"><i class="el-icon-edit"></i> 更新</el-button>
      <el-button type="danger" @click="$router.push('/categoryList')"><i class="el-icon-remove"></i> 返回</el-button>
    </div>
  </div>
</template>

<script>
import request from "@/utils/request";

export default {
  name: "EditCategory",
  data(){
    return{
      form:{},
      rules:{
        name:[
          {required: true, message: '请输入分类名称', trigger: 'blur'},
          {min: 2,max: 10,message:'长度在3-10个字符', trigger: 'blur'}
        ],
        remark:[
          {required: true, message: '请输入备注', trigger: 'blur'}
        ],
      }
    }
  },
  created() {
    const id=this.$route.query.id;
    request.get("/category/"+id).then(res =>{
      this.form=res.data;
    })
  },
  methods:{
    update(){
      request.put( '/category/update',this.form).then(res => {
        if(res.code === '200'){
          this.$notify.success('更新成功！')
          this.$router.push("/categoryList")
        }else{
          this.$notify.error(res.msg)
        }
      })
    }
  }
}
</script>

