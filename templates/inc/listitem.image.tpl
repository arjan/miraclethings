<div class="listitem grid_3 {% if alpha %}alpha{% endif %} {% if omega %}omega{% endif %}">
    <h3>
        {% if link %}
        <a href="{{ m.rsc[link].page_url }}" class="do_imageSwap" data-imageswap="src: '{% image_url m.rsc[id].depiction width=200 height=126 crop %}'">
            {% image id width=200 height=126 crop title=m.rsc[id].title grey %}
        {% else %}
        <a href="{% image_url id width=680 height=680 %}" class="do_inlineLightbox" data-inlineLightbox="parent: '{{ lbParent|default:".body-media-block"}}'" id="image{{ id }}">
            {% image id width=200 height=126 crop title=m.rsc[id].title grey %}
        {% endif %}
        </a>
    </h3>
</div>
