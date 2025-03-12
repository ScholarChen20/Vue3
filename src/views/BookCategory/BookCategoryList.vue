<template>
  <div class="book-category-list">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>图书类别列表</span>
        <el-button style="float: right; padding: 3px 0" type="text" @click="handleAdd">添加类别</el-button>
      </div>
      <el-table :data="categoryList" border style="width: 100%">
        <el-table-column prop="id" label="编号" width="80"></el-table-column>
        <el-table-column prop="name" label="类别名称" width="180"></el-table-column>
        <el-table-column prop="remark" label="备注"></el-table-column>
        <el-table-column prop="createTime" label="创建时间" width="180"></el-table-column>
        <el-table-column prop="updateTime" label="更新时间" width="180"></el-table-column>
        <el-table-column label="操作" width="150">
          <template slot-scope="scope">
            <el-button size="mini" @click="handleEdit(scope.row)">编辑</el-button>
            <el-button size="mini" type="danger" @click="handleDelete(scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script>
import { getCategoryList, deleteCategory } from '@/api/bookCategory'

export default {
  name: 'BookCategoryList',
  data() {
    return {
      categoryList: []
    }
  },
  created() {
    this.fetchData()
  },
  methods: {
    async fetchData() {
      try {
        const response = await getCategoryList()
        this.categoryList = response.data
      } catch (error) {
        this.$message.error('获取类别列表失败')
      }
    },
    handleAdd() {
      this.$router.push('/book-category/add')
    },
    handleEdit(row) {
      this.$router.push(`/book-category/edit/${row.id}`)
    },
    async handleDelete(row) {
      try {
        await this.$confirm('确认删除该类别?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        })
        await deleteCategory(row.id)
        this.$message.success('删除成功')
        this.fetchData()
      } catch (error) {
        if (error !== 'cancel') {
          this.$message.error('删除失败')
        }
      }
    }
  }
}
</script>

<style scoped>
.book-category-list {
  padding: 20px;
}
</style> 