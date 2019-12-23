<template>
  <div id="app">
    <router-link to="/">新着</router-link> |
    <router-link to="/rankPage">ランキング</router-link>
    <router-view/>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
