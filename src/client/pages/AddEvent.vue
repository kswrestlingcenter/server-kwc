<template>
  <div>
    <h1>Add Event</h1>
    eventName: <input type="text" v-model="eventName">
    <button @click="addEvent">Add Event</button>
  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    data () {
      return {
        eventName: ''
      }
    },
    methods: {
      async addEvent() {
        await axios.post('api/events/newEvent',{eventName: this.eventName})
          .then((response) => {
            console.log("Got Response: ", response)
          })
          .catch((error) => {
            console.log("async error: ", error)
          })
      }
    }
  }
</script>
