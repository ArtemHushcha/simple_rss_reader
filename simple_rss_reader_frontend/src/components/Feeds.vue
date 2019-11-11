<template>
  <div class="max-w-md m-auto py-10">
    <div class="text-red" v-if="error">{{ error }}</div>
    <h3 class="font-mono font-regular text-3xl mb-4">Add a new feed</h3>
    <form action="" @submit.prevent="addFeed">
      <div class="mb-6">
        <input class="input"
          autofocus autocomplete="off"
          placeholder="Type a feed URL"
          v-model="newFeed.url" />
      </div>
      <input type="submit" value="Add Feed" class="font-sans font-bold px-4 rounded cursor-pointer no-underline bg-orange-600 hover:bg-orange-400 block w-full py-4 text-gray-900 items-center justify-center" />
    </form>

    <hr class="border border-grey-light my-6" />

    <ul class="list-reset mt-4">
      <li class="py-4" v-for="feed in feeds" :key="feed.id" :feed="feed">

        <div class="flex items-center justify-between flex-wrap">
          <p class="block flex-1 font-mono font-semibold flex items-center ">
            {{ feed.title }}
          </p>

          <button class="bg-tranparent text-sm hover:bg-blue hover:text-gray-900 text-blue border border-blue no-underline font-bold py-2 px-4 mr-2 rounded"
          @click.prevent="editFeed(feed)">Edit</button>

          <button class="bg-transprent text-sm hover:bg-red text-red hover:text-gray-900 no-underline font-bold py-2 px-4 rounded border border-red"
          @click.prevent="removeFeed(feed)">Delete</button>
        </div>

        <div v-if="feed == editedFeed">
          <form action="" @submit.prevent="updateFeed(feed)">
            <div class="mb-6 p-4 bg-white rounded border border-grey-light mt-4">
              <input class="input" type="text" v-model="feed.url" />
              <input type="submit" value="Update" class="my-2 bg-transparent text-sm hover:bg-blue hover:text-gray-900 text-blue border border-blue no-underline font-bold py-2 px-4 rounded cursor-pointer">
            </div>
          </form>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'Feeds',
  data () {
    return {
      feeds: [],
      newFeed: {},
      editedFeed: {},
      error: ''
    }
  },
  created () {
    this.$http.plain.get('/api/v1/feeds')
      .then(response => {
        this.feeds = response.data
      })
      .catch(error => this.setError(error, 'Something went wrong'))
  },
  methods: {
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
    addFeed () {
      this.$http.plain.post('/api/v1/feeds/', { feed: { url: this.newFeed.url || '' } })
        .then(response => {
          this.feeds.unshift(response.data)
          this.newFeed = {}
          this.error = ''
        })
        .catch(error => this.setError(error, 'Cannot create feed'))
    },
    removeFeed (feed) {
      this.$http.plain.delete(`/api/v1/feeds/${feed.id}`)
        .then(response => {
          this.feeds.splice(this.feeds.indexOf(feed), 1)
        })
        .catch(error => this.setError(error, 'Cannot delete feed'))
    },
    editFeed (feed) {
      this.editedFeed = feed
    },
    updateFeed (feed) {
      this.editedFeed = {}
      this.$http.plain.patch(`/api/v1/feeds/${feed.id}`, { feed: { url: feed.url } })
        .then(response => {
          this.feeds.splice(this.feeds.indexOf(feed), 1, response.data)
          this.error = ''
        })
        .catch(error => this.setError(error, 'Cannot update feed'))
    }
  }
}
</script>
