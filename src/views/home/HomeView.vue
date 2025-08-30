<template>
  <div>
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

    <!-- 原有折线图 -->
    <el-card>
      <div id="line" style="width: 100%; height: 400px"></div>
    </el-card>

    <!-- 新增两个图表区域 -->
    <div style="display: flex; margin-top: 20px;">
      <!-- 左侧：图书热借top10柱形图 -->
      <el-card style="width: 50%; margin-right: 10px;">
        <div id="bookTop10" style="width: 100%; height: 400px"></div>
      </el-card>

      <!-- 右侧：借阅用户top10饼图 -->
      <el-card style="width: 50%; margin-left: 10px;">
        <div id="userTop10" style="width: 100%; height: 400px"></div>
      </el-card>
    </div>
  </div>
</template>

<script>
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
    data: []
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
      data: []
    },
    {
      name: '还书数量',
      type: 'line',
      stack: 'Total',
      smooth: true,
      data: []
    }
  ]
};

// 图书热借top10柱形图配置
const bookTop10Option = {
  title: {
    text: '图书热借Top10',
    left: 'center'
  },
  tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'shadow'
    }
  },
  grid: {
    left: '3%',
    right: '4%',
    bottom: '3%',
    containLabel: true
  },
  xAxis: {
    type: 'category',
    data: [],
    axisTick: {
      alignWithLabel: true
    }
  },
  yAxis: {
    type: 'value'
  },
  series: [{
    name: '借阅次数',
    type: 'bar',
    barWidth: '60%',
    data: []
  }]
};

// 借阅用户top10饼图配置
const userTop10Option = {
  title: {
    text: '借阅用户Top10',
    left: 'center'
  },
  tooltip: {
    trigger: 'item'
  },
  legend: {
    orient: 'vertical',
    left: 'left'
  },
  series: [{
    name: '借阅次数',
    type: 'pie',
    radius: ['40%', '70%'],
    avoidLabelOverlap: false,
    itemStyle: {
      borderRadius: 10,
      borderColor: '#fff',
      borderWidth: 2
    },
    label: {
      show: false,
      position: 'center'
    },
    emphasis: {
      label: {
        show: true,
        fontSize: '18',
        fontWeight: 'bold'
      }
    },
    labelLine: {
      show: false
    },
    data: []
  }]
};

export default {
  name: 'HomeView',
  data() {
    return {
      admin: Cookies.get('admin') ? JSON.parse(Cookies.get('admin')) : {},
      lineBox: null,
      bookTop10Box: null,
      userTop10Box: null,
      timeRange: 'week',
      options: [
        { label: '最近一周', value: 'week' },
        { label: '最近一个月', value: 'month' },
        { label: '最近二个月', value: 'month2' },
        { label: '最近三个月', value: 'month3' },
      ]
    }
  },
  mounted() {
    this.load()
  },
  methods: {
    load() {
      // 初始化图表容器
      if (!this.lineBox) {
        this.lineBox = echarts.init(document.getElementById('line'));
      }

      if (!this.bookTop10Box) {
        this.bookTop10Box = echarts.init(document.getElementById('bookTop10'));
      }

      if (!this.userTop10Box) {
        this.userTop10Box = echarts.init(document.getElementById('userTop10'));
      }

      // 加载原有折线图数据
      request.get('/borrow/lineCharts/' + this.timeRange).then(res => {
        option.xAxis.data = res.data.date
        option.series[0].data = res.data.borrow
        option.series[1].data = res.data.retur
        this.lineBox.setOption(option)
      })

      // 加载图书热借top10数据
      request.get('/report/top10').then(res => {
        const nameList = res.data.nameList ? res.data.nameList.split(',') : []
        const numberList = res.data.numberList ? res.data.numberList.split(',').map(Number) : []

        bookTop10Option.xAxis.data = nameList
        bookTop10Option.series[0].data = numberList
        this.bookTop10Box.setOption(bookTop10Option)
      })

      // 加载借阅用户top10数据
      request.get('/report/users').then(res => {
        const nameList = res.data.nameList ? res.data.nameList.split(',') : []
        const numberList = res.data.numberList ? res.data.numberList.split(',').map(Number) : []

        // 构造饼图数据
        const pieData = nameList.map((name, index) => ({
          name: name,
          value: numberList[index] || 0
        }))

        userTop10Option.series[0].data = pieData
        this.userTop10Box.setOption(userTop10Option)
      })
    }
  }
}
</script>
