import Vue from 'vue'
import Vuetify from 'vuetify/lib'

Vue.use(Vuetify)

export default new Vuetify({
  icons: {
    iconfont: 'mdi'
  },
  theme: {
    dark: true,
    themes: {
      light: {
        primary: '#41B883'
      },
      dark: {
        primary: '#34495E'
      }
    }
  }
})
