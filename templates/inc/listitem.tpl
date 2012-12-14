{% with medium|default:m.rsc[id].depiction|default:id.medium as medium %}
{% with link|default:id as link_id %}
<div class="listitem do_imageSwap grid_{{ grid|default:3 }} {% if alpha %}alpha{% endif %} {% if omega %}omega{% endif %}"
     {% if medium %}style="background-image: url({% image_url medium width=220 height=140 crop grey %})"{% endif %}
     data-imageswap="src: '{% image_url medium width=220 height=140 crop %}', mode: 'background'"
>
    <h3>
        <a href="{{ m.rsc[link_id].page_url }}" title="{{ m.rsc[link_id].summary }}">
            <span>{{ m.rsc[link_id].short_title|default:m.rsc[link_id].title }}</span>
        </a>
    </h3>
</div>
{% endwith %}
{% endwith %}
