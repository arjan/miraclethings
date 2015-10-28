<nav class="navbar navbar-fixed-top xnavbar-default visible-sm visible-xs">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">{{ m.config.site.title.value }} &#9733;</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            {% menu id=id|highlightmenu %}
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
