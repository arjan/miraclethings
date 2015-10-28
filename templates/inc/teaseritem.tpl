{% with medium|default:m.rsc[id].depiction|default:id.medium as medium %}
    {% with link|default:id as link_id %}
        <div class="teaseritem">
            <h3>
                <a href="{{ m.rsc[link_id].page_url }}" title="{{ m.rsc[link_id].summary }}">
                    <span>{{ m.rsc[link_id].short_title|default:m.rsc[link_id].title }}</span>
                </a>
            </h3>
        </div>
    {% endwith %}
{% endwith %}
