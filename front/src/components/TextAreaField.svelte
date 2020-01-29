<script>
  export let size;
  export let rows = "6";
  export let label;
  export let id;
</script>

<div class="field {size}">
  <label for="{id}">{label}</label>
  <textarea name="{id}" {id} {rows} />
</div>