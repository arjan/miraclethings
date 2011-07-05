{% extends "base.tpl" %}

{% block content %}

<h1>{{ m.config.site.title.value }} <span class="star-big"></span></h1>

<p class="summary">
    {{ ["Howdy!","Hi!", "Hi There!", "Welcome!"]|random }} 
    {{ m.rsc[id].summary }}
</p>

<div class="home-blocks">
    <!-- 3 blocks -->
    {% catinclude "inc/listitem.tpl" 'page_projects' alpha %}
    {% catinclude "inc/listitem.tpl" 'page_blog' %}
    {% catinclude "inc/listitem.tpl" 'page_favorites' omega %}

    {% catinclude "inc/listitem.tpl" 'page_contact' alpha %}
    {% catinclude "inc/listitem.tpl" 'page_about' omega %}
</div>

{% endblock %}

{% block sidebar_menu %}
{% endblock %}
