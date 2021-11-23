<template>
   <v-app>
     <logged-in-app-bar
       clipped-left
     >
       <template v-slot:navigation-toggle-button>
        <v-app-bar-nav-icon
        @click="drawer = !drawer"
        />
       </template>
     </logged-in-app-bar>
     <project-navigation-drawer
       :drawer.sync="drawer"
     />
     <v-main>
       <nuxt />
     </v-main>
   </v-app>
</template>

<script>
export default {
  middleware: ['authentication', 'get-project-list','get-project-curret'],
  data () {
    return {
      drawer: null
    }
  }
}
</script>
