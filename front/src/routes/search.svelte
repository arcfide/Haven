<script>
  import Banner from "../components/Banner.svelte";
  import Spotlight from "../components/Spotlight.svelte";
  import Wrapper from "../components/Wrapper.svelte";
  import ItemsGrid from "../components/ItemsGrid.svelte";
  import GridItem from "../components/GridItem.svelte";
  import Fields from "../components/Fields.svelte";
  import InputField from "../components/InputField.svelte";
  import TextAreaField from "../components/TextAreaField.svelte";

  let title = "Search Results - APL Haven";
  export let pages;
</script>

<script context="module">
  export async function preload(page, session) {
    let pages;

    if (page.query.terms) {
      const terms = page.query.terms.replace(/\+/g, " ");
      const results = await this.fetch("http://localhost:8080/search", {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify([terms])});
      pages = await results.json();
    }
   
    return { pages };
  }
</script>

<svelte:head>
  <title>{title}</title>
</svelte:head>

<div class="index align-center">
  <section>
    <header><h2><a href="/">The APL Haven</a></h2></header>
    <div class="content">
      <form method="get" action="search">
        <Fields>
          <InputField size="half" type="text" id="terms" />
          <InputField size="quarter align-left" type="submit" id="submit" value="Search" />
        </Fields>
      </form>
    </div>
  </section>
</div>

<Wrapper style="style1 align-left">
  {#if !pages}No search terms provided.
  {:else if pages.length == 0}No search results found.
  {:else}
    <dl>
      {#each pages as page}
        <dt><a rel="prefetch" href="topic/{page[0]}">{@html page[1]}</a></dt>
        <dd>{@html page[2]}</dd>
      {/each}
    </dl>
  {/if}
</Wrapper>
    