{% extends "base.tpl" %}

{% block content %}

<h1>MiracleThings <span>&#x272D;</span></h1>

<p class="summary">
    We develop interactive things which communicate through innovative, human-understandable interfaces.
</p>

<!-- 3 blocks -->
<div class="container_12">
    {% include "inc/listitem.tpl" alpha %}
    {% include "inc/listitem.tpl" %}
    {% include "inc/listitem.tpl" omega %}
</div>

<!-- 3 blocks -->
<div class="container_12">
    {% include "inc/listitem.tpl" alpha %}
    {% include "inc/listitem.tpl" %}
    {% include "inc/listitem.tpl" omega %}
</div>

{% endblock %}

{% block sidebar %}
{% endblock %}
