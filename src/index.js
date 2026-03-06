import { forEach } from 'lodash-es'
import * as components from './components'
import * as utils from './utils'
import { sly_pkg_config } from './config'
export { default as slyRoutes } from './routes'

export const createSlyUi = (config = {}) => {
    // 可以进行一些预处理...
    sly_pkg_config.env_info = config.env_info ?? {}
    return {
        install(app) {
            forEach(components, (component) => {
                app.component("Sly" + component.name, component)
            })
        }
    }
}

export {
    components,
    utils
}
