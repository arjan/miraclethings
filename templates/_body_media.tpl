{% ifequal align "block" %}
    <div class="body-media-block clearfix">
	{% ifequal m.rsc[id].medium.mime "text/html-video-embed" %}
		<div class="video">
			{% media m.rsc[id].medium %}
		</div>
	{% else %}

	{% if m.rsc[id].category.name == "image" %}
        <a href="{% image_url id quality=90 width=680 height=680 %}" class="image" rel="shadowbox[gallery]" title="{{ id.title }}" id="bodyimg{{ id }}">
        {% media id quality=90 width=size.width|default:width height=size.height|default:height crop=crop class=align link=link  title=m.rsc[id].title %}
        {% if m.rsc[id].summary %}<span class="caption">{{ m.rsc[id].summary }}</p>{% endif %}
    </a>
    {% else %}
		<div class="{{ m.rsc[id].category.name }}">
            {% media id quality=90 width=size.width height=size.height crop=crop class=align link=link alt=m.rsc[id].title sizename=sizename %}
            {% if m.rsc[id].summary %}<span class="caption">{{ m.rsc[id].summary }}</p>{% endif %}
		</div>
    {% endif %}
	{% endifequal %}
</div>
{% else %}
	{% media id quality=90 width=size.width height=size.height crop=crop class=align link=link alt=m.rsc[id].title %}
{% endifequal %}
