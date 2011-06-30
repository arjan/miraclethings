{% extends "page.tpl" %}

{% block pagetitle %}
<h1>
    {% if q.month or q.year %}
    {_ Archives for _}
    {% if q.month %}
    {{ q.month|monthname|escape }},    
    {% endif %}
    {{ q.year|escape }}
    {% else %}
    {{ m.rsc[id].title }}
    {% endif %}
</h1>
{% endblock %}

{% block summary %}
{# No summary on blog page. #}
{% endblock %}

{% block content_body %}
{% with m.search.paged[{query publication_year=q.year publication_month=q.month sort="-publication_start" cat='article' page=q.page pagelen=8}] as result %}
{% for id in result %}
<div class="grid_9 alpha omega blogentry">

    {# blog with image #}
    {% with m.rsc[id].o.depiction[1]|default:m.rsc[id].o.subject[1].o.depiction[1] as media_id %}
    {% catinclude "inc/listitem.tpl" media_id alpha lbParent=".blogentry" link=id %}
    <div class="grid_6 omega">
        <h2><a href="{{ m.rsc[id].page_url }}">{{ m.rsc[id].short_title|default:m.rsc[id].title }}</a></h2>
        <p class="meta">{_ Posted on _} {{ m.rsc[id].publication_start|date:"j F Y" }}</p>
        <p>{{ m.rsc[id].summary|truncate:180 }} <a href="{{ m.rsc[id].page_url }}">{_ Read more _} &raquo;</a></p>
    </div>
    {% endwith %}

</div>
{% endfor %}
<div class="grid_9 alpha omega pager">
    {% pager result=result dispatch=zotonic_dispatch id=id year=q.year month=q.month %}
</div>
{% endwith %}
{% endblock %}


{% block sidebar %}
{% inherit %}
{% include "inc/sidebar_blog.tpl" %}
{% endblock %}
