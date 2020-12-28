<template>
	<v-card width="400" class="mx-auto mt-5">
		<v-card-title>
			<h1 class="display-1">Login</h1>
		</v-card-title>
		<v-card-text>
			<v-form>
				<v-text-field label="Username" prepend-icon="mdi-account-circle" v-model="email"/>
				<v-text-field
					v-model="password"
					:type="showPassword ? 'text' : 'password'"
					label="Password"
					prepend-icon="mdi-lock"
					:append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
					@click:append="showPassword = !showPassword"
				/>
			</v-form>
		</v-card-text>
		<v-divider></v-divider>
		<v-card-actions>
			<!-- <v-btn color="success">Register</v-btn> -->
			<v-spacer></v-spacer>
			<v-btn color="info" @click="login()">Login</v-btn>
		</v-card-actions>
	</v-card>
</template>

<script>
export default {
	name: 'LoginPage',
	data() {
		return {
			showPassword: false,
			email: '',
      password: '',
      error: null
		}
	},
  methods: {
    login () {
			console.log("LOGGINGN IN")
      this.$store
        .dispatch('login', {
          email: this.email,
          password: this.password
        })
        .then(() => {
          this.$router.push({ name: 'dashboard' })
        })
        .catch(err => {
          this.error = err.response.data.error
        })
    }
  }
}
</script>

<style></style>
