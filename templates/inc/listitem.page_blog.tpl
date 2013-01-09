{% cache 3600 %}
{% with m.search[{query cat='article' sort="-publication_start" pagelen=1}]|first as r %}
{% include "inc/listitem.tpl" medium=r.o.depiction[1] %}
{% endwith %}
{% endcache %}
