{% extends "page.tpl" %}

{% block sidebar %}
    <h2>{{ m.rsc[id].title }}</h2>
    <div class="project-info">
        {% if m.rsc[id].date_end %}
            <h4>{_ Project duration _}</h4>
            <ul class="list-unstyled">
                <li>{{ m.rsc[id].publication_start|date:"F Y" }} &mdash; {{ m.rsc[id].date_end|date:"F Y" }}</li>
            </ul>
        {% else %}
            <h4>{_ Realized in _}</h4>
            <ul class="list-unstyled">
                <li>{{ m.rsc[id].publication_start|date:"F Y" }}</li>
            </ul>
        {% endif %}
    </div>

    {% include "inc/info-meta-edges.tpl" predicate='has_client' alpha omega %}
    {% include "inc/info-meta-edges.tpl" predicate='has_link' alpha omega %}

    {% include "inc/info-meta-edges.tpl" predicate='has_license' alpha omega %}

    {% include "inc/info-meta-edges.tpl" predicate='hasdocument' alpha omega %}

    {% include "inc/info-meta-edges.tpl" predicate='has_collaborator' alpha omega %}

{% endblock %}


{% block comment_area %}
    {% include "_socialmedia.tpl" id=id %}
    {% include "_prevnext.tpl" cat='project' id=id %}
    {% include "_comments.tpl" %}
{% endblock %}
