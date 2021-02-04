<template>
  <v-container>
    <h1>Dashboard</h1>
    <hr>
    <br>
    <h2>Upcoming Events</h2>
    <v-simple-table>
      <template v-slot:default>
        <thead>
          <tr>
            <th class="text-left">
              Name
            </th>
            <th class="text-left">
              Date
            </th>
            <th class="text-centered">
              Event Flyer
            </th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="event in events"
            :key="event._id"
          >
            <td>{{ event.eventName }}</td>
            <td>{{ event.status}}</td>
            <td>{{ event._id}}</td>
          </tr>
        </tbody>
      </template>
    </v-simple-table>
    <br>
  </v-container>
</template>

<script>
import axios from 'axios'

export default {
  name: 'EventsPage',
  async created() {
    let response = await axios.get('api/events')
    console.log("events:", JSON.stringify(response.data, null, 2))
    this.events = response.data
  },
  data() {
    return {
      events: [ // Mock Data
        {_id: 1, eventName: "Name test 1", status: "saved", eventFlyer: "http://eventURL.pdf"},
        {_id: 2, eventName: "Name 2 test", status: "published", eventFlyer: "http://eventURL.pdf"},
        {_id: 3, eventName: "3 name test", status: "published", eventFlyer: "http://eventURL.pdf"},
      ]
    }
  }
}
</script>
