{% extends "page.tpl" %}

{% block content_body %}

{% cache 7200 %}

{% for r in m.search[{archive_year cat='project'}] %}
<div class="grid_9 alpha omega">
    <h2 class="year">{{ r.year }}</h2>
</div>

{% for group in m.search[{query publication_year=r.year|append:"" cat='project' sort="-publication_start"}]|chunk:3 %}
<div class="grid_9 alpha omega">

    {% for id in group %}
    {% catinclude "inc/listitem.tpl" id alpha=forloop.first omega=forloop.last %}
    {% endfor %}
    
</div>
{% endfor %}
{% endfor %}

{% endcache %}

{% endblock %}
