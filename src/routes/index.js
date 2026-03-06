const jsfile = {}

// 获取外部定义的路由
const outerRoutes = import.meta.glob('../../src/routes/*.js', { eager: true })
console.log("🚀 ~ outerRoutes:", outerRoutes)


export default outerRoutes