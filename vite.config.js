import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import * as path from 'path'
import libCss from 'vite-plugin-libcss';

// https://vite.dev/config/
export default defineConfig({
  plugins: [vue(), libCss()],
  build: {
    lib: {
      entry: path.resolve(__dirname, 'src/index.js'),
      name: 'sly-pkg',
      fileName: (format) => `sly-pkg.${format}.js`
    },
    // 确保外部化处理那些你不想打包进库的依赖
    rollupOptions: {
      external: ['vue'],
      output: {
        globals: {
          vue: 'Vue'
        }
      }
    }
  }
})
