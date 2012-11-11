{% extends "page.collection.tpl" %}

{% block content_body %}
<div class="body clearfix">
    {{ m.rsc[id].body|show_media }}
</div>

{% cache 7200 vary=id %}

{% with m.search[{query hasobject=[id, 'subject']}] as r %}

{% if r %}
<h3>Projects and articles related to {{ id.title }}:</h3>

{% for group in r|chunk:3 %}
<div class="grid_9 alpha omega">

    {% for id in group %}
    {% catinclude "inc/listitem.tpl" id alpha=forloop.first omega=forloop.last %}
    {% endfor %}

</div>
{% endfor %}

{% endif %}
{% endwith %}

{% endcache %}

{% endblock %}
