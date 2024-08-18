'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "5f9f73420168258198a70825b32f5406",
"images/wall.png": "39699401c32055e2a65403dfbcebbd71",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"splash/img/dark-3x.png": "b0810d9e750a85de1f8e8d0d61735d0f",
"splash/img/light-4x.png": "3891d9482f24506a37d4431e925b24df",
"splash/img/dark-1x.png": "71a46e23fb9ffa6f9696e1a39ce46b05",
"splash/img/light-2x.png": "4c82e43d1b477e2dd75e87476eac4358",
"splash/img/light-3x.png": "b0810d9e750a85de1f8e8d0d61735d0f",
"splash/img/light-1x.png": "71a46e23fb9ffa6f9696e1a39ce46b05",
"splash/img/dark-2x.png": "4c82e43d1b477e2dd75e87476eac4358",
"splash/img/dark-4x.png": "3891d9482f24506a37d4431e925b24df",
"manifest.json": "4ceb75d9a205b89f382fd1aa65f2c941",
"favicon.png": "ae123e4aea0e320dc6e90a8471000dd5",
"flutter_bootstrap.js": "adaa4f92a3c682aa1765c2b9caff00eb",
"index.html": "154fb1ddf3c3e784e195109d83a044b8",
"/": "154fb1ddf3c3e784e195109d83a044b8",
"assets/fonts/MaterialIcons-Regular.otf": "a421a51e0ed5ee766697a815aed42d80",
"assets/AssetManifest.json": "e9003e1ffb3bc08ecd1eeee3be59b699",
"assets/images/bannerImage.png": "b65d13a3e46400eacae39ace6682cae9",
"assets/images/logoSemFundo.png": "03b3be6bc6f781ddbfb2d7a86135a50d",
"assets/images/banner1.png": "ddf20563425ce9cea8af717f31913e44",
"assets/images/logo.png": "db7373a45168ebc422bcc9c6316e639e",
"assets/images/imageNotFound.png": "8f69fdb2232c029bae79082716751428",
"assets/images/icons/iconCart.svg": "09cfee802ecef53b53525fe4dea37ea5",
"assets/images/icons/iconShop.svg": "98af17bc0c2ee54873b6999f52bf8f46",
"assets/images/icons/iconAccount.svg": "541b01beb039f57e3b950cc453d04536",
"assets/images/icons/iconExplore.svg": "a8bf4b00372704d884ceee5acf193ef0",
"assets/images/product.png": "48b6912dd221c61cbb90ed463d14a011",
"assets/images/sucess.png": "1fc5028eeaf50540410404a92f0c38c4",
"assets/images/banner2.png": "034499b22abc543d260167e9bf6f4b93",
"assets/AssetManifest.bin.json": "0aaf95469040302a6e425655d5f9a16f",
"assets/NOTICES": "3bf4c2a34b6e9538c361986a86874e1b",
"assets/AssetManifest.bin": "2bb12d2fbde76c42dc51a75369eaa4e5",
"assets/packages/quickalert/assets/error.gif": "c307db003cf53e131f1c704bb16fb9bf",
"assets/packages/quickalert/assets/success.gif": "dcede9f3064fe66b69f7bbe7b6e3849f",
"assets/packages/quickalert/assets/warning.gif": "f45dfa3b5857b812e0c8227211635cc4",
"assets/packages/quickalert/assets/info.gif": "90d7fface6e2d52554f8614a1f5deb6b",
"assets/packages/quickalert/assets/confirm.gif": "bdc3e511c73e97fbc5cfb0c2b5f78e00",
"assets/packages/quickalert/assets/loading.gif": "ac70f280e4a1b90065fe981eafe8ae13",
"assets/packages/awesome_snackbar_content/assets/back.svg": "ba1c3aebba280f23f5509bd42dab958d",
"assets/packages/awesome_snackbar_content/assets/bubbles.svg": "1df6817bf509ee4e615fe821bc6dabd9",
"assets/packages/awesome_snackbar_content/assets/types/warning.svg": "cfcc5fcb570129febe890f2e117615e0",
"assets/packages/awesome_snackbar_content/assets/types/failure.svg": "cb9e759ee55687836e9c1f20480dd9c8",
"assets/packages/awesome_snackbar_content/assets/types/success.svg": "6e273a8f41cd45839b2e3a36747189ac",
"assets/packages/awesome_snackbar_content/assets/types/help.svg": "7fb350b5c30bde7deeb3160f591461ff",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/web/splash/img/dark-3x.png": "b0810d9e750a85de1f8e8d0d61735d0f",
"assets/web/splash/img/light-4x.png": "3891d9482f24506a37d4431e925b24df",
"assets/web/splash/img/dark-1x.png": "71a46e23fb9ffa6f9696e1a39ce46b05",
"assets/web/splash/img/light-2x.png": "4c82e43d1b477e2dd75e87476eac4358",
"assets/web/splash/img/light-3x.png": "b0810d9e750a85de1f8e8d0d61735d0f",
"assets/web/splash/img/light-1x.png": "71a46e23fb9ffa6f9696e1a39ce46b05",
"assets/web/splash/img/dark-2x.png": "4c82e43d1b477e2dd75e87476eac4358",
"assets/web/splash/img/dark-4x.png": "3891d9482f24506a37d4431e925b24df",
"icons/Icon-maskable-512.png": "2f094acf861489de352b8c522b1c74d0",
"icons/Icon-192.png": "34cb78e5e9f293ce471646fc942afa81",
"icons/Icon-512.png": "2f094acf861489de352b8c522b1c74d0",
"icons/Icon-maskable-192.png": "34cb78e5e9f293ce471646fc942afa81",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"main.dart.js": "33786617088733726f8fe6aa92fe1100"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
