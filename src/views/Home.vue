<template>
  <div>Home Page</div>
  <div>{{ store.counter }}</div>
  <router-link to="/about">to About</router-link>
</template>

<script setup lang="ts">
import { useCounter } from '../store';
const store = useCounter();
</script>
