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
            :key="event.id"
          >
            <td>{{ event.name }}</td>
            <td>{{ event.date }}</td>
            <td>{{ event.eventFlyer }}</td>
          </tr>
        </tbody>
      </template>
    </v-simple-table>
    <br>
  </v-container>
</template>

<script>

export default {
  name: 'EventsPage',
  data() {
    return {
      events: [ // Mock Data
        {id: 1, name: "Name test 1", date: "today", eventFlyer: "http://eventURL.pdf"},
        {id: 2, name: "Name 2 test", date: "tomorrow", eventFlyer: "http://eventURL.pdf"},
        {id: 3, name: "3 name test", date: "Feb. 24th 2021", eventFlyer: "http://eventURL.pdf"},
      ]
    }
  }
}
</script>
