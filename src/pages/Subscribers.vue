<template>
  <div>
    <h1>Subscribers page</h1>
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
            <th class="text-left">
              subscribed
            </th>
            <th class="text-left">
              created
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
            <td>{{ user.mailingList }}</td>
            <td>{{ new Date(user.created).toDateString() }}</td>
          </tr>
        </tbody>
      </template>
    </v-simple-table>
  </div>

</template>

<script>
import axios from 'axios'
export default {
  name: "subscribers",
  async created() {
    const { data } = await axios.get('api/mailingList')
    const { data: contact } = await axios.get('api/contactForm')
    console.log("marketingSubscribers:", JSON.stringify(data.subscribers, null, 2))
    this.marketingSubscribers = data.subscribers
    console.log("contactFORMresp:", contact.contactResponses)
    this.contactFormResponses = contact.contactResponses
  },
  data() {
    return {
      marketingSubscribers: [ // Mock Data
        {id: 1, name: "ERROR: Data did not load from DB", email: "mockData@email.com", mailingList: true, created: new Date()}
      ],
      contactFormResponses: [ // Mock Data
        {id: 1, firstName: "ERROR: Data did not load from DB", email: "mockData@email.com", created: new Date()}
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

<style>

</style>