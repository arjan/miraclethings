{% extends "page.tpl" %}

{% block topimage %}
{% endblock %}

{% block content_body %}

    <div class="row">
        {% for id in m.rsc[id].o.haspart %}
            
            <div class="col-md-4 col-sm-6">
                {% catinclude "inc/listitem.tpl" id alpha=forloop.first omega=forloop.last %}
            </div>

        {% endfor %}
    </div>

{% endblock %}
