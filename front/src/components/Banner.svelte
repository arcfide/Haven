<script>
	export let img;
	export let alt;
</script>

<section class="banner style1 orient-left content-align-left image-position-right fullscreen onload-image-fade-in onload-content-fade-right">
  <div class="content">
    <slot />
  </div>
  <div class="image">
    <img src="{img}" {alt} />
  </div>
</section>
