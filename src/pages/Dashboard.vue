<template>
  <v-container>
    <h1>Dashboard</h1>
    <hr>
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
      ]
    }
  }
}
</script>
