{% for group in m.rsc[id].o.depiction|chunk:3 %}
<div class="gallery-group {% if forloop.last %}gallery-group-last{% endif %}">
    {% for id in group %}
    {% catinclude "inc/listitem.tpl" id alpha=forloop.first omega=forloop.last %}
    {% endfor %}
</div>
{% endfor %}
