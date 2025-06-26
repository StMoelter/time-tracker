<template>
  <aside class="w-64 bg-gray-800 text-white min-h-screen p-6">
    <h1 class="text-2xl font-bold mb-6">TimeTracker</h1>
    <nav class="space-y-2">
      <RouterLink to="/" class="flex items-center px-4 py-2 rounded-lg bg-orange-600 hover:bg-orange-700">
        <ClockIcon class="w-5 h-5 mr-2"/> Home
      </RouterLink>
      <RouterLink to="/projects" class="flex items-center px-4 py-2 rounded-lg hover:bg-gray-700">
        <ListBulletIcon class="w-5 h-5 mr-2"/> Projekte verwalten
      </RouterLink>
      <RouterLink to="/entries" class="flex items-center px-4 py-2 rounded-lg hover:bg-gray-700">
        <FolderIcon class="w-5 h-5 mr-2"/> Einträge verwalten
      </RouterLink>
      <RouterLink to="/daily" class="flex items-center px-4 py-2 rounded-lg hover:bg-gray-700">
        <TableCellsIcon class="w-5 h-5 mr-2"/> Einträge pro Tag
      </RouterLink>
    </nav>
  </aside>
</template>

<script setup>
import { RouterLink } from 'vue-router'
import { ClockIcon, ListBulletIcon, FolderIcon, TableCellsIcon } from '@heroicons/vue/24/outline'
</script>