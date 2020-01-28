<script>
  import Banner from "../components/Banner.svelte";

  let title = "The APL Haven";
  let subtitle = "Your happy place for all things Dyalog APL";
</script>

<svelte:head>
  <title>{title}</title>
</svelte:head>

<Banner img="/images/library.jpg" alt="Picture of multi-level library stacks">
  <h1>{title}</h1>
  <p class="major">{subtitle}</p>
  <ul class="actions stacked fit" />
  <form method="get" action="search">
    <div class="fields">
      <div class="field">
        <input type="text" name="terms" id="terms" value="" />
      </div>
    </div>
    <ul class="actions fit small">
      <li><a href="#intro" class="button fit small smooth-scroll-middle">Get Started</a></li>
      <li><a href="#domains" class="button fit small smooth-scroll-middle">Browse by Domain</a></li>
      <li />
      <li>
        <input type="submit" name="submit" id="submit" value="Search"
               class="primary button fit small" />
      </li>
    </ul>
  </form>
</Banner>