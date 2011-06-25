{% extends "page.tpl" %}


{% block chapeau %}
<p class="chapeau">
    Project, {{ m.rsc[id].publication_start|date:"F Y" }}
</p>
{% endblock %}

{% block sidebar %}
{% inherit %}
<h2>{{ m.rsc[id].title }}</h2>
    <div class="project-info grid_3 alpha omega">
        <h4>{_ Realized in _}</h4>
        <div>
            {{ m.rsc[id].publication_start|date:"F Y" }}
        </div>
    </div>

    {% include "inc/info-meta-edges.tpl" predicate='has_client' alpha omega %}
    {% include "inc/info-meta-edges.tpl" predicate='has_link' alpha omega %}

    {% include "inc/info-meta-edges.tpl" predicate='has_license' alpha omega %}

{% endblock %}
