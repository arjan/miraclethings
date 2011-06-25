<h2>{_ Archive _}</h2>
<ul class="simple-list">
    {% for year, months in m.search[{archive_year_month cat='article'}] %}
    <li><a class="caption" href="/blog?year={{ year }}">{{ year }}</a>
        <ul>
            {% for row in months %}
            <li><a href="/blog?year={{ year }}&month={{ row.month }}">{{ row.month_as_date|date:"F" }}</a> ({{ row.count }}){% if not forloop.last %},{% else %}.{% endif %}</li>
            {% endfor %}
        </ul>
    </li>
    {% endfor %}
</ul>

<h2>{_ Keywords _}</h2>
<ul class="inline-list clearfix">
    {% for id, count in m.search[{keyword_cloud cat='article'}] %}
    <li><a href="{{ m.rsc[id].page_url }}">{{ m.rsc[id].title }}</a> ({{ count }}){% if not forloop.last %},{% else %}.{% endif %}</li>
    {% endfor %}
</ul>
