{% extends "page.tpl" %}

{% block chapeau %}
<p class="chapeau">{_ Posted on _} {{ m.rsc[id].publication_start|date:"j F Y" }}</p>
{% endblock %}


{% block comment_area %}

<p class="grid_9 alpha omega detailpaging clearfix">
    {% with m.search[{previous id=id cat='article' pagelen=1}]|first as p %}
    {% if p %}
    <a class="prev" href="{{ m.rsc[p].page_url }}" title="{{ m.rsc[p].title }}">&laquo; Previous post</a>
    {% endif %}
    {% endwith %}

    {% with m.search[{next id=id cat='article' pagelen=1}]|first as p %}
    {% if p %}
    <a class="next" href="{{ m.rsc[p].page_url }}" title="{{ m.rsc[p].title }}">Next post &raquo;</a>
    {% endif %}
    {% endwith %}
</p>

{% include "_comments.tpl" %}
{% endblock %}
