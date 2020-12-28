import Vue from 'vue'
import Router from 'vue-router'
import Login from './pages/Login.vue'

Vue.use(Router)

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Login
    },
    {
      path: '/about',
      name: 'about',
      // route level code-splitting
      // this generates a separate chunk (about.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import(/* webpackChunkName: "about" */ './pages/About.vue'),
      meta: { requiresAuth: true }
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('./pages/Login.vue')
    },
    {
      path: '/dashboard',
      name: 'dashboard',
      component: () => import('./pages/Dashboard.vue'),
      meta: { requiresAuth: true }
    },
    {
      path: '/addEvent',
      name: 'addEvent',
      component: () => import('./pages/AddEvent.vue')
    }
  ]
})

router.beforeEach((to, from, next) => {
  const loggedIn = localStorage.getItem('user')

  if (to.matched.some(record => record.meta.requiresAuth) && !loggedIn) {
    next('/')
  }
  next()
})

export default router
