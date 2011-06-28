{% with medium|default:m.rsc[id].depiction as medium %}
<div class="listitem do_imageSwap grid_{{ grid|default:3 }} {% if alpha %}alpha{% endif %} {% if omega %}omega{% endif %}"
     {% if medium %}style="background-image: url({% image_url medium width=220 height=140 crop grey %})"{% endif %}
     data-imageswap="src: '{% image_url medium width=220 height=140 crop %}', mode: 'background'"
>
    <h3>
        <a href="{{ m.rsc[id].page_url }}" title="{{ m.rsc[id].summary }}">
            <span>{{ m.rsc[id].short_title|default:m.rsc[id].title }}</span>
        </a>
    </h3>
</div>
{% endwith %}
