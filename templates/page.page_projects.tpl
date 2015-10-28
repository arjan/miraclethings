{% extends "page.tpl" %}

{% block page_class %}projects with-menu{% endblock %}

{% block content_area %}

    <div>
        {% block pagetitle %}
            <h1>{{ m.rsc[id].title }}</h1>
        {% endblock %}

        {% block summary %}
            <p class="summary">
                {{ m.rsc[id].summary }}
            </p>
        {% endblock %}
    </div>    

    {% cache 7200 %}

        {% for r in m.search[{archive_year cat='project'}] %}
            <div class="row">
                <h2 class="col-md-12 year">{{ r.year }}</h2>
            </div>

            {% for group in m.search[{query publication_year=r.year|append:"" cat='project' sort="-publication_start"}]|chunk:4 %}
                <div class="row">

                    {% for id in group %}
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                            {% catinclude "inc/listitem.tpl" id alpha=forloop.first omega=forloop.last %}
                        </div>
                    {% endfor %}
                    
                </div>
            {% endfor %}
        {% endfor %}

    {% endcache %}

{% endblock %}
