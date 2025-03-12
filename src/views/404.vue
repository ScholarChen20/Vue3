<script>
export default {
  name: "404",
  data(){
    return{
      src:'https://img-blog.csdnimg.cn/20210715110910517.png'
    }
  }
}
</script>

<template>
  <div style="text-align: center">
    <div style="margin-top: 150px;font-size: 100px">404</div>
    <div style="font-size: 50px">未找到页面</div>
    <div><el-button type="text" style="margin-top: 20px;font-size: 20px" @click="$router.push('/')">返回主页</el-button></div>
  </div>
</template>

<style scoped>

</style>