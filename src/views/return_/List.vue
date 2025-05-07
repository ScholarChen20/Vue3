<template>
  <div style="background-color: white">
    <div>
      <el-input style="width: 200px" placeholder="请输入图书名称" v-model="params.bookName"></el-input>
      <el-input style="width: 200px;margin-left: 5px" placeholder="请输入图书标准码" v-model="params.bookNo"></el-input>
      <el-input style="width: 200px;margin-left: 5px" placeholder="请输入用户名称" v-model="params.userName"></el-input>
      <el-button style="margin-left: 3px" type="primary" @click="load"><i class="el-icon-search"></i> 搜索</el-button>
      <el-button style="margin-left: 3px" type="warning" @click="reset"><i class="el-icon-refresh"></i> 重置</el-button>
      <el-divider content-position="left"></el-divider>
    </div>

    <el-table :data="tableData" style="margin-top: 3px; width: 100%;height: 250px" >
      <el-table-column prop="id" label="编号" width="55px"></el-table-column>
      <el-table-column prop="bookName" label="图书名称"></el-table-column>
      <el-table-column prop="bookNo" label="图书标准码"></el-table-column>
      <el-table-column prop="userId" label="用户id"></el-table-column>
      <el-table-column prop="userName" label="用户名称"></el-table-column>
      <el-table-column prop="userPhone" label="用户联系方式"></el-table-column>
      <el-table-column prop="score" label="所用积分" ></el-table-column>
<!--      <el-table-column prop="cover" label="封面" width="200px">-->
<!--        <template v-slot="scope">-->
<!--          <el-image :src="scope.row.cover" :preview-src-list="[scope.row.cover]"></el-image>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column prop="createtime" label="创建时间"></el-table-column>
      <el-table-column prop="updatetime" label="修改时间"></el-table-column>
      <el-table-column label="操作" width="150px">
        <template v-slot="scope">
          <el-button type="primary" @click="$router.push('/editborrow?id=' + scope.row.id)">编辑</el-button>
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
import Cookies from "js-cookie";
export default {
  name: 'borrowList',
  data() {
    return{
      admin:Cookies.get('admin')?JSON.parse(Cookies.get('admin')): {},
      tableData:[],
      total:0,
      params: {
        pageNum:1,
        pageSize:10,
        bookName: '',
        bookNo:'',
        userName:'',
      }
    }
  },
  created() {
    this.load();
  },
  methods:{
    load(){
      request.get('/borrow/page',{
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
        bookName:'',
        bookNo:'',
        userName:''
      }
      this.load()
    },
    handleCurrentChange(pageNum){
      this.params.pageNum=pageNum
      this.load()
    },
    del(id){
      request.delete("/borrow/delete/"+id).then(res => {
        if(res.code === '200'){
          this.$notify.success("删除成功！")
          this.load()
        }else{
          this.$notify.error(res.data)
        }
      })
    }
  }
}
</script>


<style scoped>

</style><template>
  <div style="background-color: white">
    <div>
      <el-input style="width: 200px" placeholder="请输入图书名称" v-model="params.bookName"></el-input>
      <el-input style="width: 200px;margin-left: 5px" placeholder="请输入图书标准码" v-model="params.bookNo"></el-input>
      <el-input style="width: 200px;margin-left: 5px" placeholder="请输入用户名称" v-model="params.userName"></el-input>
      <el-button style="margin-left: 3px" type="primary" @click="load"><i class="el-icon-search"></i> 搜索</el-button>
      <el-button style="margin-left: 3px" type="warning" @click="reset"><i class="el-icon-refresh"></i> 重置</el-button>
      <el-divider content-position="left"></el-divider>
    </div>

    <el-table :data="tableData" style="margin-top: 3px; width: 100%" >
      <el-table-column prop="id" label="编号" width="55px"></el-table-column>
      <el-table-column prop="bookName" label="图书名称"></el-table-column>
      <el-table-column prop="bookNo" label="图书标准码"></el-table-column>
      <el-table-column prop="userNo" label="会员码"></el-table-column>
      <el-table-column prop="userName" label="用户名称"></el-table-column>
      <el-table-column prop="userPhone" label="用户联系方式"></el-table-column>
      <el-table-column prop="score" label="所用积分" ></el-table-column>
<!--      <el-table-column prop="cover" label="封面" width="200px">-->
<!--        <template v-slot="scope">-->
<!--          <el-image style="width: 100px; height: 100px":src="scope.row.cover" :preview-src-list="[scope.row.cover] "></el-image>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column prop="createtime" label="借出日期"></el-table-column>
      <el-table-column prop="status" label="借出状态"></el-table-column>
      <el-table-column prop="days" label="借出天数"></el-table-column>
      <el-table-column prop="returnDate" label="归还日期"></el-table-column>
      <el-table-column prop="realDate" label="实际归还日期"></el-table-column>

      <el-table-column label="操作" width="100px">
        <template v-slot="scope">
<!--          <el-button type="primary" @click="$router.push('/editborrow?id=' + scope.row.id)">编辑</el-button>-->
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
import Cookies from "js-cookie";
export default {
  name: 'ReturnList',
  data() {
    return{
      admin:Cookies.get('admin')?JSON.parse(Cookies.get('admin')): {},
      tableData:[],
      total:0,
      params: {
        pageNum:1,
        pageSize:10,
        bookName: '',
        bookNo:'',
        userName:'',
      }
    }
  },
  created() {
    this.load();
  },
  methods:{
    load(){
      request.get('/borrow/pageRetur',{
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
        bookName: '',
        bookNo:'',
        userName:'',
      }
      this.load()
    },
    handleCurrentChange(pageNum){
      this.params.pageNum=pageNum
      this.load()
    },
    del(id){
      request.delete("/borrow/deleteRetur/"+id).then(res => {
        if(res.code === '200'){
          this.$notify.success("删除成功！")
          this.load()
        }else{
          this.$notify.error(res.data)
        }
      })
    },
  }
}
</script>


<style scoped>

</style>