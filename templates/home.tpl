{% extends "base.tpl" %}

{% block content %}

<h1>{{ m.config.site.title.value }} <span>&#x2B51;</span></h1>

<p class="summary">
    We develop interactive things which communicate through innovative, human-understandable interfaces.
</p>

<div class="blocks">
    <!-- 3 blocks -->
    <div class="container_12">
        {% catinclude "inc/listitem.tpl" 'page_projects' alpha %}
        {% catinclude "inc/listitem.tpl" 'page_about' %}
        {% catinclude "inc/listitem.tpl" 'page_contact' omega %}
    </div>

    <!-- 3 blocks -->
    <div class="container_12">
        {% catinclude "inc/listitem.tpl" 'page_blog' alpha %}
        {% catinclude "inc/listitem.tpl" 327 omega lbParent=".blocks" %}
    </div>
</div>

{% endblock %}

{% block sidebar %}
{% endblock %}
