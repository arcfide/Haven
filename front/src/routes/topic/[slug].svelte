<script context="module">
  export async function preload({ params, query }) {
    const idx = parseInt(params.slug);

    if (idx === NaN) { return { }; }

    const result = await this.fetch('http://localhost:8080/topic', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify([idx])});
    const topic = await result.json();

    if (result.status === 200) {
      return { topic };
    } else {
      this.error(result.status, topic.message);
    }
  }
</script>

<script>
  import Wrapper from "../../components/Wrapper.svelte";
  import Fields from "../../components/Fields.svelte";
  import InputField from "../../components/InputField.svelte";
  import { onMount } from 'svelte';

  export let topic;

  onMount(() => {MathJax.typeset();});
</script>

<svelte:head>
  <title>{topic[0]} - APL Haven</title>
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

<Wrapper title="{topic[0]}" style="style1">
  {@html topic[1]}
</Wrapper>