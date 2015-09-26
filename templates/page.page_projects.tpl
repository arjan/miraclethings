{% extends "page.tpl" %}

{% block content_body %}

    {% cache 7200 %}

        {% for r in m.search[{archive_year cat='project'}] %}
            <div class="row">
                <h2 class="col-md-12 year">{{ r.year }}</h2>
            </div>

            {% for group in m.search[{query publication_year=r.year|append:"" cat='project' sort="-publication_start"}]|chunk:3 %}
                <div class="row">

                    {% for id in group %}
                        <div class="col-sm-4 col-xs-12">
                            {% catinclude "inc/listitem.tpl" id alpha=forloop.first omega=forloop.last %}
                        </div>
                    {% endfor %}
                    
                </div>
            {% endfor %}
        {% endfor %}

    {% endcache %}

{% endblock %}
