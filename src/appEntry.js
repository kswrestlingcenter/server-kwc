import axios from 'axios'
import Vue from 'vue'

import App from './App.vue'
import vuetify from './vuetify'
import router from './router'
import store from './store/vuex'

Vue.config.productionTip = false

new Vue({
	vuetify,
	router,
	store,
	created () {
    const userString = localStorage.getItem('user')
    if (userString) {
      const userData = JSON.parse(userString)
      this.$store.commit('SET_USER_DATA', userData)
    }
    axios.interceptors.response.use(
      response => response,
      error => {
        if (error.response.status === 401) {
          this.$store.dispatch('logout')
        }
        return Promise.reject(error)
      }
    )
  },
	render: h => h(App)
}).$mount('#app')
