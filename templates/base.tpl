<!DOCTYPE html>
<html lang="en"
    xmlns:og="http://ogp.me/ns#"
>
    <head>
        <title>{% block title %}{% endblock %}{% block titlesep %}{% endblock %}{{ m.config.site.title.value }} *</title>
        <meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
        <meta name="author" content="Arjan Scherpenisse <arjan@scherpenisse.net> &copy; 2011" />

        <meta property="og:title" content="{% block title %}{{ m.site.title }}{% endblock %}"/>
        {% with m.rsc[id].media|first as first_media %}{% if first_media %}
                <meta property="og:image" content="http://{{ m.site.hostname }}{% image_url first_media width=500 %}"/>
            {% endif %}{% endwith %}
        <meta property="og:site_name" content="{{ m.site.title }}"/>
        {% if id and m.rsc[id].summary %}<meta property="og:description" content="{{ m.rsc[id].summary|escape }}"/>{% endif %}

        <link href='https://fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css' />
        
        {% include "_js_include_jquery.tpl" %}

        {% all include "_html_head.tpl" %}
        {% lib "css/vendor.css" "css/site.css" %}
        
        {% block html_head_extra %}{% endblock %}
        <link rel="shortcut icon" href="/lib/images/favicon.ico" type="image/x-icon" />

    </head>

    <body class="{% block page_class %}page{% endblock %}">
        <div class="container">
			{% block content_area %}
                <div class="row">
                    <div class="col-md-9">
                        {% block content %}
                        {% endblock %}
                    </div>

                    <div class="col-md-3 sidebar">
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
                                        <h2>
                                            {% if r|length == 1 %}
                                                {_ See also _}
                                            {% else %}
                                                {_ Related pages _}
                                            {% endif %}
                                        </h2>
                                    </div>
                                    {% for id in r %}
                                        {% catinclude "inc/listitem.tpl" id alpha omega %}
                                    {% endfor %}
                                {% endif %}
                            {% endwith %}
                        {% endblock %}
                        
                        {% include "_edit_button.tpl" %}
                    </div>
                </div>
            {% endblock %}{# content_area #}
            
            <div class="row">
                <div class="col-sm-12">
                    &copy; 2011-2015 {{ m.config.site.title.value }}
                    &mdash;
                    <a href="mailto:arjan@miraclethings.nl">arjan@miraclethings.nl</a>
                    {% if m.rsc.terms_conditions.id %}
                        &mdash;
                        <a href="{% url media_attachment star=m.rsc.terms_conditions.medium.filename %}">{{ m.rsc.terms_conditions.title }}</a>
                        {% if m.rsc.terms_conditions_en.id %}
                            <a href="{% url media_attachment star=m.rsc.terms_conditions_en.medium.filename %}">(en)</a>
                        {% endif %}
                    {% endif %}
                </div>
            </div>
        </div>
        
        {% lib
            "js/apps/zotonic-1.0.js"
            "js/apps/z.widgetmanager.js"
            "shadowbox/shadowbox.js"
            "js/z.imageSwap.js"

            "js/modules/livevalidation-1.3.js"
            "js/modules/z.inputoverlay.js"
            "js/modules/jquery.loadmask.js"

        %}
        {% block _js_include_extra %}{% endblock %}

        <script type="text/javascript">
            $(function() {
            $.widgetManager();
            Shadowbox.init({animateFade: false});
            });
        </script>

        {% script %}

        {% all include "_html_body.tpl" %}
    </body>
</html>
