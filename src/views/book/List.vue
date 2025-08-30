<template>
  <div style="background-color: white">
    <div>
      <el-input style="width: 200px" placeholder="请输入图书名称" v-model="params.name"></el-input>
      <el-input style="width: 200px;margin-left: 5px" placeholder="请输入图书标准码" v-model="params.bookNo"></el-input>
      <el-button style="margin-left: 3px" type="primary" @click="load"><i class="el-icon-search"></i> 搜索</el-button>
      <el-button style="margin-left: 3px" type="warning" @click="reset"><i class="el-icon-refresh"></i> 重置</el-button>
      <el-divider content-position="left"></el-divider>
    </div>

    <el-table :data="tableData" style="margin-top: 3px; width: 100%" >
      <el-table-column prop="id" label="编号" width="55px"></el-table-column>
      <el-table-column prop="name" label="图书名称" width="130px"></el-table-column>
      <el-table-column prop="description" label="描述"></el-table-column>
      <el-table-column prop="publishDate" label="出版日期" width="120px"></el-table-column>
      <el-table-column prop="author" label="作者" width="80px"></el-table-column>
      <el-table-column prop="publisher" label="出版社"></el-table-column>
      <el-table-column prop="category" label="分类" ></el-table-column>
      <el-table-column prop="bookNo" label="标准码" ></el-table-column>
      <el-table-column prop="score" label="借书积分" width="80px"></el-table-column>
      <el-table-column prop="nums" label="数量" width="80px"></el-table-column>
      <el-table-column prop="cover" label="封面" width="150px">
        <template v-slot="scope">
          <el-image style="width: 80px; height: 80px" :src="scope.row.cover" :preview-src-list="[scope.row.cover]"></el-image>
        </template>
      </el-table-column>
      <el-table-column prop="createtime" label="创建时间" width="120px"></el-table-column>
      <el-table-column prop="updatetime" label="修改时间" width="120px"></el-table-column>
      <el-table-column label="操作" width="200px">
        <template v-slot="scope">
          <!-- 调整按钮样式，确保在同一行 -->
          <el-button
            type="primary"
            size="medium"
            @click="$router.push('/editBook?id=' + scope.row.id)"
            style="margin-right: 5px; margin-bottom: 0;"
          >
            编辑
          </el-button>
          <el-popconfirm
            title="您确定删除这行数据吗?"
            @confirm="del(scope.row.id)"
            style="margin-bottom: 0;"
          >
            <el-button
              type="danger"
              size="medium"
              slot="reference"
              style="margin-bottom: 0;"
            >
              删除
            </el-button>
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
  name: 'BookList',
  data() {
    return{
      admin:Cookies.get('admin')?JSON.parse(Cookies.get('admin')): {},
      tableData:[],
      total:0,
      params: {
        pageNum:1,
        pageSize:10,
        name: '',
        bookNo:''
      }
    }
  },
  created() {
    this.load();
  },
  methods:{
    load(){
      request.get('/book/page',{
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
        bookNo:''
      }
      this.load()
    },
    handleCurrentChange(pageNum){
      this.params.pageNum=pageNum
      this.load()
    },
    del(id){
      request.delete("/book/delete/"+id).then(res => {
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
/* 添加自定义样式 */
.el-table .cell {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

/* 确保操作列的按钮在同一行 */
.el-table .el-table__body td:last-child {
  padding-right: 0;
}

/* 调整按钮的内边距 */
.el-button--small {
  padding: 6px 10px;
}
</style>
