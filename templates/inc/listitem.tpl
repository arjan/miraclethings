{% with medium|default:m.rsc[id].depiction|default:id.medium as medium %}
    {% with link|default:id as link_id %}
        <div class="listitem">
            <div class="image do_imageSwap" {% if medium %}style="background-image: url({% image_url medium quality=90 width=220 height=140 crop grey %})"{% endif %}
                data-imageswap="src: '{% image_url medium quality=90 width=220 height=140 crop %}', mode: 'background'">
            </div>
            <h3>
                <a href="{{ m.rsc[link_id].page_url }}" title="{{ m.rsc[link_id].summary }}">
                    <span>{{ m.rsc[link_id].short_title|default:m.rsc[link_id].title }}</span>
                </a>
            </h3>
        </div>
    {% endwith %}
{% endwith %}
