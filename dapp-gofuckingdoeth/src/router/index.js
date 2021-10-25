import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import NuevoReto from '../views/NuevoReto.vue'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/nuevo-reto',
    name: 'NuevoReto',
    component: NuevoReto
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
