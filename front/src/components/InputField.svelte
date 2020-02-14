<script>
  export let size;
  export let type = "text";
  export let label;
  export let id;
  export let value = "";
</script>

<div class="field {size}">
  {#if label}<label for="{id}">{label}</label>{/if}
  <input {type} name="{id}" {id} {value} />
</div>