import Vue from 'vue'
import VueRouter from 'vue-router'
import Layout from '../views/Layout.vue'
import Cookies from "js-cookie";

Vue.use(VueRouter)
const originalPush = VueRouter.prototype.push
//修改原型对象中的push方法
VueRouter.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
}
const routes = [
  //=====   登录  =====
  {
    path: '/login',
    name: 'Login',
    component: ()=>import('/src/views/login/Login.vue')
  },
  {
    path: '/sign',
    name: 'Sign',
    component: ()=>import('/src/views/login/Sign.vue')
  },
  //=====   主页  =====
  {
    path: '/',
    name: 'Layout',
    component: Layout,
    redirect:'/home',
    children:[                    //子路由
      {
        path: 'home',
        name: 'Home',
        component: ()=>import('/src/views/home/HomeView.vue')},
      //=====   user  =====
      { path: 'userList', name: 'UserList', component: () => import(/* webpackChunkName: "about" */ '../views/user/User.vue')},
      { path: 'addUser', name: 'AddUser', component: () => import(/* webpackChunkName: "about" */ '../views/user/AddUser.vue')},
      { path: 'editUser', name: 'EditUser', component: () => import(/* webpackChunkName: "about" */ '../views/user/EditUser.vue')},
      //=====  admin  =====
      { path: 'adminList', name: 'AdminList', component: () => import(/* webpackChunkName: "about" */ '../views/admin/List.vue')},
      { path: 'addAdmin', name: 'AddAdmin', component: () => import(/* webpackChunkName: "about" */ '../views/admin/Add.vue')},
      { path: 'editAdmin', name: 'EditAdmin', component: () => import(/* webpackChunkName: "about" */ '../views/admin/Edit.vue')},
      //=====  category  =====
      { path: 'categoryList', name: 'CategoryList', component: () => import(/* webpackChunkName: "about" */ '../views/category/List.vue')},
      { path: 'addCategory', name: 'AddCategory', component: () => import(/* webpackChunkName: "about" */ '../views/category/Add.vue')},
      { path: 'editCategory', name: 'EditCategory', component: () => import(/* webpackChunkName: "about" */ '../views/category/Edit.vue')},
      //=====  book  =====
      { path: 'bookList', name: 'BookList', component: () => import(/* webpackChunkName: "about" */ '../views/book/List.vue')},
      { path: 'addBook', name: 'AddBook', component: () => import(/* webpackChunkName: "about" */ '../views/book/Add.vue')},
      { path: 'editBook', name: 'EditBook', component: () => import(/* webpackChunkName: "about" */ '../views/book/Edit.vue')},
      //=====  borrow  =====
      { path: 'borrowList', name: 'BorrowList', component: () => import(/* webpackChunkName: "about" */ '../views/borrow/List.vue')},
      { path: 'addBorrow', name: 'AddBorrow', component: () => import(/* webpackChunkName: "about" */ '../views/borrow/Add.vue')},
      { path: 'editBorrow', name: 'EditBorrow', component: () => import(/* webpackChunkName: "about" */ '../views/borrow/Edit.vue')},
      //=====  borrow  =====
      { path: 'returnList', name: 'ReturnList', component: () => import(/* webpackChunkName: "about" */ '../views/return_/List.vue')}


    ]
  },
  {
    path: '*',
    component: ()=>import('@/views/404.vue')
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

// router.beforeEach((to, from, next) => {
//   if(to.path === '/login' || to.path === '/sign') next()
//   const admin=Cookies.get("admin")
//   if(!admin && to.path !== '/login') return next("/login")
//   next()
// })
router.beforeEach((to, from, next) => {
  console.log(`导航守卫触发: ${from.path} -> ${to.path}`)

  // 开放路径白名单
  const publicPaths = ['/login', '/sign']
  if (publicPaths.includes(to.path)) {
    console.log('访问开放路径，直接放行')
    return next()
  }

  // 检查认证状态
  const admin = Cookies.get("admin")
  if (!admin) {
    console.log('未认证用户，重定向到登录页')
    return next("/login")
  }

  // 已认证用户放行
  console.log('已认证用户，允许访问')
  next()
})
export default router
