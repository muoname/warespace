const routes = [
  {
    path: "/",
    component: () => import("layouts/MainLayout.vue"),
    children: [
      { path: "",
        name: "home_path",
        component: () => import("pages/shared/landing.vue") },
      {
        path: "/users/sign_up",
        component: () => import("pages/registration.vue"),
      },
      {
        path: "/host/listing",
        name: "listing_path",
        component: () => import("pages/host/listing.vue"),
      },
      {
        path: "/host/listing/:id",
        name: "host_show_path",
        component: () => import("pages/host/show.vue"),
      },
      {
        path: "/users/account",
        name: "account_path",
        component: () => import("pages/account.vue"),
      },
    ],
  },
  {
    path: "/test",
    component: () => import("pages/test.vue"),
  },

  // Always leave this as last one,
  // but you can also remove it
  {
    path: "/:catchAll(.*)*",
    component: () => import("pages/ErrorNotFound.vue"),
  },
];

export default routes;
