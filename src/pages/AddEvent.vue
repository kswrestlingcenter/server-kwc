<template>
  <v-container>
    <v-row>
      <v-col>
        <h1>Add Event {{currentEvent.eventName}}</h1>
        <v-form ref="addEventForm" v-model="formValidity">
          <v-text-field
            label="Name of Event"
            v-model="eventName"
            required
          ></v-text-field>
          <v-text-field
            label="Contact Person"
            type="contact"
            v-model="eventContact"
            required
          ></v-text-field>
          <v-text-field
            label="Contact Person Email"
            type="email"
            v-model="email"
            :rules="emailRules"
            required
          ></v-text-field>
          <v-autocomplete
            label="Type of event?"
            :items="eventType"
          ></v-autocomplete>
          <v-text-field
            v-model="startDate"
            label="Start Date"
            readonly
          ></v-text-field>
          <v-text-field
            v-model="endDate"
            label="End Date"
            readonly
          ></v-text-field>
          <v-date-picker v-model="eventDates" range></v-date-picker>
          <v-text-field
            label="Event Description"
            type="description"
            v-model="eventDescription"
            required
          ></v-text-field>
          <v-text-field
            label="Entry Fee"
            type="entryFee"
            v-model="entryFee"
          ></v-text-field>
          <v-file-input label="Add Logo" @change="uploadLogo" ></v-file-input>
          <!-- <v-file-input label="Attach tournament Flyer" @change="uploadFlyer"></v-file-input> -->
          <v-checkbox
            label="Agree to terms & conditions"
            v-model="agreeToTerms"
            :rules="agreeToTermsRules"
            required
          ></v-checkbox>
          <v-btn
            type="button"
            color="primary"
            class="mr-4"
            :disabled="!formValidity"
            @click="publish()"
            >Publish</v-btn
          >
          <v-btn
            type="button"
            color="primary"
            class="mr-4"
            :disabled="!formValidity"
            @click="saveNotPublish()"
            >Save For Later</v-btn
          >
          <v-btn color="success" class="mr-4" @click="validateForm"
            >Validate Form</v-btn
          >
          <v-btn color="warning" class="mr-4" @click="resetValidation"
            >Reset Validation</v-btn
          >
          <v-btn color="error" @click="resetForm">Reset</v-btn>
        </v-form>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import axios from 'axios'

export default {
  created() {
    this.getNewEvent()
  },
  computed: {
    ...mapGetters(['currentEvent']),
    startDate() {
      return this.eventDates[0] ? this.eventDates[0] : 'Select Date'
    },
    endDate() {
      return this.eventDates[1] ? this.eventDates[1] : this.startDate
    }
  },
  data: () => ({
    agreeToTerms: false,
    agreeToTermsRules: [
      value =>
        !!value ||
        'You must agree to the terms and conditions to sign up for an account.'
    ],
    eventDates: [],
    eventName: "",
    eventDescription: "",
    entryFee: "",
    eventContact: "",
    eventType: ['Dual Tournament', 'Open Tournament', 'Private Event', 'Other'],
    email: '',
    emailRules: [
      value => !!value || 'Email is required.',
      value => value.indexOf('@') !== 0 || 'Email should have a username.',
      value => value.includes('@') || 'Email should include an @ symbol.',
      value =>
        value.indexOf('.') - value.indexOf('@') > 1 ||
        'Email should contain a valid domain.',
      value => value.includes('.') || 'Email should include a period symbol.',
      value =>
        value.indexOf('.') <= value.length - 3 ||
        'Email should contain a valid domain extension.'
    ],
    formValidity: false,
    eventData: {},
    eventLogo: null,
    eventFlyer: null
  }),
  methods: {
    ...mapActions(['getNewEvent', 'publish', 'saveNotPublish']),
    resetForm() {
      this.$refs.addEventForm.reset()
    },
    resetValidation() {
      this.$refs.addEventForm.resetValidation()
    },
    validateForm() {
      this.$refs.addEventForm.validate()
    },
    buildEventObject() {
      let event = JSON.parse(JSON.stringify(this.currentEvent))
      return event
    },
    publish() {
      let event = this.buildEventObject()
      event.status = 'published'
      console.log("this.eventName: ", this.eventName)
      const fd = new FormData()
      fd.append('event', event)
      if (this.eventLogo) fd.append('eventLogo', this.eventLogo, `${this.currentEvent._id}-event-logo.png`)
      if (this.eventFlyer) fd.append('eventFlyer', this.eventFlyer, `${this.currentEvent._id}-event-flyer.pdf`)
      axios.post('api/events', event)
        .then((res) => {
          console.log("axios.then",res)
        })
        .catch(err => {
          console.error(err)
        })
    },
    saveNotPublish() {
      console.log("SAVENOTPUBLISHING")
    },
    uploadLogo(logo) {
      console.log("Logo: ", logo)
      this.eventLogo = logo
    },
    uploadFlyer(file) {
      console.log("Logo: ", file)
      this.eventFlyer = file
    }
  }
}
</script>
