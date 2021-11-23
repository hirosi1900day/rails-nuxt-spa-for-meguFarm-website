<template>
<v-app-bar
app
dense
elevation="1"
:clipped-left="clippedLeft"
color="white"
>
  <slot name="navigation-toggle-button" />
  <nuxt-link
    :to="redirectPath"
    class="text-decoration-none"
  >
    <app-logo />
  </nuxt-link>
  <app-title />
  <logged-in-app-bar-breadcrumbs
    v-if="isNotHomePath"
   />
  <v-spacer />
  <logged-in-app-bar-account-menu />
</v-app-bar>
</template>

<script>
import AppLogo from '../App/AppLogo.vue'
import AppTitle from '../App/AppTitle.vue'
import LoggedInAppBarBreadcrumbs from './LoggedInAppBarBreadcrumbs.vue'
export default {
  props: {
    clippedLeft: {
      type: Boolean,
      default: false
    }
  },
  data ({ $store }) {
    return {
      redirectPath: $store.state.loggedIn.homePath
    }
  },
  computed: {
    isNotHomePath () {
      return this.$route.name !== this.redirectPath
    }
  },
  components: { AppLogo, AppTitle, LoggedInAppBarBreadcrumbs }
}
</script>
