<template>
  <div class="flex">
    <Sidebar />
    <div class="flex-1 bg-gray-100 min-h-screen">
      <router-view />
    </div>
  </div>
</template>

<script setup>
import Sidebar from './components/Sidebar.vue'
</script>
