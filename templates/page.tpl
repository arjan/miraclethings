{% extends "base.tpl" %}


{% block content %}

{% block chapeau %}
{% endblock %}

<h1>{{ m.rsc[id].title }}</h1>

<p class="summary">
    {{ m.rsc[id].summary }}
</p>

{% block content_body %}
<div class="body">
    {{ m.rsc[id].body|show_media }}
</div>
{% endblock %}


{% block content_meta %}
{% endblock %}

{% endblock %}
