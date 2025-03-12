<template>
  <div style="padding: 20px">
    <div style="margin-bottom: 30px">编辑图书</div>
    <el-form :inline="true" :model="form" :rules="rules" ref="ruleForm" style="width: 80%" label-width="100px" >
      <el-form-item label="图书名称" prop="name">
        <el-input v-model="form.name" placeholder="请输入名称"/>
      </el-form-item>
      <el-form-item label="描述" prop="description">
        <el-input style="width: 400px" type="textarea" v-model="form.description" placeholder="请输入描述"/>
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
                     :porps="{value: 'name',label: 'name'}"
                     :options="categories"
                     placeholder="请选择分类"/>
      </el-form-item>
      <el-form-item label="标准码" prop="bookNo">
        <el-input v-model="form.bookNo" placeholder="请输入标准码"/>
      </el-form-item>
      <el-form-item label="封面" prop="cover">
        <el-input v-model="form.cover" placeholder="请输入封面"/>
      </el-form-item>
    </el-form>
    <div style="text-align: center;margin-top: 30px">
      <el-button type="primary" @click="update"><i class="el-icon-edit"></i> 更新</el-button>
      <el-button type="danger" @click="$router.push('/bookList')"><i class="el-icon-remove"></i> 返回</el-button>
    </div>
  </div>
</template>

<script>
import request from "@/utils/request";

export default {
  name: "EditBook",
  data(){
    return{
      categories:[],
      form:{},
      rules:{
        name:[
          {required: true, message: '请输入图书名称', trigger: 'blur'},
          {min: 2,max: 10,message:'长度在3-10个字符', trigger: 'blur'}
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
        ]
      }
    }
  },
  created() {
    request.get('/category/tree').then(res => {
      this.categories = res.data;
      console.log(this.categories)
    })

    const id=this.$route.query.id;
    request.get("/book/"+id).then(res =>{
      this.form=res.data;
      if(this.form.category){
        this.form.categories = this.form.category.split(' > ')
      }
    })
  },
  methods:{
    update(){
      request.put( '/book/update',this.form).then(res => {
        if(res.code === '200'){
          this.$notify.success('更新成功！')
          this.$router.push("/bookList")
        }else{
          this.$notify.error(res.data)
        }
      })
    }
  }
}
</script>

