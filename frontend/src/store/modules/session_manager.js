import axios from "axios";

const BASE_URL = "http://localhost:3000/";

const state = {
  status: null,
  auth_token: null,
  user: {
    id: null,
    email: null,
    role: null,
    first_name: null,
    last_name: null,
    address: null,
    phone_number: null,
    is_renter: null,
    longitude: null,
    latitude: null,
  },
};

const getters = {
  getAuthToken(state) {
    return state.auth_token;
  },
  getUserEmail(state) {
    return state.user?.email;
  },
  getUserID(state) {
    return state.user?.id;
  },
  getUserFirstName(state) {
    return state.user?.first_name;
  },
  getUserLastName(state) {
    return state.user?.last_name;
  },
  isRenter(state) {
    return state.user?.is_renter;
  },
  getUserAddress(state) {
    return state.user?.address;
  },
  getUserPhoneNumber(state) {
    return state.user?.phone_number;
  },
  getLat(state) {
    return state.user?.latitude;
  },
  getLng(state) {
    return state.user?.longitude;
  },
  getStatus(state) {
    return state.status;
  },
  isLoggedIn(state) {
    const loggedOut =
      state.auth_token == null || state.auth_token == JSON.stringify(null);
    return !loggedOut;
  },
};

const actions = {
  setState (status) {
    state.status = status;
  },
  registerUser({ commit }, payload) {
    return new Promise((resolve, reject) => {
      axios
        .post(`${BASE_URL}users`, payload)
        .then((response) => {
          commit("setUserInfo", response);
          resolve(response);
        })
        .catch((error) => {
          reject(error);
        });
    });
  },
  loginUser({ commit }, payload) {
    new Promise((resolve, reject) => {
      axios
        .post(`${BASE_URL}users/sign_in`, payload)
        .then((response) => {
          commit("setUserInfo", response);
          resolve(response);
        })
        .catch((error) => {
          reject(error);
        });
    });
  },
  logoutUser({ commit }) {
    console.log;
    const config = {
      headers: {
        authorization: state.auth_token,
      },
    };
    new Promise((resolve, reject) => {
      axios
        .delete(`${BASE_URL}users/sign_out`, config)
        .then(() => {
          commit("resetUserInfo");
          resolve();
        })
        .catch((error) => {
          reject(error);
        });
    });
  },
  loginUserWithToken({ commit }, payload) {
    const config = {
      headers: {
        Authorization: payload.auth_token,
      },
    };
    new Promise((resolve, reject) => {
      axios
        .get(`${BASE_URL}member-data`, config)
        .then((response) => {
          
          commit("setUserInfoFromToken", response);
          resolve(response);
        })
        .catch((error) => {
          reject(error);
        });
    });
  },
};

const mutations = {
  setUserInfo(state, data) {
    state.user = data.data.user;
    state.auth_token = data.headers.authorization;
    axios.defaults.headers.common["Authorization"] = data.headers.authorization;
    localStorage.setItem("auth_token", data.headers.authorization);
  },
  setUserInfoFromToken(state, data) {
    state.user = data.data.user;
    state.auth_token = localStorage.getItem("auth_token");
  },
  resetUserInfo(state) {
    state.user = {
      id: null,
      email: null,
      role: null,
      first_name: null,
      last_name: null,
      address: null,
      phone_number: null,
      is_renter: null,
      longitude: null,
      latitude: null,
    };
    state.auth_token = null;
    localStorage.removeItem("auth_token");
    axios.defaults.headers.common["Authorization"] = null;
  },
};

export default {
  state,
  getters,
  actions,
  mutations,
};
