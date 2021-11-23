<template>
  <v-text-field
    :rules="form.rules"
    :hint="form.hint"
    v-model="setPassword"
    label="パスワードを入力"
    :placeholder="form.placeholder"
    :hide-details="!setValidation"
    :counter="setValidation"
    :append-icon="toggle.icon"
    :type="toggle.type"
    outlined
    autocomplete="on"
    @click:append="show = !show"

  />
</template>

<script>
export default {
  props: {
    password: {
      type: String,
      default: ''
    },
    setValidation: {
      type: Boolean,
      default: false
    }
  },
  data () {
    return {
      show: false
    }
  },
  computed: {
    setPassword: {
      get() { return this.name },
      set(newValue) {return this.$emit('update:name', newValue)}
    },
    form () {
      const min = '8文字以上'
      const msg = `${min}。半角英数字•ﾊｲﾌﾝ•ｱﾝﾀﾞｰﾊﾞｰが使えます`
      const required = v => !!v || ''
      const format = v => /^[\w-]{8,72}$/.test(v) || msg

      const rules = this.setValidation ? [required] : [format]
      const hint = this.setValidation ? undefined : msg
      const placeholder = this.setValidation ? undefined : min
      return { rules, hint, placeholder }
    },
    toggle () {
      const icon = this.show ? 'mdi-eye' : 'mdi-eye-off'
      const type = this.show ? 'text' : 'password'
      return { icon, type }
    }
  }
}
</script>
