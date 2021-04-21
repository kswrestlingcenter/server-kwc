<template>
  <v-app-bar app color="primary" dark>
    <v-btn v-if="loggedIn" :to="'/dashboard'">
      <v-toolbar-title>KS Wrestling Center</v-toolbar-title>
    </v-btn>

    <v-btn v-else :to="'/'">
      <v-toolbar-title>KS Wrestling Center</v-toolbar-title>
    </v-btn>

    <v-spacer></v-spacer>
    <v-btn v-if="!loggedIn" :to="'addEvent'" text rounded>
      You are not logged In
    </v-btn>

    <v-btn v-if="loggedIn" :to="'events'" rounded>
      + View Events
    </v-btn>
    <v-btn v-if="loggedIn" :to="'subscribers'" rounded>
      + Subscribers
    </v-btn>
    <v-btn v-if="loggedIn" :to="'messages'" rounded>
      + View Messages
    </v-btn>

    <v-spacer v-if="loggedIn"></v-spacer>

    <span v-if="loggedIn">
      {{userState.email + "&nbsp;"}}
    </span>
    <v-btn v-if="loggedIn" @click="logout" rounded>
      Logout
    </v-btn>

    <!-- <v-btn
      v-for="link in links"
      :key="`${link.label}-header-link`"
      text
      rounded
      :to="link.url"
    >
      {{ link.label }}
    </v-btn> -->

  </v-app-bar>
</template>

<script>

import { mapGetters, mapActions }  from 'vuex'
export default {
  name: 'NavigationBar',
  computed: mapGetters(['loggedIn', 'userState']),
  methods: mapActions(['logout'])
}
</script>
