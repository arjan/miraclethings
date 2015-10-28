<!DOCTYPE html>
<html lang="en"
    xmlns:og="http://ogp.me/ns#"
>
    <head>
        <title>{% block title %}{% endblock %}{% block titlesep %}{% endblock %}{{ m.config.site.title.value }} &#9733;</title>
        <meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
        <meta name="author" content="Arjan Scherpenisse <arjan@scherpenisse.net> &copy; 2011" />

        <meta property="og:title" content="{% block title %}{{ m.site.title }}{% endblock %}"/>
        {% with m.rsc[id].media|first as first_media %}{% if first_media %}
                <meta property="og:image" content="http://{{ m.site.hostname }}{% image_url first_media width=500 %}"/>
            {% endif %}{% endwith %}
        <meta property="og:site_name" content="{{ m.site.title }}"/>
        {% if id and m.rsc[id].summary %}<meta property="og:description" content="{{ m.rsc[id].summary|escape }}"/>{% endif %}

        <link href='https://fonts.googleapis.com/css?family=Roboto:400,300,100' rel='stylesheet' type='text/css' />
        
        {% include "_js_include_jquery.tpl" %}

        {% all include "_html_head.tpl" %}
        {% lib
            "font-awesome/css/font-awesome.min.css"
            "css/vendor.css"
            "css/site.css"
        %}
        
        {% block html_head_extra %}{% endblock %}
        <link rel="shortcut icon" href="/lib/images/favicon.ico" type="image/x-icon" />

    </head>

    <body class="{% block page_class %}page{% endblock %}">
        {% include "_navbar.tpl" %}
        <div class="container">
			{% block content_area %}
                <div class="row">
                    <div class="col-md-9">
                        {% block content %}
                        {% endblock %}
                    </div>

                    <div class="col-md-3 sidebar">
                        <div class="sidebar-menu hidden-sm hidden-xs">
                            {% block sidebar_menu %}
                                <h2><a href="/">{{ m.config.site.title.value }} <span class="star-small"></span></a></h2>
                                {% menu id=id|highlightmenu %}
                            {% endblock %}
                        </div>
                        
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
            
            {% include "_footer.tpl" %}
        </div>
        
        {% lib
            "js/modules/ubf.js"
            "js/apps/zotonic-1.0.js"
            "js/apps/z.widgetmanager.js"
            "shadowbox/shadowbox.js"
            "js/z.imageSwap.js"

            "bootstrap/js/bootstrap.min.js"
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
