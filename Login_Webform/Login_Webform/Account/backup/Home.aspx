<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Login_Webform.Account.Home" %>

<asp:Content ID="Content2" ContentPlaceHolderID="javascript" runat="server">

<script type="text/javascript">


</script>

<style type='text/css'>


#button1 .ui-btn {
	background: url(icons/hospitals1.jpg) 0 0 no-repeat;
    display: inline-block;
    text-align: center;
    cursor: pointer;
    height: 240px; /* height of the background image */
    width: 240px; /* width of the background image */
    border: none;
    border-radius: 1.5em;
}
#button2 .ui-btn {
	background: url(icons/dogfood1.jpg) 0 0 no-repeat;
   font-weight: bold;
    display: inline-block;
    text-align: center;
    cursor: pointer;
    height: 240px; /* height of the background image */
    width: 240px; /* width of the background image */
    border: none;
    border-radius: 1.5em;
}
#button3 .ui-btn {
	background: url(icons/dogpark1.jpg) 0 0 no-repeat;
   font-weight: bold;
    display: inline-block;
    text-align: center;
    cursor: pointer;
    height: 240px; /* height of the background image */
    width: 240px; /* width of the background image */
    border: none;
    border-radius: 1.5em;
}
#button4 .ui-btn {
	background: url(icons/petstores1.jpg) 0 0 no-repeat;
   font-weight: bold;
    display: inline-block;
    text-align: center;
    cursor: pointer;
    height: 240px; /* height of the background image */
    width: 240px; /* width of the background image */
    border: none;
    border-radius: 1.5em;
}
#button5 .ui-btn {
	background: url(icons/vetdocs1.jpg) 0 0 no-repeat;
   font-weight: bold;
    display: inline-block;
    text-align: center;
    cursor: pointer;
    height: 240px; /* height of the background image */
    width: 240px; /* width of the background image */
    border: none;
    border-radius: 1.5em;
}


</style>

<script type='text/javascript'>

    //location.reload();
    function openWin() {
        window.open("http://vhost0221.dc1.on.ca.compute.ihost.com/find-local-parks.html", "_blank", "toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes, width=400, height=400");
    }

    //pro.html script

</script>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <body>
<div data-role="page" id="homepage">
  <div data-role="header">
           <div style="display:none;"><asp:Label ID="lblName" runat="server" Text=""></asp:Label></div>
   <a href="pro.html" data-icon="gear" data-iconpos="left"  data-transition="slidedown" id="profile">Profile</a>
    <h1>GimmePaw</h1>
    <a href="Login.aspx" data-icon="delete" data-iconpos="right" data-transition="slideup">Logout</a>
  </div>
  <div data-role="content">
    <div class="ui-grid-a">
      <div class="ui-block-a" id="button1" align="center"> <a href='hospital/hospital-map.html' 
			 class='lightview'
			 data-lightview-group='example'
			 data-lightview-title="Dog Hospital List" 
			 data-lightview-caption="All local Dog hospitals near you."
			 data-role="button">
         </a>
	  </div>
      <div class="ui-block-b" id="button2" align="center"> <a href='food/food-map.html' 
				class='lightview'
				data-lightview-group='example' 
				data-lightview-title="Dog Food Store List" 
				data-lightview-caption="All local food stores near you." 
                
				data-role="button"></a>
	  </div>
      <div class="ui-block-a" id="button3" align="center">
	  <a href='parks/parks-map.html' 
			 class='lightview' 
			 data-lightview-group='example'
			 data-lightview-title="Dog Parks List" 
			 data-lightview-caption="All local Dog parks near you."
			 data-role="button"></a>
	  <!--<a href="find-local-parks.html" data-role="button">Parks</a>-->
	  
	  
	  </div>
      <div class="ui-block-b" id="button4" align="center">
			<a href='stores/stores-map.html' 
			 class='lightview' 
			 data-lightview-group='example'
			 data-lightview-title="Pet Stores List" 
			 data-lightview-caption="All local pet stores near you."
			 data-role="button"></a>
	  </div>
      </div>
            <div id="button5" align="center">
			<div align="center"><a href='vet/vet-map.html' 
			 class='lightview' 
			 data-lightview-group='example'
			 data-lightview-title="Veterinarian List" 
			 data-lightview-caption="All local vet. near you."
			 data-role="button"></a>
	    </div>
      </div>

  </div>
  <div data-role="footer" align="center">
    <h10>Alex | Rebar | Soumick</h10>

  </div>

</div>
     </body>
</asp:Content>
