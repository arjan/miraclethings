<p class="grid_9 alpha omega detailpaging clearfix">
    {% with m.search[{previous id=id cat=cat pagelen=1}]|first as p %}
    {% if p %}
    <a class="prev" href="{{ m.rsc[p].page_url }}" title="{{ m.rsc[p].title }}">&laquo; Previous {{ m.rsc[cat].title|lower }}</a>
    {% endif %}
    {% endwith %}

    {% with m.search[{next id=id cat=cat pagelen=1}]|first as p %}
    {% if p %}
    <a class="next" href="{{ m.rsc[p].page_url }}" title="{{ m.rsc[p].title }}">Next {{ m.rsc[cat].title|lower }} &raquo;</a>
    {% endif %}
    {% endwith %}
</p>
