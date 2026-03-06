import { createApp } from 'vue'
import App from './App.vue'

import { createSlyUi, slyRoutes } from '../index'

createApp(App).use(createSlyUi()).mount('#app')
