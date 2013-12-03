<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Login_Webform.Account.WebForm2" %>




<!DOCTYPE html>
<html>
  <head>
    <title>Geolocation</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
    </style>
    <!--
    Include the maps javascript with sensor=true because this code is using a
    sensor (a GPS locator) to determine the user's location.
    See: https://developers.google.com/maps/documentation/javascript/tutorial#Loading_the_Maps_API
    -->
    <!--<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true&libraries=places"></script>-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyADjgrg2F4c04gPROMib2sX7L4MIaF6m1I&sensor=true&libraries=places"></script>

    <script src="../Scripts/jquery-1.6.4.min.js" type="text/javascript"></script>
        <link rel="stylesheet" media="screen" href="../Scripts/jquery-mobile/jquery.mobile.theme-1.0.min.css" />
        <link rel="stylesheet" media="screen" href="../Scripts/jquery-mobile/jquery.mobile.structure-1.0.min.css" />
<!--        -->
      <!--
<script src="../Scripts/jquery.mobile-1.0.min.js" type="text/javascript"></script>

        <script type="text/javascript" src="../lightbox/js/spinners/spinners.min.js"></script>
        <script type="text/javascript" src="../lightbox/js/lightview/lightview.js"></script>
          -->        
        <link rel="stylesheet" type="text/css" href="../lightbox/css/lightview/lightview.css" />

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js"></script>



<asp:placeHolder id="javascript" runat="server" >

    <script type="text/javascript">

        $(document).ready(function () {

            //alert(label);
            $(".favorite").live('click', function () {
                $('#favoriteYes').html("ADDED!");
                var label = document.getElementById('<%=hiddenlabel.ClientID %>');
//                var label1 = document.getElementById('<%=Hiddenfield.ClientID %>');

                var here =

                    $(this).attr('name') + "*" +
                    $(this).attr('website') + "*" +
                    $(this).attr('address');
                
                var jsonString = JSON.stringify(here);
                //alert(jsonString);

                label.value = here;
                alert(label.value);
                $($('#<%=Button1.ClientID %>')).click(); //trigger the click to write json to file

            });

            // Note: This example requires that you consent to location sharing when
            // prompted by your browser. If you see a blank space instead of the map, this
            // is probably because you have denied permission for location sharing.
            var map;
            var infowindow;
            //var $win = null;
            //var currentPos;
            //var service;
            function initialize() {


                // Try HTML5 geolocation
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(function (position) {
                        var pos = new google.maps.LatLng(position.coords.latitude,
                                                         position.coords.longitude);

                        map = new google.maps.Map(document.getElementById('map-canvas'),
                        {
                            mapTypeId: google.maps.MapTypeId.ROADMAP,
                            center: pos,
                            zoom: 11
                        });


                        var request = {
                            location: pos,
                            radius: 10000,
                            keyword: 'dog park'
                            //types: ['police']
                            //query: "dog parks in kansas city"
                        };

                        infowindow = new google.maps.InfoWindow();
                        service = new google.maps.places.PlacesService(map);
                        service.search(request, callback);
                        map.setCenter(pos);

                    }, function () {
                        handleNoGeolocation(true);
                    });
                } else {
                    // Browser doesn't support Geolocation
                    handleNoGeolocation(false);
                }
            }

            function handleNoGeolocation(errorFlag) {

                if (errorFlag) {
                    var content = 'Error: The Geolocation service failed.';
                } else {
                    var content = 'Error: Your browser doesn\'t support geolocation.';
                }

                var options = {
                    map: map,
                    position: new google.maps.LatLng(60, 105),
                    content: content
                };

                //var infowindow = new google.maps.InfoWindow(options);
                //map.setCenter(options.position);
            }

            function createMarker(place) {
                var placeLoc = place.geometry.location;
                var marker = new google.maps.Marker({
                    map: map,
                    position: place.geometry.location
                });

                var request = { reference: place.reference };

                service.getDetails(request, function (details, status) {
                    //alert(request.reference);
                    if (details != null) {

                        if (status == google.maps.places.PlacesServiceStatus.OK) {

                            google.maps.event.addListener(marker, 'click', function () {
                                //			alert(details.name);
                                infowindow.setContent(
                                                "Add to favorites?" + "<br/>" +
                                                "<div class='favorite' name='" + details.name +
                                                "' address='" + details.formatted_address +
                                                "' website='" + details.website + "' '>" +
                                                "<a id='favoriteYes' href='#'>YES</a></div>" +
                                                "  <br /> <br /> " +
                                                details.name + "<br />" +
                                                details.formatted_address + "<br />" +
                                                details.website + "<br />" +
                                                details.formatted_phone_number);
                                infowindow.open(map, this);

                            });
                        }
                    }
                });
            }
            
            function callback(results, status) {
                if (status == google.maps.places.PlacesServiceStatus.OK) {

                    for (var i = 0; i < results.length; i++) {
                        createMarker(results[i]);
                    }
                }
            }




            google.maps.event.addDomListener(window, 'load', initialize);
        });
    </script>
</asp:placeHolder>
  </head>
  <body>
      
<!--<div data-role="page" id="homepage">-->
      <!--
  <div data-role="header">

   <a href="Profile.aspx" data-icon="gear" data-iconpos="left"  data-transition="slidedown" id="profile">Profile</a>
    <h1>GimmePaw</h1>
    <a href="Login.aspx" data-icon="delete" data-iconpos="right" data-transition="slideup">Logout</a>
  </div>
      -->

    <form id="Form1" runat="server"  data-ajax="false">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
        </asp:ScriptManager>
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click"></asp:Button>
    <input id="hiddenlabel"  runat="server" Value="" /> 
    <asp:hiddenfield id="Hiddenfield"  runat="server" Value="" ></asp:hiddenfield>
        <!--hiddenfield-->
        </form>

    <div style="display:none;"><asp:Label ID="lblName" runat="server" Text=""></asp:Label></div>

    <div id="map-canvas"></div>
<!--</div>-->
  </body>
</html>

