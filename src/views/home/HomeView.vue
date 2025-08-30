<template>
  <div>
    <div style="margin: 5px 0">
      <el-select class="input" v-model="timeRange" placeholder="请选择" @change="load">
        <el-option
          v-for="item in options"
          :key="item.value"
          :label="item.label"
          :value="item.value">
        </el-option>
      </el-select>
    </div>

    <!-- 原有折线图 - 调整为占据整个宽度 -->
    <el-card style="width: 100%;">
      <div id="line" style="width: 100%; height:390px"></div>
    </el-card>

    <!-- 新增两个图表区域 - 调整为占据更多空间 -->
    <div style="display: flex; margin-top: 5px;">
      <!-- 左侧：图书热借top10柱形图 - 拉宽 -->
      <el-card style="width: 60%; margin-right: 5px;">
        <div id="bookTop10" style="width: 100%; height: 330px"></div>
      </el-card>

      <!-- 右侧：借阅用户top10饼图 - 拉宽 -->
      <el-card style="width: 40%; margin-left: 5px;">
        <div id="userTop10" style="width: 100%; height: 340px"></div>
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

// 图书热借top10柱形图配置 - 修复横坐标问题
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
    left: '5%',
    right: '5%',
    bottom: '10%',
    containLabel: true
  },
  xAxis: {
    type: 'category',
    data: [],
    axisTick: {
      alignWithLabel: true
    },
    axisLabel: {
      rotate: 45, // 旋转标签避免重叠
      interval: 0 // 显示所有标签
    }
  },
  yAxis: {
    type: 'value'
  },
  series: [{
    name: '借阅次数',
    type: 'bar',
    barWidth: '60%',
    // 设置不同颜色的数组
    itemStyle: {
      color: function(params) {
        // 根据索引设置不同颜色
        const colors = ['#3398DB', '#F46C2A', '#5AB1EF', '#FFB980', '#749F83',
          '#9FEA8D', '#E6B1B1', '#FAD866', '#8B78F6', '#F5994E'];
        return colors[params.dataIndex % colors.length];
      }
    },
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

        // 确保数据长度一致
        if (nameList.length > 0 && numberList.length > 0) {
          bookTop10Option.xAxis.data = nameList
          bookTop10Option.series[0].data = numberList
          this.bookTop10Box.setOption(bookTop10Option)
        }
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
