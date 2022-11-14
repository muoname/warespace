// To see this message, add the following to the `<head>` section in your
// views/layouts/application.html.erb
//
//    <%= vite_client_tag %>
//    <%= vite_javascript_tag 'application' %>
console.log('Vite ⚡️ Rails')

// If using a TypeScript entrypoint file:
//     <%= vite_typescript_tag 'application' %>
//
// If you want to use .jsx or .tsx, add the extension:
//     <%= vite_javascript_tag 'application.jsx' %>

console.log('Visit the guide for more information: ', 'https://vite-ruby.netlify.app/guide/rails')

// Example: Load Rails libraries in Vite.
//
// import * as Turbo from '@hotwired/turbo'
// Turbo.start()
//
//import ActiveStorage from '@rails/activestorage'
//sctiveStorage.start()
//
// // Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')

// Example: Import a stylesheet in app/frontend/index.css
// import '~/index.css'

//Create Vue APp
import { createApp } from "vue"
import { Quasar } from "quasar"
import axios from "axios"
import VueAxios from "vue-axios"

// Import icon libraries
import '@quasar/extras/material-icons/material-icons.css'
import '@quasar/extras/fontawesome-v6/fontawesome-v6.css'
import '@quasar/extras/bootstrap-icons/bootstrap-icons.css'
import "quasar/src/css/flex-addon.sass"

// Import Quasar css
import 'quasar/src/css/index.sass'

//Import App Component
import App from "../views/shared/layout.vue"
import Router from '../routes.js';

//Create Vue App
const app = createApp(App)


app.use(Quasar, {
  plugins: {}, // import Quasar plugins and add here
})
app.use(Router)
app.use(VueAxios, axios)
app.mount('#app')

