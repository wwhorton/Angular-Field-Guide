[
{exp:channel:entries channel="field_guide_types" backspace="2" url_title="{segment_3}"}{subtypes}{if subtypes:count != '0'}{subtypes:parents field="type"}
  {
  "title": "{subtypes:parents:title}",
  "type": "{subtypes:title}",
  "url": "{subtypes:parents:url_title}",
  "scientific_name": "{subtypes:parents:scientific_name}"
  },
{/subtypes:parents}{/if}{/subtypes}{/exp:channel:entries}
]