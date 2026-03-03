import { createApp } from 'vue'
import App from './App.vue'

import { createSlyUi } from '../index'

createApp(App).use(createSlyUi()).mount('#app')
