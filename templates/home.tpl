{% extends "base.tpl" %}

{% block content %}

<h1>{{ m.config.site.title.value }} <span>&#x2B51;</span></h1>

<p class="summary">
    I develop interactive things which communicate through innovative, human-understandable interfaces.
</p>

<div class="blocks">
    <!-- 3 blocks -->
    <div class="container_12">
        {% catinclude "inc/listitem.tpl" 'page_projects' alpha %}
        {% catinclude "inc/listitem.tpl" 'page_blog' %}
        {% catinclude "inc/listitem.tpl" 'page_favorites' %}
        {% catinclude "inc/listitem.tpl" 'page_about' omega %}
    </div>
</div>

{% endblock %}

{% block sidebar_menu %}
{% endblock %}
