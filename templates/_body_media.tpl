{% ifequal align "block" %}
<div class="body-media-block clearfix">
	{% ifequal m.rsc[id].medium.mime "text/html-video-embed" %}
		<div class="video">
			{% media m.rsc[id].medium %}
		</div>
	{% else %}
		<div class="{{ m.rsc[id].category.name }}">
			{% media id width=size.width height=size.height crop=crop class=align link=link alt=m.rsc[id].title %}
			{% if m.rsc[id].summary %}<p class="image-caption">{{ m.rsc[id].summary }}</p>{% endif %}
		</div>
	{% endifequal %}
</div>
{% else %}
	{% media m.rsc[id].medium width=size.width height=size.height crop=crop class=align link=link alt=m.rsc[id].title %}
{% endifequal %}
