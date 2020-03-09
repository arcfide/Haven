<script>
	export let id;
	export let title;
	export let style = "style1 align-center";
</script>

<section class="wrapper {style}" {id}>
  <div class="inner">
    {#if title}<h2>{@html title}</h2>{/if}
    <slot />
  </div>
</section>