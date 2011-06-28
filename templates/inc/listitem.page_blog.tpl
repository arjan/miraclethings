{% cache 3600 %}
{% with m.search[{query cat='article' sort="-publication_start" pagelen=1}] as r %}
{% include "inc/listitem.tpl" medium=m.rsc[r[1]].depiction %}
{% endwith %}
{% endcache %}
