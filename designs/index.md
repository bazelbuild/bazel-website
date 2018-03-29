---
layout: contribute
title: Design Documents
---

# Design Documents

The design documents published here are part of a design process:

1. Design is reviewed
2. Design document is published here
3. Design is implemented

It's possible that designs change as they are implemented in practice. The
design documents published here capture the initial design, and _not_ the
ongoing changes as designs are implemented.

Always go to the [documentation]({{ site.docs_site_url }}) for descriptions of
current Bazel functionality.

## Bazel Design Documents

<ul>
{% for doc in site.categories.designs %}
  <li><a href="{{ doc.url }}">{{ doc.title }}</a>
      {{ doc.date | date_to_long_string }}</a></li>
{% endfor %}
</ul>

## Skylark Design Documents

Changes to the Bazel build and extension language (Skylark) should go
through the [Skylark Design Process](/designs/skylark/skylark-design-process.html).

* [Moving Skylark out of Bazel](https://docs.google.com/document/d/15ysfoMXRqZDdz0OOY1mtpeWd7LjDnXKl4fOVSLGACAY/edit?usp=sharing) 23 March 2018
* [Output Map Madness](https://docs.google.com/document/d/1ic9lJPn-0VqgKcqSbclVWwYDW2eiV-9k6ZUK_xE6H5E/edit?usp=sharing) 05 March 2018
* [Parameterized Skylark Aspects](/designs/skylark/parameterized-aspects.html)
  18 April 2016
* [Declared Providers](/designs/skylark/declared-providers.html) 06 June 2016
* [Saner Skylark Sets](/designs/skylark/saner-skylark-sets.html) 25 July 2016
