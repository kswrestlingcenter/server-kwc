<template>
  <v-container>
    <h1>Dashboard</h1>
    <hr>
    <br>
    <!-- <h2>Upcoming Events</h2> -->
    <v-btn :to="'events'">
      Upcoming Events
    </v-btn>
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
    <h2>Marketing Subsribers: </h2>
    <v-simple-table>
      <template v-slot:default>
        <thead>
          <tr>
            <th class="text-left">
              Name
            </th>
            <th class="text-left">
              Email
            </th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="user in marketingSubscribers"
            :key="user.id"
          >
            <td>{{ user.name }}</td>
            <td>{{ user.email }}</td>
          </tr>
        </tbody>
      </template>
    </v-simple-table>
  </v-container>
</template>

<script>

export default {
  name: 'DashboardPage',
  data() {
    return {
      marketingSubscribers: [ // Mock Data
        {id: 1, name: "Name test 1", email: "test1@email1.com"},
        {id: 2, name: "Name 2 test", email: "test2@email2.com"},
        {id: 3, name: "3 name test", email: "test3@email3.com"},
      ],
      events: [ // Mock Data
        {id: 1, name: "Event 1", date: "today", eventFlyer: "http://eventURL.pdf"},
        {id: 2, name: "JOCO test", date: "tomorrow", eventFlyer: "http://eventURL.pdf"},
        {id: 3, name: "Championship", date: "Feb. 24th 2021", eventFlyer: "http://eventURL.pdf"},
      ]
    }
  }
}
</script>
