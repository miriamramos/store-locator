<?php
ini_set ("display_errors", "1");
$result_array = array();    
    if(!empty($_POST))
    {
        $latitude = $_POST["txtLatitude"];
        $longitude = $_POST["txtLongitude"];

        $username="root";
        $host = "localhost";
        $database="store_locator";
        $con = mysqli_connect($host,$username,null) or die("Não foi Possível Conectar");
        $db_selected = mysqli_select_db($con,$database); 

        mysql_select_db($database);
    
        $latitude = abs($latitude);
        $longitude = abs($longitude);

            $sql = "SELECT id,name,address,lat,lng,"; 
            $sql = $sql . "((3956 *"; 
            $sql = $sql . "2 *"; 
            $sql = $sql . "ASIN(";
            $sql = $sql . "SQRT(POWER(SIN((? - abs(dest.lat)) * "; 
            $sql = $sql . "pi()/180 / 2),2) + "; 
            $sql = $sql . "COS(? * pi()/180 ) * "; 
            $sql = $sql . "COS(abs(dest.lat) * pi()/180) * ";        
            $sql = $sql . "POWER(SIN((? - abs(dest.lng)) * ";  
            $sql = $sql . "pi()/180 / 2), 2)) ";
            $sql = $sql . ") "; 
            $sql = $sql . ") * 1.609344) as distancia ";
            $sql = $sql . "FROM markers dest ";
            $sql = $sql . "ORDER BY distancia "; 
            $sql = $sql . "LIMIT 0 , 20";

            $stmt = $con->prepare($sql);
            $stmt->bind_param('ddd', $latitude, $longitude,$longitude);
            $stmt->execute() or die(mysqli_error());  

            $stmt->bind_result($id, $nome, $endereco, $lat,$lng,$distancia);   
        
            $array = array();
              
            while ($stmt->fetch()) {
                $result= array(
                  "id" => $id,
                  "nome"=> utf8_encode($nome),
                  "endereco" => utf8_encode($endereco),
                  "lat" => $lat,
                  "lng"=> $lng,
                  "distancia" => $distancia);
              $result_array[] = $result;                                       
        }
}
// Perform Query
?>
<html>
  <head>
    <title>Starter Code</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      html, body, #map-canvas {
        margin: 0;
        padding: 0;
        height: 100%;
      }   
    
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAQGU1QbdYiJBc01gBuzk6fAA8wTjkzOQs&signed_in=true&callback=initialize" async defer></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script>
        var map;
        var marker;
        var infowindow;
        var service;
        var markers;
        var addressPosition;
        
        function initialize() {
            var mapOptions = {
              zoom: 13,
              center: new google.maps.LatLng(-23.2115164, -45.8933722),
              mapTypeId: google.maps.MapTypeId.TERRAIN
            };
                  
            map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
                    
            var lista = <?php echo json_encode((array)$result_array);?>;
                    
            var lat = <?php if (empty($_POST)) {
                echo "-23.2115164";
            } else {
                echo $_POST["txtLatitude"];
            }
            ?>;
            var lng = <?php        
              if (empty($_POST)) {
                echo "-45.8933722";
            } else {
                echo $_POST["txtLongitude"];
            }
            ?>;
            map.setCenter(new google.maps.LatLng(lat,lng));
                            
              var listaEnd = [];
              var htmldiv = "<b>MYSQL Distance:</b><br/>";
              for(var i=0;i<lista.length;i++){
                  listaEnd.push(lista[i].endereco);
                  htmldiv += lista[i].endereco + " Distância:" +  lista[i].distancia + "<br/>";
                  var marker = new google.maps.Marker({
                      position: new google.maps.LatLng(lista[i].lat, lista[i].lng),
                      map: map,
                      title:"Google HQ"
                  });
              }
          
              if(lista.length > 0){
                  document.getElementById('outputMYSQL').innerHTML = htmldiv;
                  service = new google.maps.DistanceMatrixService();
                  calculateDistances(callback,listaEnd,lat,lng);
              }
              
          function calculateDistances(callback,listaEnd,latitude,longitude) {
            service.getDistanceMatrix({
              origins: [{lat: latitude, lng: longitude}],
              destinations: listaEnd,
              travelMode: google.maps.TravelMode.DRIVING,
              unitSystem: google.maps.UnitSystem.METRIC,
              avoidHighways: false,
              avoidTolls: false
            }, callback);
          }
          
          function callback(response, status) {
            if (status == google.maps.DistanceMatrixStatus.OK) {
                var origins = response.originAddresses;
                var destinations = response.destinationAddresses;
            
                var html = "<br/><b>Google Maps Distance:</b><br/><br/>";
                for (var i = 0; i < origins.length; i++) {
                    var results = response.rows[i].elements;
                    for (var j = 0; j < results.length; j++) {
                      var element = results[j];
                      var distance = element.distance.text;
                      var duration = element.duration.text;
                      var from = origins[i];
                      var to = destinations[j];
                      
                      html += from + " To " + to + ": " + duration + " " + distance + "<br/>";
                    }
                }
                document.getElementById('outputGoogle').innerHTML = html;
            }
          }       
      }
      
      function Geocode() {
          var _geocoder = new window.parent.google.maps.Geocoder();
          
          _geocoder.geocode({ 'address': $("#txtEndereco").val() }, function (results, status) {
              if (status === google.maps.GeocoderStatus.OK) {
                  map.setCenter(results[0].geometry.location);
                  $("#txtLatitude").val(results[0].geometry.location.lat());
                  $("#txtLongitude").val(results[0].geometry.location.lng());
                  $("#btnEnviar").click();
              }
          });
      }
      google.maps.event.addDomListener(window, 'load', initialize);
    </script>
  </head>
  <body>
    <div id="map-canvas" style="width:1900px; height:682px;"></div>
  </body>
 
  <br/>
  
  <div style="margin-left:20px;">
      <label>Endereço:</label>
      <input type="text" id="txtEndereco" />
      <input type="button" value="Gerar" onclick="javascript:Geocode();" /><br/>
      <br/>
      <div id="outputMYSQL">
          
      </div>
      <br/>
      <br/>
      <div id="outputGoogle">
          
      </div>
      </div>
  
  <form method="POST" style="display: none" action="?acao=ok" >
      <input type="hidden" name="txtLatitude" id="txtLatitude" />
      <input type="hidden" name="txtLongitude" id="txtLongitude" />
      <input type="submit" name="btnEnviar" id="btnEnviar" />
  </form>
</html>       
        