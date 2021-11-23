<template>
  <v-container>
    {{ $store.state.project.current }}
    <nuxt-child />
  </v-container>
</template>

<script>
export default {
  layout: 'project',
  validate ({ route, store }) {
    return !!store.state.project.current && route.name !== 'account'
  }
}
</script>
