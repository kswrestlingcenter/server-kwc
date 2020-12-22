<template>
  <div id="nav" class="navbar">
    <router-link to="/">
      Home
    </router-link>
    <router-link v-if="loggedIn" to="/dashboard">
      Dashboard
    </router-link>
    <router-link v-if="loggedIn" to="/addEvent">
      Add Event
    </router-link>

    <router-link v-if="!loggedIn" to="/" class="button">
      Login
    </router-link>
    <button v-else type="button" class="logoutButton" @click="logout">
      Logout
    </button>
  </div>
</template>

<script>
import { authComputed } from '../store/index.js'
export default {
  computed: {
    ...authComputed
  },
  methods: {
    logout () {
      this.$store.dispatch('logout')
    }
  }
}
</script>

