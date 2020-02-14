<script>
  import Banner from "../components/Banner.svelte";
  import Spotlight from "../components/Spotlight.svelte";
  import Wrapper from "../components/Wrapper.svelte";
  import ItemsGrid from "../components/ItemsGrid.svelte";
  import GridItem from "../components/GridItem.svelte";
  import Fields from "../components/Fields.svelte";
  import InputField from "../components/InputField.svelte";
  import TextAreaField from "../components/TextAreaField.svelte";

  let title = "The APL Haven";
</script>

<svelte:head>
  <title>{title}</title>
</svelte:head>

<Banner img="/images/library.jpg" alt="Picture of multi-level library stacks">
  <h1>{title}</h1>
  <p class="major">Your happy place for all things Dyalog APL</p>
  <ul class="actions stacked fit" />
  <form method="get" action="search">
    <Fields>
      <InputField type="text" id="terms" />
    </Fields>
    <ul class="actions fit small">
      <li><a href="#onestop" class="button fit small smooth-scroll-middle">Get Started</a></li>
      <li><a href="#domains" class="button fit small smooth-scroll-middle">Browse by Domain</a></li>
      <li />
      <li>
        <input type="submit" name="submit" id="submit" value="Search"
               class="primary button fit small" />
      </li>
    </ul>
  </form>
</Banner>

<Spotlight id="onestop" orient="right" title="Your one-stop APL library" 
           img="/images/haven_door.jpg" alt="A Door with a Haven Sign above it"
           href="onestop">
  <p>The APL Haven is a full-stack, all-inclusive help system for Dyalog APL. 
  It is designed to help you get the answers to your questions fast, and to learn 
  how to get things done in APL even faster. For too long, the answers to how to do
  things in APL have been scattered across the Internet, often in hard to find places 
  and in formats that are hard to use. No longer.</p>

  <p>We use the official Dyalog APL 
  documentation sources to build an accessible portal into all things APL, so you can 
  trust that the answers you get aren't just someone's opinion on the Internet,
  but the real deal. We've also extended the documentation with targeted FAQ's, 
  idiom lists, how-to's, and a host of other educational and learning resources to help
  you get the most out of the extensive Dyalog APL ecosystem.</p>
</Spotlight>

<Spotlight id="fullstack" orient="left" title="Haven ≡ Full-stack APL" 
           img="/images/design_book.jpg" alt="A Book Full of Design Sketches"
           href="fullstack">
  <p>We believe in practising what we preach, and helping people learn while doing so. 
  That's why the APL Haven was designed from the ground up as a full-stack APL 
  application using the most modern and up-to-date APL techniques and methods, using 
  modern APL design patterns. If you've ever wondered what a modern, web and 
  mobile-first, data-driven APL application looks like, look no further.</p>

  <p>The entire source for Haven is available to learn and build upon, so you can see what 
  an APL application looks like from back-end to front-end and everything in between.</p>
</Spotlight>

<Wrapper id="domains" title="Browse by Domain">
  <p>Explore a set of curated guides to using APL within the specific domain of your 
  choice. These targeted guides help point you to the information you care about, 
  without bogging you down with the things you don't.</p>

  <ItemsGrid>
    <GridItem icon="fas fa-gem" title="Data Science" href="guides/data_science">
      Statistics for the modern era.
    </GridItem>
    <GridItem title="Machine Learning" href="guides/machine_learning">
      It's so hot right now.
    </GridItem>
    <GridItem title="Compilers" href="guides/compilers">
      Data-parallel Baby!
    </GridItem>
    <GridItem title="Middleware" href="guides/middleware">
      Who says it has to be boring?
    </GridItem>
    <GridItem title="Finance" href="guides/finance">
      Show me the money!
    </GridItem>
    <GridItem title="Databases" href="guides/databases">
      We're in-memory, on-chip, and persistent.
    </GridItem>
    <GridItem title="Dyalog Docs" href="guides/dyalog_docs">
      The traditional organization for Dyalog Documentation
    </GridItem>
    <GridItem title="Computer Science" href="guides/computer_science">
      Understanding APL as a computer scientist.
    </GridItem>
    <GridItem title="Software Engineering" href="guides/software_engineering">
      Learn to Build Simplicity into Everything.
    </GridItem>
  </ItemsGrid>
</Wrapper>

<Wrapper title="Get in touch">
  <p>We'd love to hear from you! If you have an idea for improvements, suggestions, or 
  just general feedback, please let us know.</p>

  <form method="post" action="send_feedback">
    <Fields>
      <InputField size="half" type="text" label="Name" id="name" />
      <InputField size="half" type="email" label="Email" id="email" />
      <TextAreaField id="message" rows="6" label="Message" />
    </Fields>
    <ul class="actions special">
      <li><input type="submit" id="submit" value="Send Message" /></li>
    </ul>
  </form>
</Wrapper>
    