<script>
	export let img;
	export let alt;
	export let href;
	export let id;
	export let orient = "left";
	export let title;
	export let linktext = "Learn More";
</script>

<section {id} class="spotlight style1 orient-{orient} content-align-left 
                    image-position-center onscroll-image-fade-in">
  <div class="content">
    <h2>{title}</h2>
    <slot />
    <ul class="actions stacked">
      <li><a {href} class="button">{linktext}</a></li>
    </ul>
  </div>
  <div class="image"><img src="{img}" {alt} /></div>
</section>
