import Vue from 'vue'
import Router from 'vue-router'
import Dashboard from './pages/Dashboard.vue'
import Login from './pages/Login.vue'

Vue.use(Router)

const router = new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'login',
      component: Login
    },
    {
      path: '/dashboard',
      name: 'dashboard',
      component: Dashboard
    }
  ]
})

export default router
