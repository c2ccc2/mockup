import Vue from 'vue'
import axios from 'axios'

axios.defaults.baseURL = "/"
Vue.prototype.$http= axios

