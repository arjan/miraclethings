{% extends "page.tpl" %}

{% block chapeau %}
<p class="chapeau">{_ Posted on _} {{ m.rsc[id].publication_start|date:"j F Y" }}</p>
{% endblock %}


{% block comment_area %}
{% include "_prevnext.tpl" cat='article' id=id %}
{% include "_comments.tpl" %}
{% endblock %}
