import { createApp } from 'vue'
import App from './App.vue'

import { createSlyUi } from 'sly-pkg'

createApp(App).use(createSlyUi()).mount('#app')
