<template>
  <div class="max-w-md m-auto py-10">

    <hr class="border border-grey-light my-6" />

    <ul class="list-reset mt-4">
      <li class="py-4" v-for="post in posts" :key="post.id" :post="post">

        <div class="flex items-center justify-between flex-wrap">
          <p class="block flex-1 font-mono font-semibold flex items-center ">
            <a v-bind:href="post.url" class="text-sm font-mono pl-4 font-semibold no-underline" target="_blank">{{ post.title }}</a>
          </p>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'Posts',
  data () {
    return {
      posts: [],
      error: ''
    }
  },
  created () {
    this.$http.plain.get('/api/v1/posts')
      .then(response => {
        this.posts = response.data
      })
      .catch(error => this.setError(error, 'Something went wrong'))
  },
  methods: {
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    }
  }
}
</script>
