import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import { SmartContract } from './smart-contract';

const app = createApp(App)
app.config.globalProperties.$contrato = SmartContract()
app.use(router).mount('#app')