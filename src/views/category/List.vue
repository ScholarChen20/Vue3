<template>
  <div style="background-color: white">
    <div>
      <el-input style="width: 200px" placeholder="请输入分类名称" v-model="params.name"></el-input>
      <el-button style="margin-left: 3px" type="primary" @click="load"><i class="el-icon-search"></i> 搜索</el-button>
      <el-button style="margin-left: 3px" type="warning" @click="reset"><i class="el-icon-refresh"></i> 重置</el-button>
      <el-divider content-position="left"></el-divider>
    </div>

    <el-table :data="tableData" style="margin-top: 3px; width: 100%;" default-expand-all row-key="id" >
      <el-table-column prop="id" label="编号" width="250px"></el-table-column>
      <el-table-column prop="name" label="名称" width="250px"></el-table-column>
      <el-table-column prop="remark" label="备注" width="250px"></el-table-column>
      <el-table-column prop="createtime" label="创建时间" width="250px"></el-table-column>
      <el-table-column prop="updatetime" label="修改时间" width="250px"></el-table-column>
      <el-table-column label="操作" width="500px">
        <template v-slot="scope">
          <el-button type="success" v-if="!scope.row.pid" @click="handleAdd(scope.row)">添加二级分类</el-button>
          <el-button type="primary" @click="$router.push('/editCategory?id=' + scope.row.id)">编辑</el-button>
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

    <el-dialog title="添加二级分类" :visible.sync="dialogFormVisible" width="30%">
      <el-form :model="form" label-width="100px" ref="formRef" :rules="rules" style="width: 85%">
        <el-form-item label="分类名称" prop="name">
          <el-input v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="分类备注" prop="remark">
          <el-input v-model="form.remark" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
// @ is an alias to /src
import request from "@/utils/request";
import Cookies from "js-cookie";
export default {
  name: 'CategoryList',
  data() {
    return{
      dialogFormVisible:false,
      tableData:[],
      total:0,
      pid:null,
      form:{},
      params: {
        pageNum:1,
        pageSize:10,
        name: '',
      },
      rules: {
        name: [
          {required: true, message: '请输入类别名称', trigger: 'blur'},
          {min: 2, max: 20, message: '长度在2-20个字符', trigger: 'blur'}
        ],
        remark: [
          {required: true, message: '请输入备注', trigger: 'blur'},
          {min: 2, max: 20, message: '长度在2-20个字符', trigger: 'blur'}
        ]
      }
    }
  },
  created() {
    this.load();
  },
  methods:{
    handleAdd(row){
      this.pid=row.id
      this.dialogFormVisible = true
    },
    save(){
      this.$refs['formRef'].validate((valid) =>{
        if(valid){
          this.form.pid=this.pid
          request.post( '/category/save',this.form).then(res => {
            if(res.code === '200'){
              this.$notify.success('新增二级分类成功！')
              this.$refs['formRef'].resetFields()
              this.dialogFormVisible = false
              this.load()
            }else{
              this.$notify.error(res.data)
            }
          })
        }
      })
    },
    load(){
      request.get('/category/page',{
        params: this.params
      }).then(res => {
        if(res.code === '200'){
          this.tableData= res.data.list
          this.total=res.data.total
        }
        else{
          this.$notify.error(res.data)
        }
      })
    },
    reset(){
      this.params ={
        pageNum: 1,
        pageSize: 10,
        name:'',
      }
      this.load()
    },
    handleCurrentChange(pageNum){
      this.params.pageNum=pageNum
      this.load()
    },
    del(id){
      request.delete("/category/delete/"+id).then(res => {
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

</style>