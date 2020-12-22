<template>
  <div id="app">
    <nav-bar/>
    <router-view class="main"/>
  </div>
</template>

<script>
import axios from 'axios'
import NavBar from './navbar/NavBar.vue'

import { authComputed } from './store'


export default {
  name: 'app',
  components: {
    'nav-bar': NavBar,
  },
  computed: {
    ...authComputed
  },
  created() {
    console.log("loggedIn: ", this.loggedIn)
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
        console.log({error})
        return Promise.reject(error)
      }
    )
    console.log("loggedIn: ", this.loggedIn)
  }
}
</script>

<style>
@import './../../public/css/app.css';
</style>