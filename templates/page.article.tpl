{% extends "page.tpl" %}

{% block chapeau %}
<p class="chapeau">{_ Posted on _} {{ m.rsc[id].publication_start|date:"j F Y" }}</p>
{% endblock %}

{% block sidebar %}
{% inherit %}

{% with m.rsc[id].o.relation as r %}
{% if r %}
<h2>{% if r|length < 2 %}{_ Related project _}{% else %}{_ Related projects _}{% endif %}</h2>
{% for id in r %}
{% catinclude "inc/listitem.tpl" id alpha omega %}
{% endfor %}
{% endif %}
{% endwith %}

{% endblock %}
