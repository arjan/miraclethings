{% extends "base.tpl" %}


{% block content %}

{% block chapeau %}
<p class="chapeau">
</p>
{% endblock %}

<h1>{{ m.rsc[id].title }}</h1>

<p class="summary">
    {{ m.rsc[id].summary }}
</p>

{% block content_body %}
<div class="body">
    {{ m.rsc[id].body|show_media }}
</div>
{% endblock %}


{% block content_meta %}
<div class="grid_9 alpha omega">

    <div class="project-info grid_3 alpha">
        <h4>In opdracht voor</h4>
        <a href="#">Joods Historisch Museum</a>, <a href="#">Mediamatic Lab</a>
    </div>

    <div class="project-info grid_3">
        <h4>Meer informatie</h4>
        <a href="#">github</a>, <a href="#">API documentatie</a>
    </div>

    <div class="project-info grid_3 omega">
        <h4>Gerealiseerd op</h4>
        12 december 2009
    </div>
</div>

<div class="grid_9 alpha omega">
    <div class="project-info grid_3 alpha">
        <h4>Licentie</h4>
        <a href="#">MIT</a>
    </div>
    
    <div class="project-info grid_6 omega">
        <h4>Trefwoorden</h4>
        <a href="#">alpha</a>, <a href="#">alpha</a>, <a href="#">alpha</a>, <a href="#">alpha</a>, <a href="#">alpha</a>
    </div>
</div>
{% endblock %}

{% endblock %}
