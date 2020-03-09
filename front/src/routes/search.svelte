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

<style>
  article {
    margin-bottom: 1rem;
  }

  article header {
    display: flex;
    flex-flow: rows wrap;
    justify-content: space-between;
    font-size: 1.3rem;
    border-bottom: 1px solid;
  }

  article :global(h3), article :global(p), article :global(pre) {
    padding: 0;
    margin: 0;
  }

  :global(.aplcart) .atype {
    color: rgb(0, 0, 255);
  }

  :global(.quickref) .atype {
    color: rgb(255, 0, 0);
  }
</style>

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
    {#each pages as page}
      <article class="{page[3]}">
        <header>
          <h3><a ref="prefetch" href="topic/{page[0]}">{@html page[1]}</a></h3>
          <div class="atype">
           {#if page[3] === 'aplcart'}Idiom{/if}
           {#if page[3] === 'quickref'}Quick Reference{/if}
           {#if page[3] === 'doc'}Official Documentation{/if}
          </div>
        </header>
        {@html page[2]}
      </article>
    {/each}
  {/if}
</Wrapper>
    