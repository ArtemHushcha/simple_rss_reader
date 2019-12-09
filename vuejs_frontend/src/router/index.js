import Vue from 'vue'
import Router from 'vue-router'
import Feeds from '@/components/Feeds'
import Posts from '@/components/Posts'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Feeds',
      component: Feeds
    },
    {
      path: '/posts',
      name: 'Posts',
      component: Posts
    }
  ]
})
