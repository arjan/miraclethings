{% extends "base.tpl" %}


{% block content %}
<p class="chapeau">
    project,
    december 2010
</p>

<h1>Mediamatic ikPod</h1>

<p class="summary">
    An interactive device for doing so and so.
</p>

<div class="body">

    <p>
        Lorem ipsum dolor sit amet, <a href="#">consectetur adipiscing</a> elit. Aenean vel placerat sem. Nunc eu est at libero condimentum egestas. Vivamus tincidunt mattis turpis, nec porta ligula aliquam at. Nulla facilisi. Nullam a tortor sapien, ut vulputate neque. Donec sollicitudin luctus eros sit amet tristique. Nulla sagittis tortor eget ligula semper pharetra. Donec ac nibh eu urna porttitor euismod. Praesent ut sodales metus. Duis enim augue, tristique eget interdum quis, consectetur nec enim. Duis eu eros et erat egestas molestie eu quis nisi. <a href="#">Suspendisse</a> in ipsum nisi. Proin nec nisi eget velit semper feugiat eget quis mauris. Suspendisse feugiat quam eu mi porttitor vestibulum. Phasellus iaculis porta orci, ac molestie purus laoreet non. Morbi placerat euismod odio, eget cursus purus blandit quis. Duis pulvinar mattis nunc id tempus.
    </p>

    {% include "_body_media.tpl" id=314 align="block" %}

    <p>
        Nulla facilisi. Nunc est metus, feugiat blandit ornare vitae, venenatis id nunc. Suspendisse malesuada mattis lectus, quis hendrerit dui iaculis sit amet. Integer pulvinar sem sed augue volutpat gravida. Sed vulputate, nisi id dapibus commodo, neque diam porttitor nisi, vitae mattis urna lacus volutpat purus. Etiam scelerisque purus vel eros luctus eu pulvinar nibh rutrum. Vivamus a magna in dui pretium ornare sed vel tellus. Integer laoreet felis quis elit porttitor ac egestas lectus luctus. Curabitur lacinia sodales elementum. Maecenas ut ante libero, vitae euismod felis. Maecenas leo lectus, mollis non tempor ac, laoreet id quam. Sed faucibus aliquet purus. Vestibulum lobortis fermentum vulputate. Aenean dignissim quam sit amet nunc ultricies id iaculis sapien venenatis. Sed tempus lobortis consectetur. Duis massa nibh, interdum et semper et, pulvinar eget justo. Nullam vel massa tortor, in vehicula libero. In a velit metus. Phasellus dignissim dictum nisi, quis laoreet ipsum ultrices vel. Donec id purus nec ligula aliquam cursus.
    </p>

    <h2>An in-between header.</h2>
    <p>
        Sed elementum bibendum ante vel volutpat. Phasellus varius auctor lobortis. Praesent vulputate vestibulum enim, eget rutrum felis scelerisque vitae. Integer et accumsan diam. Integer dapibus lobortis tempus. Ut dictum turpis in nulla mollis mattis. Nulla sit amet consectetur ante. Aliquam erat volutpat. Nulla facilisi. Maecenas aliquet egestas congue. Pellentesque eleifend sollicitudin lorem id blandit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer tincidunt nibh a eros accumsan id vulputate elit convallis. Nunc dolor leo, semper eu vestibulum id, pretium vel nisi. Ut non lacus odio, eu bibendum lectus. Fusce iaculis volutpat congue. Suspendisse porttitor vehicula ante vitae consequat. Nulla volutpat, lacus vitae tristique condimentum, diam dui laoreet leo, ac cursus velit urna ac nulla. Ut aliquam dapibus quam, at malesuada velit faucibus eu. Mauris eget convallis diam.
    </p>
    <p>
        Proin tincidunt, libero in euismod lacinia, velit quam suscipit diam, in consequat ante est vitae velit. Duis facilisis auctor mauris, nec suscipit nunc auctor at. Phasellus tellus velit, lacinia eget rutrum fringilla, tincidunt in ante. Duis eu sem ipsum, aliquam mollis metus. Morbi sollicitudin libero sit amet nibh volutpat ac accumsan ligula venenatis. In hac habitasse platea dictumst. Sed dapibus rutrum nunc, vitae facilisis nisl fringilla sed. Nullam aliquam facilisis viverra. Aliquam et metus diam, et gravida enim. Mauris sapien nisi, tristique ac fringilla et, venenatis quis nisl. Nunc pulvinar scelerisque consectetur. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
    </p>
</div>

<div class="grid_9 alpha omega">

    <div class="project-info grid_3 alpha">
        <h4>In opdracht voor</h4>
        <a href="#">Joods Historisch Museum</a>, <a href="#">Mediamatic Lab</a>
    </div>

    <div class="project-info grid_3">
        <h4>Meer informatie</h4>
        <a href="#">github</a>, <a href="#">API documentatie</a>
    </div>

    <div class="project-info grid_3 omega">
        <h4>Gerealiseerd op</h4>
        12 december 2009
    </div>
</div>

<div class="grid_9 alpha omega">
    <div class="project-info grid_3 alpha">
        <h4>Licentie</h4>
        <a href="#">MIT</a>
    </div>
    
    <div class="project-info grid_6 omega">
        <h4>Trefwoorden</h4>
        <a href="#">alpha</a>, <a href="#">alpha</a>, <a href="#">alpha</a>, <a href="#">alpha</a>, <a href="#">alpha</a>
    </div>
</div>



{% endblock %}
