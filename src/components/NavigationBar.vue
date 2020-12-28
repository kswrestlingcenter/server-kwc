<template>
  <v-app-bar app color="primary" dark>
    <v-toolbar-title>KS Wrestling Center</v-toolbar-title>
    <v-spacer></v-spacer>
    <v-btn
      v-for="link in links"
      :key="`${link.label}-header-link`"
      text
      rounded
      :to="link.url"
    >
      {{ link.label }}
    </v-btn>
    <!-- <v-btn @click="toggleTheme" text rounded>
      Toggle Theme
    </v-btn> -->
  </v-app-bar>
</template>

<script>
export default {
  name: 'NavigationBar',
  data() {
    return {
      links: [
        {
          label: 'Home',
          url: '/dashboard',
        },
        {
          label: 'Add Event',
          url: '/addEvent',
          showOnAuth: false
        },
        {
          label: 'Login',
          url: '/login',
          showOnAuth: false
        }
      ]
    }
  },
}
</script>
