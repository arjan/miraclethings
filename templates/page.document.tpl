{% extends "page.tpl" %}


{% block summary %}
<p class="summary">
    {{ m.rsc[id].summary }}
</p>

<p>
    <a href="{% url media_attachment star=m.rsc[id].medium.filename %}">Download document &raquo;</a>
</p>
{% endblock %}

