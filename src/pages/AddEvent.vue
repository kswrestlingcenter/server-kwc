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
            v-model="eventDate"
            label="Event Date"
            readonly
          ></v-text-field>
          <v-date-picker v-model="event"></v-date-picker>
          <v-file-input label="Attach logo"></v-file-input>
          <v-checkbox
            label="Agree to terms & conditions"
            v-model="agreeToTerms"
            :rules="agreeToTermsRules"
            required
          ></v-checkbox>
          <v-btn
            type="submit"
            color="primary"
            class="mr-4"
            :disabled="!formValidity"
            >Submit</v-btn
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
  data: () => ({
    agreeToTerms: false,
    agreeToTermsRules: [
      value =>
        !!value ||
        'You must agree to the terms and conditions to sign up for an account.'
    ],
    eventDate: '',
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
    }
  }
}
</script>
