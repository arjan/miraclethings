<div class="listitem grid_3 {% if alpha %}alpha{% endif %} {% if omega %}omega{% endif %}">
    <h3>
        {% if link %}
        <a href="{{ m.rsc[link].page_url }}" class="do_imageSwap" data-imageswap="src: '{% image_url m.rsc[id].depiction quality=90 width=200 height=126 crop %}'">
            {% image id quality=90 width=200 height=126 crop title=m.rsc[id].title grey %}
        {% else %}
        <a href="{% image_url id quality=90 width=680 height=680 %}" rel="shadowbox[gallery]" title="{{ id.title }}" id="image{{ id }}">
            {% image id quality=90 width=200 height=126 crop title=m.rsc[id].title grey %}
        {% endif %}
        </a>
    </h3>
</div>
