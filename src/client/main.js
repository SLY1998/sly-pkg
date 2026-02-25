import { createApp } from 'vue'
import App from './App.vue'

import { createSlyUi } from '../../dist/sly-pkg.es.js'

createApp(App).use(createSlyUi()).mount('#app')
