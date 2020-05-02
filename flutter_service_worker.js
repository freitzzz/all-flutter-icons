'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "manifest.json": "a4dd5ec8f89772d24a15e6b51b1c51b5",
"index.html": "7e7af6e415869d18453435872ef34ef9",
"/": "7e7af6e415869d18453435872ef34ef9",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/LICENSE": "7680001ded360e5357c42bb17a7e4d32",
"assets/AssetManifest.json": "90a0150b4f52146d688fbd1408a8f459",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "9a62a954b81a1ad45a58b9bcea89b50b",
"assets/assets/apple_logo.png": "39881236300a294d6d51ed96b703dd57",
"main.dart.js": "38909de52a6ecf8b35622764105e13b8"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
