<template>
  <div>About page</div>
  <div>666</div>
  <button @click="handelAdd">inc</button>
  <button @click="handelDec">dec</button>
  <router-link to="/">to Home</router-link>
</template>

<script setup lang="ts">
import { useCounter } from '../store';
const store = useCounter();

function handelAdd() {
  store.increment();
}

function handelDec() {
  store.decrement();
}
</script>
