<div class="row footer">
    <div class="col-sm-4">
        &copy; 2011-2017 {{ m.config.site.title.value }}
    </div>
    <div class="col-sm-4">
        <i class="icon-phone"></i> <a href="tel:+31641322599">06 41 322 599</a><br />
        <i class="icon-envelope"></i> <a href="mailto:arjan@miraclethings.nl">arjan@miraclethings.nl</a><br/>
        <i class="icon-twitter"></i> <a href="http://twitter.com/acscherp">@acscherp</a><br />
        <i class="icon-github"></i> <a href="http://github.com/arjan">github.com/arjan</a><br />
    </div>
    <div class="col-sm-4 right">
        <a href="https://openkvk.nl/kvk/34381637/0000/miraclethings">KVK nr. 34381637</a> <br />
        <a href="{% url media_attachment star=m.rsc.terms_conditions.medium.filename %}">{{ m.rsc.terms_conditions.title }}</a>
        <a href="{% url media_attachment star=m.rsc.terms_conditions.medium_en.filename %}">(en)</a><br />
    </div>
</div>
