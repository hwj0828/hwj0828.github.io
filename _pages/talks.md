---
layout: page
title: Talks
permalink: /talks/
description: List of academic presentations and invited talks.
nav: true
nav_order: 2
---

<style>
.talks-list ol {
  list-style: none;
  padding-left: 0;
}
.talks-list ol li {
  margin-bottom: 2rem;
}
</style>

<div class="talks-list">
{% bibliography -f talks -T talks --group_by none %}
</div>