[
{exp:channel:entries channel="field_guide_types" backspace="2" url_title="{segment_3}"}{if subtypes:count > 0}{subtypes}{subtypes:parents field="type"}
  {
  "title": "{subtypes:parents:title}",
  "url": "{subtypes:parents:url_title}",
  "image": "{subtypes:parents:media}{subtypes:parents:media:image}{/subtypes:parents:media}",
  "scientific_name": "{subtypes:parents:scientific_name}"
  },
{/subtypes:parents}{/subtypes}{/if}{/exp:channel:entries}
]