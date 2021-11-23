export default ({ $axios }) => {
                // リクエストログ
$axios.onRequest((config) => {
  config.headers.common['X-Requested-with'] = 'XMLHttpRequest'
  if ($auth.token) {
    config.headers.comon.Authorization = `Bearer ${$auth.token}`
  }
})
                // レスポンスログ
$axios.onResponse((config) => {
  console.log(config)
})
                // エラーログ
$axios.onError((e) => {
    console.log(e.response)
  })
}