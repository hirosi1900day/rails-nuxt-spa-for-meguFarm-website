<template>
  <v-breadcrumbs
    :items="items"
    class="d-block text-truncate"
  >
    <template v-slot:item="{ item }">
      <v-breadcrumbs-item>
        {{ item.text }}
      </v-breadcrumbs-item>
    </template>
    <template v-slot:divider>
      <v-icon>
        mdi-chevron-right
      </v-icon>
    </template>
  </v-breadcrumbs>
</template>

<script>
export default {
  computed: {
    items () {
      console.log(this.$route.name)
      return [
        { text: this.$route.name }
      ]
    }
  }
}
</script>
