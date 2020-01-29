<script>
  export let icon = "fas fa-gem";
  export let title;
  export let href;
</script>

<section>
  <span class="icon style2 {icon}" />
  <h3><a {href}>{title}</a></h3>
  <p><slot /></p>
</section>