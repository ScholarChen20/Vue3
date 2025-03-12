<template>
  <div class="book-category-add">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>添加图书类别</span>
      </div>
      <el-form :model="form" :rules="rules" ref="form" label-width="100px">
        <el-form-item label="类别名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入类别名称"></el-input>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input type="textarea" v-model="form.remark" placeholder="请输入备注"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm">确定</el-button>
          <el-button @click="resetForm">重置</el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script>
import { addCategory } from '@/api/bookCategory'

export default {
  name: 'BookCategoryAdd',
  data() {
    return {
      form: {
        name: '',
        remark: ''
      },
      rules: {
        name: [
          { required: true, message: '请输入类别名称', trigger: 'blur' },
          { min: 2, max: 50, message: '长度在 2 到 50 个字符', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    submitForm() {
      this.$refs.form.validate(async (valid) => {
        if (valid) {
          try {
            await addCategory(this.form)
            this.$message.success('添加成功')
            this.$router.push('/book-category/list')
          } catch (error) {
            this.$message.error('添加失败')
          }
        }
      })
    },
    resetForm() {
      this.$refs.form.resetFields()
    }
  }
}
</script>

<style scoped>
.book-category-add {
  padding: 20px;
}
.el-form {
  width: 500px;
}
</style> 