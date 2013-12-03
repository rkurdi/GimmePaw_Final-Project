<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Login_Webform.Account.WebForm1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="javascript" runat="server">
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyADjgrg2F4c04gPROMib2sX7L4MIaF6m1I&sensor=true&libraries=places"></script>
    <script type="text/javascript">
        function InitializeMap() {
            var latlng = new google.maps.LatLng(-34.397, 150.644);
            var myOptions = {
                zoom: 8,
                center: latlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("map"), myOptions);
        }
        window.onload = InitializeMap;
    </script>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">


    <div data-role="page">

        <div id="map_canvas" style="width:100%; height:100%"></div>

    </div>

</asp:Content>
