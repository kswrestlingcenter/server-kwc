<template>
  <v-container>
    <v-row>
      <v-col>
        <h1>Add Event</h1>
        <v-form ref="addEventForm" v-model="formValidity">
          <v-text-field
            label="Email of Contact Person"
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
            v-model="eventDates[0]"
            label="Start Date"
            readonly
          ></v-text-field>
          <v-text-field
            v-model="endDate"
            label="End Date"
            readonly
          ></v-text-field>
          <v-date-picker v-model="eventDates" range></v-date-picker>
          <v-file-input label="Add Logo"></v-file-input>
          <v-file-input label="Attach tournament Flyer"></v-file-input>
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
export default {
  computed: {
    endDate() {
      return this.eventDates[1] ? this.eventDates[1] : this.eventDates[0]
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
    eventType: ['Dual', 'Dual Tournament', 'Open Tournament', 'Invite Tournament', 'Round Robin'],
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
    formValidity: false
  }),
  methods: {
    resetForm() {
      this.$refs.addEventForm.reset()
    },
    resetValidation() {
      this.$refs.addEventForm.resetValidation()
    },
    validateForm() {
      this.$refs.addEventForm.validate()
    },
    publish() {
      console.log("PUBLISHING")
    },
    saveNotPublish() {
      console.log("SAVENOTPUBLISHING")
    }
  }
}
</script>
