<template>
  <div>
    <h1>Dashboard</h1>
    {{events}}
    <template v-if="!isLoading">
      Events Loaded haha
    </template>
    <p v-else>
      Loading events
    </p>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data () {
    return {
      isLoading: true,
      events: []
    }
  },
  created () {
    console.log("About to get events in the created lifecycle hook")
    axios.get('api/events').then(({ data }) => {
      console.log(data)
      this.events = data
      this.isLoading = false
    })
  }
}
</script>
