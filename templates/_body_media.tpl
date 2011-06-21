{% ifequal align "block" %}
<div class="grid_8 alpha omega body-media">
	{% ifequal m.rsc[id].medium.mime "text/html-video-embed" %}
		<div class="video">
			{% media m.rsc[id].medium %}
		</div>
	{% else %}
		<div class="image">
			{% media m.rsc[id].medium width=size.width|default:620 height=size.height crop=crop class=align link=link alt=m.rsc[id].title %}
			{% if m.rsc[id].summary %}<p class="image-caption">{{ m.rsc[id].summary }}</p>{% endif %}
		</div>
	{% endifequal %}
</div>
{% else %}
	{% media m.rsc[id].medium width=size.width height=size.height crop=crop class=align link=link alt=m.rsc[id].title %}
{% endifequal %}
