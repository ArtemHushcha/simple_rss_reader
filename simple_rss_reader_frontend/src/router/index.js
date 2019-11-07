import Vue from 'vue'
import Router from 'vue-router'
import Feeds from '@/components/Feeds'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Feeds',
      component: Feeds
    }
  ]
})
