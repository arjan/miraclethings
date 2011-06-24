<div class="listitem grid_3 {% if alpha %}alpha{% endif %} {% if omega %}omega{% endif %}">
    <h3>
        <a href="{% image_url id width=680 %}" class="do_inlineLightbox" data-inlineLightbox="parent: '.{{ lbParent|default:".body-media-block"}}'" id="image{{ id }}">
            {% image id width=200 height=126 crop title=m.rsc[id].title %}
        </a>
    </h3>
</div>
