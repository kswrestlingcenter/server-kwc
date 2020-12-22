import Vue from 'vue'
import Router from 'vue-router'
import Dashboard from './pages/Dashboard.vue'
import Login from './pages/Login.vue'
import AddEvent from './pages/AddEvent.vue'

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
      component: Dashboard,
      meta: { requiresAuth: true }
    },
    {
      path: '/addEvent',
      name: 'addEvent',
      component: AddEvent,
      meta: { requiresAuth: true }
    }
  ]
})

router.beforeEach((to, from, next) => {
  const loggedIn = localStorage.getItem('user')
  console.log({loggedIn}, localStorage.getItem('user'), to)
  if (to.matched.some(record => record.meta.requiresAuth) && !loggedIn) {
    console.log("\n\n\n\nHERE\n\n\n")
    next('/')
  }
  next()
})

export default router
