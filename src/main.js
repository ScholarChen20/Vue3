import Vue from 'vue'
import App from './App.vue'
import router from './router'

import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

import SlideVerify from 'vue-monoplasty-slide-verify';
Vue.use(SlideVerify);

import '@/assets/global.css'
Vue.config.productionTip = false
Vue.use(ElementUI,{size: '', zIndex: 3000  } );
new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
