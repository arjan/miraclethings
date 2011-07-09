<!DOCTYPE html>
<html lang="en">
    <head>
        <title>{% block title %}{% endblock %}{{ m.config.site.title.value }} *</title>
        <meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
        <meta name="author" content="Arjan Scherpenisse <arjan@scherpenisse.net> &copy; 2011" />

        {% include "_js_include_jquery.tpl" %}

        {% all include "_html_head.tpl" %}
        {% lib "css/960.css" "css/normalize.css" "css/base.css" "css/menu.css" %}
        {% block html_head_extra %}{% endblock %}
        <link rel="shortcut icon" href="/lib/images/favicon.ico" type="image/x-icon" />

    </head>

    <body class="{% block page_class %}page{% endblock %}">
        <div class="container_12">
			{% block content_area %}
            <div class="grid_9 alpha block-content">
                {% block content %}
                {% endblock %}
            </div>

            <div class="grid_3 omega sidebar">
                {% block sidebar_menu %}
                <h2><a href="/">{{ m.config.site.title.value }} <span class="star-small"></span></a></h2>
                {% menu id=id|highlightmenu %}
                {% endblock %}

                {% block sidebar %}
                {% endblock %}

                {% block sidebar_end %}
                {% with m.rsc[id].o.relation as r %}
                {% if r %}
                <div class="grid_3 alpha omega">
                    <h2>{% if r|length == 1 %}{_ See also _}{% else %}{_ Related pages _}{% endif %}</h2>
                </div>
                {% for id in r %}
                {% catinclude "inc/listitem.tpl" id alpha omega %}
                {% endfor %}
                {% endif %}
                {% endwith %}
                {% endblock %}

                {% include "_edit_button.tpl" %}
            </div>

            {% endblock %}{# content_area #}
        </div>

        <div class="container_12 footer">
            &copy; 2011 {{ m.config.site.title.value }}
            &mdash;
            <a href="mailto:contact@miraclethings.nl">contact@miraclethings.nl</a>
        </div>

        {% lib
        "js/apps/zotonic-1.0.js"
        "js/apps/z.widgetmanager.js"
        "js/z.inlineLightbox.js"
        "js/z.imageSwap.js"

        "js/modules/livevalidation-1.3.js"
        "js/modules/z.inputoverlay.js"
        "js/modules/jquery.loadmask.js"

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
