{% for group in m.rsc[id].o.depiction|chunk:3 %}
{% for id in group %}
{% catinclude "inc/listitem.tpl" id alpha=forloop.first omega=forloop.last %}
{% endfor %}
{% endfor %}
