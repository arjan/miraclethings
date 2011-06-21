<!DOCTYPE html>
<html lang="en">
    <head>
        <title>{% block title %}{% endblock %} &mdash; {{ m.config.site.title.value }}</title>
        <meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
        <meta name="author" content="Arjan Scherpenisse <arjan@scherpenisse.net> &copy; 2011" />

        {% all include "_html_head.tpl" %}
        {% lib "css/960.css" "css/normalize.css" "css/base.css" %}
        {% block html_head_extra %}{% endblock %}

    </head>

    <body class="{% block page_class %}page{% endblock %}">
        <div class="container_12">
			{% block content_area %}
            <div class="grid_9 alpha">
                {% block content %}
                {% endblock %}
            </div>

            <div class="grid_3 omega">
                {% block sidebar %}
                <div id="sidenav">
                    <h2>MiracleThings <span>&#x272D;</span></h2>
                    <ul id="navigation">
                        <li><a href="#">Projects</a></li>
                        <li><a href="#">Projects</a></li>
                        <li><a href="#">Projects</a></li>
                        <li><a href="#">Projects</a></li>
                        <li><a href="#">Projects</a></li>
                    </ul>
                </div>
                {% endblock %}
            </div>

            {% endblock %}{# content_area #}
        </div>

        <div class="container_12 footer">
            &copy; 2011 {{ m.config.site.title.value }}
        </div>

        {% include "_js_include_jquery.tpl" %}
        {% lib 
        "js/apps/zotonic-1.0.js" 
        "js/apps/z.widgetmanager.js" 
        "js/z.superfish.js" 
        %}
        {% block _js_include_extra %}{% endblock %}

        <script type="text/javascript">
            $(function() { $.widgetManager(); });
        </script>

        {% stream %}
        {% script %}

        {% all include "_html_body.tpl" %}
    </body>
</html>
