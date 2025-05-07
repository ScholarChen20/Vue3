<template>
  <div style="padding: 20px">
    <div style="margin-bottom: 30px">新增图书</div>
    <el-form :inline="true" :model="form" :rules="rules" ref="ruleForm" style="width: 90%" label-width="100px" >
      <el-form-item label="图书名称" prop="name">
        <el-input v-model="form.name" placeholder="请输入名称"/>
      </el-form-item>
      <el-form-item label="描述" prop="description">
        <el-input style="width: 500px;" type="textarea" v-model="form.description" placeholder="请输入描述"/>
      </el-form-item>
      <el-form-item label="出版日期" prop="publishDate">
        <el-date-picker
            style="width: 85%"
            v-model="form.publishDate"
            value-format="yyyy-MM-dd"
            type="date"
            placeholder="请选择出版日期时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="作者" prop="author">
        <el-input v-model="form.author" placeholder="请输入作者"/>
      </el-form-item>
      <el-form-item label="出版社" prop="publisher">
        <el-input v-model="form.publisher" placeholder="请输入出版社"/>
      </el-form-item>
      <el-form-item label="分类" prop="category">
        <el-cascader v-model="form.categories"
                     :props="{ value: 'name', label: 'name'}"
                     :options="categories"
                     placeholder="请选择分类"
                     @change="handleChange"/>
      </el-form-item>
      <el-form-item label="标准码" prop="bookNo">
        <el-input v-model="form.bookNo" placeholder="请输入标准码"/>
      </el-form-item>
      <el-form-item label="积分" prop="score">
        <el-input-number v-model="form.score" :min="1" :max="10" label="积分"/>
      </el-form-item>
      <el-form-item label="数量" prop="nums">
        <el-input v-model="form.nums" placeholder="请输入数量"/>
      </el-form-item>
      <br/>
      <el-form-item label="封面" prop="cover">
        <!--        <el-input v-model="form.cover" placeholder="请输入封面"/>-->
        <el-upload
            class="avatar-uploader"
            :action="'http://localhost:9090/api/book/file/upload?token=' + this.admin.token"
            :show-file-list="false"
            :on-success="handleCoverSuccess">
          <img v-if="form.cover" :src="form.cover" class="avatar">
          <i v-else class="el-icon-plus avatar-uploader-icon"></i>
        </el-upload>
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
import {options} from "axios";
import Cookies from "js-cookie";
export default {
  name: "AddBook",
  data(){
    const checkNums = (rule, value, callback) => {
      // if(value==null || value === undefined){
      //   return callback(new Error('请输入数字'));
      // }
      value = parseInt(value);
      if (!Number.isInteger(value) || value < 0 || value > 100) {
        return callback(new Error('请输入0-100的整数'));
      }
      callback();
    };
    return{
      admin:Cookies.get('admin')?JSON.parse(Cookies.get('admin')): {},
      categories:[],
      form: {cover: ''},
      rules:{
        name:[
          {required: true, message: '请输入图书名称', trigger: 'blur'},
          {min: 2,max: 10,message:'长度在3-10个字符', trigger: 'blur'}
        ],
        score:[
          { validator: checkNums ,trigger: 'blur' }
        ],
        description:[
          {required: true, message: '请输入描述', trigger: 'blur'},
          {min: 2,max: 500,message:'长度在2-500个字符', trigger: 'blur'}
        ],
        author:[
          {required: true, message: '请输入作者', trigger: 'blur'},
          {min: 2,max: 100,message:'长度在2-100个字符', trigger: 'blur'}
        ],
        publisher:[
          {required: true, message: '请输入出版社', trigger: 'blur'},
          {min: 2,max: 100,message:'长度在2-100个字符', trigger: 'blur'}
        ],
        bookNo:[
          {required: true, message: '请输入图书标准码', trigger: 'blur'},
          {min: 2,max: 100,message:'长度在2-100个字符', trigger: 'blur'}
        ],
        cover:[
          {required: true, message: '请输入图书标准码', trigger: 'blur'},
          {min: 2,max: 100,message:'长度在2-100个字符', trigger: 'blur'}
        ],
        nums:[
          {required: true, message: '请输入数量', trigger: 'blur'},
          { validator: checkNums ,trigger: 'blur' },
        ]
      }
    }
  },
  created() {
    request.get('/category/tree').then(res => {
      this.categories = res.data;
      console.log(this.categories)
    })
  },
  methods:{
    handleCoverSuccess(res){
      if(res.code === '200'){
        this.form.cover = res.data;
      }
    },
    save(){
      this.$refs['ruleForm'].validate((valid) =>{
        if(valid){
          request.post( '/book/save',this.form).then(res => {
            if(res.code === '200'){
              this.$notify.success('新增成功！')
              this.$refs['ruleForm'].resetFields();
              this.$router.push("/bookList")
            }else{
              this.$notify.error(res.data)
            }
          })
        }
      })
    },
    reset(){
      this.$refs['ruleForm'].resetFields();
    },
    handleChange(val){
      console.log(val)
    }
  }
}
</script>

<style>
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>