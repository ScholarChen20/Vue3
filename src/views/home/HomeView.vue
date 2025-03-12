<template>
  <div>
    <el-calendar v-model="value"></el-calendar>
  </div>
</template>

<script>
// @ is an alias to /src
import request from "@/utils/request";
export default {
  name: 'HomeView',
  data(){
    return {
      value: new Date(),
    }
  }
}
</script>
