{% extends "base.tpl" %}

{% block title %}{{ m.rsc[id].title }}{% endblock %}
{% block titlesep %} &mdash; {% endblock %}

{% block content %}
    <div class="pagecontent">
        
        {% block topimage %}
            {# Media #}
            {% with m.rsc[id].media|without_embedded_media:id|first as media_id %} 
                {% if media_id %}
                    {% include "_body_media.tpl" id=media_id align="block" width=860 %}
                {% endif %}
            {% endwith %}
        {% endblock %}

        {% block chapeau %}
        {% endblock %}

        {% block pagetitle %}
            <h1>{{ m.rsc[id].title }}</h1>
        {% endblock %}

        {% block summary %}
            <p class="summary">
                {{ m.rsc[id].summary }}
            </p>
        {% endblock %}

        {% block content_body %}
            <div class="body clearfix">
                {{ m.rsc[id].body|show_media }}
            </div>
        {% endblock %}


        {% block content_meta %}
            <div class="clearfix">
                {% include "inc/info-meta-edges.tpl" predicate='subject' grid=9 alpha omega %}
            </div>
        {% endblock %}


        {% with m.rsc[id].media|without_embedded_media:id|tail as rest %}
            {% if rest %}
                <h3>{_ More images _}</h3>
                <div class="body-media-block clearfix">
                    <div class="row">
                        {% for group in rest|chunk:3 %} 
                            <div class="col-md-4">
                                {% for id in group %}
                                    {% catinclude "inc/listitem.tpl" id alpha=forloop.first omega=forloop.last %}
                                {% endfor %}
                            </div>
                        {% endfor %}
                    </div>    
                </div>
            {% endif %}
        {% endwith %}

        {% block comment_area %}
        {% endblock %}

    </div>
    
{% endblock %}

{% block sidebar %}
    {% inherit %}
    {% include "inc/info-meta-edges.tpl" predicate='has_link' alpha omega %}
    {% include "inc/info-meta-edges.tpl" predicate='hasdocument' alpha omega %}
    {% include "inc/info-meta-edges.tpl" predicate='has_license' alpha omega %}
{% endblock %}
