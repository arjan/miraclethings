{% with medium|default:m.rsc[id].depiction|default:id.medium as medium %}
    {% with link|default:id as link_id %}
        <a class="listitem" href="{{ m.rsc[link_id].page_url }}" title="{{ m.rsc[link_id].summary }}">
            <div class="image" {% if medium %}style="background-image: url({% image_url medium quality=90 width=440 height=280 crop %})"{% endif %}>
            </div>
            <h3>
                <span>{{ m.rsc[link_id].short_title|default:m.rsc[link_id].title }}</span>
            </h3>
        </a>
    {% endwith %}
{% endwith %}
