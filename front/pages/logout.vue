<script>
export default {
  async middleware ({ redirect }) {
    await $auth.logout()
    return redirect('/')
  }
}
</script>
