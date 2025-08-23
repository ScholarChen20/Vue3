<script>
export default {
  name: "Inform"
}
</script>

<template>
  <div class="inform-container">
    <!-- 顶部提示栏 -->
    <div class="top-banner">
      📢 图书馆公告栏,记得查收公告呀!小项目请勿恶意攻击,谢谢 📢
    </div>

    <!-- 标题 -->
    <h2 class="title">近期公告</h2>

    <!-- 公告列表 -->
    <div class="announcements">
      <!-- 公告1 -->
      <div class="announcement-item">
        <div class="announcement-header" style="background-color: #ffe6e6;">
          本项目源代码地址,欢迎star! 2023-02-05 16:11:40
        </div>
        <div class="announcement-content">
          <a href="https://github.com/ScholarChen20/Vue3" target="_blank">
            https://github.com/ScholarChen20/Vue3
          </a>
        </div>
      </div>

      <!-- 公告2 -->
      <div class="announcement-item">
        <div class="announcement-header" style="background-color: #d8f3e9;">
          注意事项 2025-08-22 16:13:31
        </div>
        <div class="announcement-content">
          发现项目BUG,可以提出issue，大佬请别恶意攻击，小项目承受不起，谢谢
        </div>
      </div>

      <!-- 公告3 -->
      <div class="announcement-item">
        <div class="announcement-header" style="background-color: #d8f3e9;">
          祝福 2025-08-22 16:13:31
        </div>
        <div class="announcement-content">
          祝大家天天开心！
        </div>
      </div>
    </div>
  </div>
</template>


<style scoped>.inform-container {
  padding: 20px;
  font-family: 'Arial', sans-serif;
}

.top-banner {
  background-color: #347ec2;
  color: white;
  padding: 10px 20px;
  border-radius: 8px;
  margin-bottom: 30px;
  text-align: center;
  font-size: 16px;
}

.title {
  text-align: center;
  font-size: 24px;
  margin-bottom: 20px;
  color: #333;
}

.announcements {
  background-color: #f5f5f5;
  border-radius: 8px;
  padding: 15px;
}

.announcement-item {
  margin-bottom: 20px;
  border: 1px solid #ddd;
  border-radius: 6px;
  overflow: hidden;
}

.announcement-header {
  padding: 10px 15px;
  text-align: center;
  font-weight: bold;
  color: #666;
  font-size: 14px;
}

.announcement-content {
  padding: 15px;
  text-align: center;
  color: #888;
  font-size: 14px;
  line-height: 1.6;
}

.announcement-content a {
  color: #347ec2;
  text-decoration: none;
}

.announcement-content a:hover {
  text-decoration: underline;
}
</style>