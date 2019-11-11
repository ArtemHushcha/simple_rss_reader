<template>
  <header class="bg-grey-lighter py-4">
    <div class="container m-auto flex flex-wrap items-center justify-end">
      <div class="flex-1 flex items-center">
        <img alt="Simple RSS Reader Logo" src="../assets/logo.png">
        <a href="/" class="uppercase text-sm font-mono pl-4 font-semibold no-underline text-indigo-dark hover:text-indigo-darker">Simple RSS REader</a>
      </div>
      <div>
        <router-link to="/" class="link-grey px-2 no-underline">Feeds</router-link>
        <router-link to="/posts" class="link-grey px-2 no-underline">Reader Page</router-link>
      </div>
    </div>
  </header>
</template>

<script>
export default {
  name: 'Header'
}
</script>
