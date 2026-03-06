const demoRoutes = [
    {
        path: '/demo',
        name: 'demo',
        component: () => import('../view/demo/index.vue')
    }
]

export default demoRoutes