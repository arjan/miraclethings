{% extends "base.tpl" %}


{% block content %}

{% block chapeau %}
{% endblock %}

<h1>{{ m.rsc[id].title }}</h1>

<p class="summary">
    {{ m.rsc[id].summary }}
</p>

{% with m.rsc[id].media|without_embedded_media:id|first as media_id %} 
{% if media_id %}
{% include "_body_media.tpl" id=media_id align="block" width=440 %}
{% endif %}
{% endwith %}

{% block content_body %}
<div class="body clearfix">
    {{ m.rsc[id].body|show_media }}
</div>
{% endblock %}


{% block content_meta %}
{% endblock %}

{% with m.rsc[id].media|without_embedded_media:id|tail as rest %}
{% if rest %}
<h3>{_ More images _}</h3>
<div class="body-media-block clearfix">
    <div class="gallery">
        {% for group in rest|chunk:3 %} 
        <div class="gallery-group {% if forloop.last %}gallery-group-last{% endif %}">
            {% for id in group %}
            {% catinclude "inc/listitem.tpl" id alpha=forloop.first omega=forloop.last %}
            {% endfor %}
        </div>
        {% endfor %}
    </div>    
</div>
{% endif %}
{% endwith %}

{% endblock %}
