{% extends "base.tpl" %}

{% block page_class %}home{% endblock %}

{% block content_area %}

    <h1>{{ m.config.site.title.value }}&nbsp;<span class="star-big">&#9733;</span></h1>

<p class="summary">
    {# {{ ["Howdy!","Hi!", "Hi There!", "Welcome!"]|random }} 
    {{ m.rsc[id].summary }} #}
    Understandable interfaces / Creative solutions / Rapid development
</p>

<div class="home-blocks">
    <!-- 3 blocks -->
    <div class="row">
        <div class="col-sm-4">
            {% catinclude "inc/teaseritem.tpl" 'page_projects' %}
        </div>
        <div class="col-sm-4">
            {% catinclude "inc/teaseritem.tpl" 'page_favorites' %}
        </div>
        <div class="col-sm-4">
            {% catinclude "inc/teaseritem.tpl" 'page_contact' alpha %}
        </div>
    </div>
    
</div>

{% endblock %}

{% block sidebar_menu %}
{% endblock %}
