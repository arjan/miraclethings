<div class="listitem grid_3 {% if alpha %}alpha{% endif %} {% if omega %}omega{% endif %}">
    <h3>
        {% if link %}
        <a href="{{ m.rsc[link].page_url }}">
        {% else %}
        <a href="{% image_url id upscale width=680 %}" class="do_inlineLightbox" data-inlineLightbox="parent: '{{ lbParent|default:".body-media-block"}}'" id="image{{ id }}">
        {% endif %}
            {% image id width=200 height=126 crop title=m.rsc[id].title grey %}
        </a>
    </h3>
</div>
