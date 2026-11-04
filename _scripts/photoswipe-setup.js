---
permalink: /assets/js/photoswipe-setup.js
---
import PhotoSwipeLightbox from "{{ site.data.libraries.photoswipe-lightbox.url.js }}";
import PhotoSwipe from "{{ site.data.libraries.photoswipe.url.js }}";
const photoswipe = new PhotoSwipeLightbox({
  gallery: ".pswp-gallery",
  children: "a",
  pswpModule: PhotoSwipe,
});
photoswipe.init();
