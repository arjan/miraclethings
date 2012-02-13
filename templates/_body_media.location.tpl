<div class="body-media-block clearfix">
<div class="location">
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<div id="map_canvas" class="map-wrapper map-size-{{ sizename }}"></div>
<script>
$(document).ready(function() {

    var latlng = new google.maps.LatLng({{ m.rsc[id].location_lat }}, {{ m.rsc[id].location_lng }});
    var myOptions = {
      zoom: 14,
      center: latlng,
      disableDefaultUI: true,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map_canvas"),
        myOptions);

    var marker = new google.maps.Marker({
      position: latlng,
      map: map,
      title:"Hello World!"
    });

});
</script>

</div>
</div>
