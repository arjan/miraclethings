{% extends "page.tpl" %}

{% block topimage %}
{% endblock %}

{% block content_body %}

{% for group in m.rsc[id].o.haspart|chunk:3 %}
<div class="grid_9 alpha omega">

    {% for id in group %}
    {% catinclude "inc/listitem.tpl" id alpha=forloop.first omega=forloop.last %}
    {% endfor %}

</div>
{% endfor %}

{% endblock %}
