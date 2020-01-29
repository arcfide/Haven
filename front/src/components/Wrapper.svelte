<script>
	export let id;
	export let title;
</script>

<section class="wrapper style1 align-center" {id}>
  <div class="inner">
    <h2>{title}</h2>
    <slot />
  </div>
</section>