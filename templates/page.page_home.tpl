{% extends "base.tpl" %}

{% block content_area %}

<h1>{{ m.config.site.title.value }} <span class="star-big"></span></h1>

<p class="summary">
    {{ ["Howdy!","Hi!", "Hi There!", "Welcome!"]|random }} 
    {{ m.rsc[id].summary }}
</p>

<div class="home-blocks">
    <!-- 3 blocks -->
    <div class="row">
        <div class="col-sm-4">
            {% catinclude "inc/listitem.tpl" 'page_projects' %}
        </div>
        <div class="col-sm-4">
            {% catinclude "inc/listitem.tpl" 'page_blog' %}
        </div>
        <div class="col-sm-4">
            {% catinclude "inc/listitem.tpl" 'page_favorites' %}
        </div>
    </div>
    
    <div class="row">
        <div class="col-sm-4">
            {% catinclude "inc/listitem.tpl" 'page_contact' alpha %}
        </div>
        <div class="col-sm-4">
            {% catinclude "inc/listitem.tpl" 'page_about' omega %}
        </div>
    </div>
    
</div>

{% endblock %}

{% block sidebar_menu %}
{% endblock %}
