<template>
  <v-text-field
    :rules="rules"
    v-model="setEmail"
    label="メールアドレスを入力"
    placeholder="your@email.com"
    outlined
  />
</template>

<script>
export default {
  props: {
    email: {
      type: String,
      default: ''
    }
  },
  data () {
    return {
      rules: [
        v => !!v || '',
        v => /.+@+/.test(v) || ''
      ]
    }
  },
  computed: {
    setEmail: {
      get () { return this.name },
      setnewValue (newValue) { return this.$emit('update:name', newValue) }
    }
  }
}
</script>
