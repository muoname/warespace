import { boot } from 'quasar/wrappers';
import VueGoogleMaps from '@fawmi/vue-google-maps';

export default boot(({ app }) => {
  app.use(VueGoogleMaps, { // 
    load: {
      key: 'AIzaSyCFm1HddmHtIyiMJlv4_Gx5yFNIUS4fHa4', // 
    },
  });
});