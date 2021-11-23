<template>
<div>
  <user-form-card
  >
    <template v-slot:user-form-card-content>
      <v-form
        ref="form"
        v-model="isValid"
        @submit.prevent="signup"
      >
        <user-form-name
          :name.sync="params.user.name"/>
        <user-form-email :email.sync="params.user.email" />
        <user-form-password :password.sync="params.user.password" setValidation />
        <v-btn
        type="submit"
        :disabled="!isValid || loading"
        :loading="loading"
        color="appblue"
        class="white--text"
        >
        登録する
        </v-btn>
      </v-form>
    </template>
  </user-form-card>
</div>
</template>

<script>
import UserFormEmail from '../components/User/UserFormEmail.vue'
import UserFormName from '../components/User/UserFormName.vue'
import UserFormPassword from '../components/User/UserFormPassword.vue'
import UserFormCard from '../components/User/UserFormCard.vue'

export default {
  data () {
    return {
      isValid: false,
      loading: false,
      params: { user: { name: '', email: '', password: '' } }
    }
  },
  components: { UserFormCard, UserFormName, UserFormEmail, UserFormPassword },
  layout: 'before-login',
  methods: {
    signup () {
      console.log('signup methods')
      this.formReset()
    },
    formReset () {
      this.$refs.form.reset()
      for (const key in this.params.user) {
        this.params.user[key] = ''
      }
    }
  }
}
</script>
