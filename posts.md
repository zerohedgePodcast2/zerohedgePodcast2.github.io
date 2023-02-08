---
layout: default
title: Posts
---

## Posts

<ul class="posts">
  {% for post in site.tags.podcast %}
    <li class="post">
      <a href="{{ post.url }}">{{ post.title }}</a>
      <time class="publish-date" datetime="{{ post.datetime | date: '%F-%H-%M-%S' }}">
        {{ post.datetime | date: "%B %-d, %Y %X" }}
      </time>
    </li>
  {% endfor %}
</ul>
