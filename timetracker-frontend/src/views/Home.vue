<template>
  <div class="p-8">
    <h2 class="text-3xl font-bold mb-6">Neuen Zeiteintrag erfassen</h2>
    <div class="bg-white p-6 rounded-lg shadow">
      <div class="mb-4">
        <label class="block font-medium mb-1">Projekt</label>
        <select class="w-full border border-gray-300 rounded px-3 py-2">
          <option value="">--</option>
        </select>
      </div>
      <div class="mb-4">
        <label class="block font-medium mb-1">Datum</label>
        <input type="date" class="w-full border border-gray-300 rounded px-3 py-2" />
      </div>
      <div class="grid grid-cols-2 gap-4 mb-4">
        <div>
          <label class="block font-medium mb-1">Zeit</label>
          <input type="number" placeholder="Stunden" class="w-full border border-gray-300 rounded px-3 py-2" />
        </div>
        <div>
          <label class="block font-medium mb-1">Minuten</label>
          <input type="number" placeholder="Minuten" class="w-full border border-gray-300 rounded px-3 py-2" />
        </div>
      </div>
      <div class="mb-4">
        <label class="block font-medium mb-1">Beschreibung</label>
        <input type="text" class="w-full border border-gray-300 rounded px-3 py-2" />
      </div>
      <div class="flex justify-between items-center">
        <button class="bg-orange-600 hover:bg-orange-700 text-white px-6 py-2 rounded-lg">Speichern</button>
        <button class="border border-gray-300 text-gray-700 px-4 py-2 rounded-lg">Einträge von heute anzeigen</button>
      </div>
      <p class="text-center text-gray-500 mt-4">Heute bisher: 0 h 0 min</p>
    </div>
  </div>
</template>
