import { forEach } from 'lodash-es'
import * as components from './components'

export const createSlyUi = () => {
    // 可以进行一些预处理...
    // ...
    return {
        install(app) {
            forEach(components, (component) => {
                app.component("Sly" + component.name, component)
            })
        }
    }
}

export {
    components
}
