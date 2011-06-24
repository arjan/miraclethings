{% extends "page.tpl" %}

{% block content_body %}

{% for r in m.search[{archive_year cat='project'}] %}
<div>
    <h2 class="year">{{ r.year }}</h2>

    {% for group in m.search[{query publication_year=r.year|append:"" cat='project'}]|chunk:3 %}
    <div class="grid_9 alpha omega">

        {% for id in group %}
        {% catinclude "inc/listitem.tpl" id alpha=forloop.first omega=forloop.last %}
        {% endfor %}

    </div>
    {% endfor %}

</div>
{% endfor %}

{% endblock %}
