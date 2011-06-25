{% extends "base.tpl" %}

{% block title %}{{ m.rsc[id].title }}{% endblock %}

{% block content %}

{% block chapeau %}
{% endblock %}

{% block pagetitle %}
<h1>{{ m.rsc[id].title }}</h1>
{% endblock %}

<p class="summary">
    {{ m.rsc[id].summary }}
</p>

{% block topimage %}
{# Media #}
{% with m.rsc[id].media|without_embedded_media:id|first as media_id %} 
{% if media_id %}
{% include "_body_media.tpl" id=media_id align="block" width=440 %}
{% endif %}
{% endwith %}
{% endblock %}

{% block content_body %}
<div class="body clearfix">
    {{ m.rsc[id].body|show_media }}
</div>
{% endblock %}


{% block content_meta %}
<div class="clearfix">
    {% include "inc/info-meta-edges.tpl" predicate='subject' grid=9 alpha omega %}
</div>
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
