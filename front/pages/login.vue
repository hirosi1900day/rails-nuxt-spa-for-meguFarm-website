<template>
<div>
  <user-form-card
  >
    <template v-slot:user-form-card-content>
      <v-form
        ref="form"
        v-model="isValid"
        @submit.prevent="login"
      >
        <user-form-email :email.sync="params.auth.email" />
        <user-form-password :password.sync="params.auth.password" />
        <v-btn
        type="submit"
        :disabled="!isValid || loading"
        :loading="loading"
        color="appblue"
        class="white--text"
        >
        ログインする
        </v-btn>
      </v-form>
    </template>
  </user-form-card>
</div>
</template>

<script>
import UserFormEmail from '../components/User/UserFormEmail.vue'
import UserFormPassword from '../components/User/UserFormPassword.vue'
import UserFormCard from '../components/User/UserFormCard.vue'

export default {
  data ({ $store }) {
    return {
      isValid: false,
      loading: false,
      params: { auth: { email: '', password: '' } },
      redirectPath: $store.state.loggedIn.rememberPath,
      loggedInHomePath: $store.state.loggedIn.homePath
    }
  },
  components: { UserFormCard, UserFormEmail, UserFormPassword },
  layout: 'before-login',
  methods: {
   async login () {
      this.loading = true
      if(this.isValid) {
        await this.$axios.$post('/api/vi/auth_token', this.params)
        .then(Response => this.authSuccessful(Response))
        .catch(Error => this.authFailure(Error))
      }
      this.loading = false
      this.$router.push(this.redirectPath)
    },
    authSuccessful (response) {
      this.$auth.login(response)
      this.$router.push(this.redirectPath)
      this.$store.dispatch('getRememberPath', this.loggedInHomePath)
    },
    authFailure ({ response }) {
      if (response && response.status == 404) {
        const msg = 'ユーザーが見つかりませんでた'
        return this.$store.dispatch('getToast', { msg })
      }
    }
  }
}
</script>
