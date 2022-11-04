import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import FullReload from 'vite-plugin-full-reload'
import vue from "@vitejs/plugin-vue"
import { quasar, transformAssetUrls } from '@quasar/vite-plugin'

export default defineConfig({
  plugins: [
    RubyPlugin(),
    FullReload(["config/routes.rb", "app/views/**/*"], {delay: 200}),
    vue({
      template: { transformAssetUrls }
    }),
    quasar({
    })
  ],
})
