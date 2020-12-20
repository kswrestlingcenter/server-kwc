<template>
  <div id="home">
    <h1>HOME PAGE</h1>
    <form @submit.prevent="login">
      <label for="email">
        Email:
      </label>
      <input v-model="email" type="email" name="email" value>

      <label for="password">
        Password:
      </label>
      <input v-model="password" type="password" name="password" value>

      <button type="submit" name="button">
        Login
      </button>

      <p>{{ error }}</p>

    </form>
  </div>
</template>

<script>
export default {
  data () {
    return {
      error: null
    }
  },
   methods: {
    login () {
      console.log(`Logging in as ${this.email}`)
    }
   }
}
</script>

<style>

</style>