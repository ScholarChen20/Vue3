<template>
  <div>
<!--    <el-calendar v-model="value"></el-calendar>-->
<!--    从后台获取最近的数据-->
    <div style="margin: 20px 0">
      <el-select class="input" v-model="timeRange" placeholder="请选择" @change="load">
        <el-option
          v-for="item in options"
          :key="item.value"
          :label="item.label"
          :value="item.value">
        </el-option>
      </el-select>
    </div>
<!--    定义dom元素-->
    <el-card>
      <div id="line" style="width: 100%; height: 400px"></div>
    </el-card>
  </div>
</template>

<script>
// @ is an alias to /src
import request from "@/utils/request";
import * as echarts from 'echarts'
import Cookies from "js-cookie";

const option = {
  title: {
    text: '图书借还管理'
  },
  tooltip: {
    trigger: 'axis'
  },
  legend: {
    data: ['借书数量', '还书数量']
  },
  grid: {
    left: '3%',
    right: '4%',
    bottom: '3%',
    containLabel: true
  },
  toolbox: {
    feature: {
      saveAsImage: {}
    }
  },
  xAxis: {
    type: 'category',
    boundaryGap: false,
    data: [] // 从后台数据获取
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      name: '借书数量',
      type: 'line',
      stack: 'Total',
      smooth: true,
      data: []// 从后台数据获取
    },
    {
      name: '还书数量',
      type: 'line',
      stack: 'Total',
      smooth: true,
      data: []// 从后台数据获取
    }
  ]
};
export default {
  name: 'HomeView',
  data(){

    return {
      // value: new Date(),
      admin: Cookies.get('admin') ?JSON.parse(Cookies.get('admin')) : {},
      lineBox:null,
      timeRange:'week',  //请求查看你的时间范围
      options:[
        {label: '最近一周',value:'week'},
        {label: '最近一个月',value:'month'},
        {label: '最近二个月',value:'month2'},
        {label: '最近三个月',value:'month3'},
      ]
    }
  },
  mounted(){  // 等页面全部完成初始化
    this.load()
  },
  methods:{
    load(){
      if(!this.lineBox){
        this.lineBox = echarts.init(document.getElementById('line')); // 初始化echarts容器
      }
      // 从后台获取数据
      request.get('/borrow/lineCharts/'+this.timeRange).then(res=>{
        option.xAxis.data = res.data.date
        option.series[0].data = res.data.borrow
        option.series[1].data = res.data.retur
        this.lineBox.setOption(option) // 设置容器属性值，但你的数据发生变化时就一定要更新option

      })
    }
  }
}
</script>
