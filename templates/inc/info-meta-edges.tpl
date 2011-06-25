{% with m.rsc[predicate] as pid %}
{% if m.rsc[id].o[predicate] %}
<div class="project-info grid_{{ grid|default:3 }}{% if alpha %} alpha{% endif %}{% if omega %} omega{% endif %}">
    <h4>{{ m.rsc[predicate].title }}</h4>
    <div>
        {% for id in m.rsc[id].o[predicate] %}
        <a href="{{ m.rsc[id].page_url }}">{{ m.rsc[id].title }}</a>{% if not forloop.last %},{% endif %}
        {% endfor %}
    </div>
</div>
{% endif %}
{% endwith %}
