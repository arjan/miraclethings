{% extends "base.tpl" %}


{% block content %}
<h1>Projecten</h1>

<p class="summary">
    Deze projecten zijn door mij gerealiseerd in de afgelopen jaren.
</p>

<h2 class="year">2011</h2>

<div class="grid_9 alpha omega">
    {% include "inc/listitem.tpl" alpha %}
    {% include "inc/listitem.tpl" %}
    {% include "inc/listitem.tpl" omega %}
</div>


<h2 class="year">2010</h2>

<div class="grid_9 alpha omega">
    {% include "inc/listitem.tpl" alpha %}
    {% include "inc/listitem.tpl" %}
    {% include "inc/listitem.tpl" omega %}
</div>
<div class="grid_9 alpha omega">
    {% include "inc/listitem.tpl" alpha %}
    {% include "inc/listitem.tpl" %}
    {% include "inc/listitem.tpl" omega %}
</div>

{% endblock %}
