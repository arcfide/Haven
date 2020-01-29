<script>
  export let size;
  export let type = "text";
  export let label;
  export let id;
</script>

<div class="field {size}">
  <label for="{id}">{label}</label>
  <input {type} name="{id}" {id} value="" />
</div>