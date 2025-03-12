<template>
  <div style="background-color: white">
    <div>
      <el-input style="width: 200px" placeholder="请输入名称" v-model="params.name"></el-input>
      <el-input style="width: 200px;margin-left: 5px" placeholder="请输入联系方式" v-model="params.phone"></el-input>
      <el-button style="margin-left: 3px" type="primary" @click="load"><i class="el-icon-search"></i> 搜索</el-button>
      <el-button style="margin-left: 3px" type="warning" @click="reset"><i class="el-icon-refresh"></i> 重置</el-button>
      <el-divider content-position="left"></el-divider>
    </div>

    <el-table :data="tableData" style="margin-top: 3px; width: 100%;" >
      <el-table-column prop="username" label="卡号"></el-table-column>
      <el-table-column prop="name" label="姓名" width="100px"></el-table-column>
      <el-table-column prop="age" label="年龄" width="70px"></el-table-column>
      <el-table-column prop="sex" label="性别" width="70px"></el-table-column>
      <el-table-column prop="phone" label="联系方式"></el-table-column>
      <el-table-column prop="address" label="地址"></el-table-column>
      <el-table-column prop="createtime" label="创建时间"></el-table-column>
      <el-table-column prop="updatetime" label="修改时间"></el-table-column>

      <el-table-column label="操作">
        <template v-slot="scope">
          <el-button type="primary" @click="$router.push('/editUser?id='+scope.row.id)">编辑</el-button>
          <el-popconfirm title="您确定删除这行数据吗?" @confirm="del(scope.row.id)" style="margin-left: 5px">
              <el-button type="danger" slot="reference">删除</el-button>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>
    <div >
      <el-pagination
          background
          :current-page="params.pageNum"
          :page-size="params.pageSize"
          @current-change="handleCurrentChange"
          layout="prev, pager, next"
          :total="total">
      </el-pagination>
    </div>
  </div>
</template>
<script>
// @ is an alias to /src
import request from "@/utils/request";
export default {
  name: 'User',
  data() {
    return{
      tableData:[],
      total:0,
      params: {
        pageNum:1,
        pageSize:10,
        name: '',
        phone: ''
      }
    }
  },
  created() {
    this.load();
  },
  methods:{
    load(){
      //fetch( 'http://localhost:9090/user/list').then(res => res.json()).then(res =>{
      //  console.log(res)
      //  this.tableData=res
      //})
      request.get('/user/page',{
        params: this.params
      }).then(res => {
        if(res.code === '200'){
          this.tableData= res.data.list
          this.total=res.data.total
        }
      })
    },
    reset(){
      this.params ={
        pageNum: 1,
        pageSize: 10,
        name:'',
        phone:''
      }
      this.load()
    },
    handleCurrentChange(pageNum){
      this.params.pageNum=pageNum
      this.load()
    },
    del(id){
      request.delete("/user/delete/"+id).then(res => {
        if(res.code === '200'){
          this.$notify.success("删除成功！")
          this.load()
        }else{
          this.$notify.error(res.msg)
        }
      })
    }
  }
}
</script>


<style scoped>

</style>