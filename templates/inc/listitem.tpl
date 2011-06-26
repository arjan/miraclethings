<div class="listitem do_imageSwap grid_{{ grid|default:3 }} {% if alpha %}alpha{% endif %} {% if omega %}omega{% endif %}"
     {% if m.rsc[id].depiction %}style="background-image: url({% image_url m.rsc[id].depiction width=220 height=140 crop grey %})"{% endif %}
     data-imageswap="src: '{% image_url m.rsc[id].depiction width=220 height=140 crop %}', mode: 'background'"
>
    <h3>
        <a href="{{ m.rsc[id].page_url }}" title="{{ m.rsc[id].summary }}">
            {# <abbr>this is a tweet blablabla... @mediamatic #fdsfsd</abbr> #}
            <span>{{ m.rsc[id].short_title|default:m.rsc[id].title }}</span>
        </a>
    </h3>
</div>
