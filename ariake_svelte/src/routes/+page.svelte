<script lang="ts">
  import { onMount } from "svelte";

  let eventListJson = [];
  let loading = true;

  onMount(async () => {
    const res = await fetch("http://localhost:3000/ariake_arena_events");
    eventListJson = await res.json();

    console.log(eventListJson);
    loading = false;
  });
</script>

<main>
  <div>
    {#if loading}
      <h1 class="text-3xl font-bold underline">ロード中・・・</h1>
    {:else}
      <h1 class="text-3xl font-bold underline">イベント一覧</h1>
      <hr />
      {#each eventListJson as eventList (eventList.id)}
        <div>
          {eventList.start_date}
          {eventList.name}

          <hr />
        </div>
      {/each}
    {/if}
  </div>
</main>

<style lang="postcss">
  :global(html) {
    background-color: theme(colors.gray.100);
  }
</style>
