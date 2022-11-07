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

// Import icon libraries
import '@quasar/extras/material-icons/material-icons.css'
import '@quasar/extras/fontawesome-v6/fontawesome-v6.css'
import '@quasar/extras/bootstrap-icons/bootstrap-icons.css'
import "quasar/src/css/flex-addon.sass"

// Import Quasar css
import 'quasar/src/css/index.sass'

//Import App Component
import App from "../components/App.vue"
import Registration from "../components/Registration.vue"
import Landing from "../components/Landing.vue"
import Space_Recording from "../components/Space-Recording.vue"
import Account from "../components/Account.vue"

//Create Vue App
const app = createApp(App)
const registration = createApp(Registration)
const landing = createApp(Landing)
const space_recording = createApp(Space_Recording)
const account = createApp(Account)

app.use(Quasar, {
  plugins: {}, // import Quasar plugins and add here
})

app.mount('#app')

registration.use(Quasar, {
  plugins: {}, // import Quasar plugins and add here
})

registration.mount('#registration')

landing.use(Quasar, {
  plugins: {}, // import Quasar plugins and add here
})

landing.mount('#landing')

space_recording.use(Quasar, {
  plugins: {}, // import Quasar plugins and add here
})

space_recording.mount('#space_recording')

account.use(Quasar, {
  plugins: {}, // import Quasar plugins and add here
})

account.mount('#account')
