{% with m.rsc[predicate] as pid %}
    {% if m.rsc[id].o[predicate] %}
        <div class="project-info">
            <h4>{{ m.rsc[predicate].title }}</h4>
            <ul class="list-unstyled">
                {% for id in m.rsc[id].o[predicate] %}
                    <li>
                        <a href="{% if m.rsc[id].is_a.document %}{% url media_attachment star=m.rsc[id].medium.filename %}{% else %}{{ m.rsc[id].website|default:m.rsc[id].page_url }}{% endif %}">{{ m.rsc[id].short_title|default:m.rsc[id].title }}</a>
                    </li>
                {% endfor %}
            </ul>
        </div>
    {% endif %}
{% endwith %}
