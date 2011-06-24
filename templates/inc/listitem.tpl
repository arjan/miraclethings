<div class="listitem grid_3 {% if alpha %}alpha{% endif %} {% if omega %}omega{% endif %}"
     {% if m.rsc[id].depiction %}style="background-image: url({% image_url m.rsc[id].depiction width=220 grey  %})"{% endif %}
>
    <h3>
        <a href="{{ m.rsc[id].page_url }}" title="{{ m.rsc[id].summary }}">
            {# <abbr>this is a tweet blablabla... @mediamatic #fdsfsd</abbr> #}
            <span>{{ m.rsc[id].short_title|default:m.rsc[id].title }}</span>
        </a>
    </h3>
</div>
