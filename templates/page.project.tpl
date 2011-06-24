{% extends "page.tpl" %}


{% block chapeau %}
<p class="chapeau">
    Project, {{ m.rsc[id].publication_start|date:"F Y" }}
</p>
{% endblock %}

{% block content_meta %}
<div class="grid_9 alpha omega">

    {% if m.rsc[id].o.has_client %}

    {% include "inc/info-meta-edges.tpl" predicate='has_client' alpha %}
    {% include "inc/info-meta-edges.tpl" predicate='has_link' %}

    {% else %}

    {% include "inc/info-meta-edges.tpl" predicate='has_link' alpha grid=6 %}

    {% endif %}

    <div class="project-info grid_3 omega">
        <h4>{_ Realized in _}</h4>
        {{ m.rsc[id].publication_start|date:"F Y" }}
    </div>
</div>

<div class="grid_9 alpha omega">

    {% include "inc/info-meta-edges.tpl" predicate='subject' grid=6 alpha %}
    {% include "inc/info-meta-edges.tpl" predicate='has_license' omega %}

</div>
{% endblock %}

