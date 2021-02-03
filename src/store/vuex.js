import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    user: null,
    event: {}
  },
  mutations: {
    SET_USER_DATA (state, userData) {
      state.user = userData
      localStorage.setItem('user', JSON.stringify(userData))
      axios.defaults.headers.common['Authorization'] = `Bearer ${
        userData.token
      }`
    },
    CLEAR_USER_DATA () {
      localStorage.removeItem('user')
      location.reload()
    },
    SET_EVENT (state, event) {
      console.log("SET_EVENT: ", event)
      state.event = event
    }
  },
  actions: {
    register ({ commit }, credentials) {
      return axios
        .post('api/register', credentials)
        .then(({ data }) => {
          commit('SET_USER_DATA', data)
        })
    },
    login ({ commit }, credentials) {
      return axios
        .post('api/login', credentials)
        .then(({ data }) => {
          commit('SET_USER_DATA', data)
        })
    },
    logout ({ commit }) {
      commit('CLEAR_USER_DATA')
    },
    getNewEvent({commit}) {
      return axios
        .get('api/newEvent')
        .then(({ data }) => {
          console.log("Data: ", data)
          commit('SET_EVENT', data)
        })
    }
  },
  getters: {
    loggedIn (state) {
      return !!state.user
    },
    userState (state) {
      return state.user
    },
    currentEvent (state) {
      return state.event
    }

  }
})
