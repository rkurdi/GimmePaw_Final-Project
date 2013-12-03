<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Login_Webform.Account.NewHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>
</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<script src="https://code.jquery.com/jquery.js"></script>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
	<script src="bootstrap/js/bootstrap.min.js"></script>	
	<link href="boostrap/css/bootstrap.css" rel="stylesheet"/>
	<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />


    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js"></script>

    <script type="text/javascript" src="../lightbox/js/spinners/spinners.min.js"></script>
    <script type="text/javascript" src="../lightbox/js/lightview/lightview.js"></script>
        
    <link rel="stylesheet" type="text/css" href="../lightbox/css/lightview/lightview.css" />
		

    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
    </style>

	
<style type='text/css'>


#button1  {
	background: url(icons/hospitals1.jpg) 0 0 no-repeat;
    display: inline-block;
    text-align: center;
    cursor: pointer;
    height: 240px; /* height of the background image */
    width: 240px; /* width of the background image */
    border: none;
    border-radius: 1.5em;
}
#button2 {
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
#button3  {
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
#button4  {
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
#button5  {
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

#button6 {	
    background: url(icons/coupon.jpg) 0 0 no-repeat;
   font-weight: bold;
    display: inline-block;
    text-align: center;
    cursor: pointer;
    height: 240px; /* height of the background image */
    width: 240px; /* width of the background image */
    border: none;
    border-radius: 1.5em;

}

.align-text-center {
text-align:center;

}


</style>

<script type='text/javascript'>

</script>
</head>
<body>
    <form id="form1" runat="server">
    <div style="display:none;"><asp:Label ID="lblName" runat="server" Text=""></asp:Label></div>
    <div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">	  
				<a href="DogProfile.aspx" class="btn">Profile</a>				
				<div class="navbar-form pull-right">
                    <asp:Button ID="logout" Text="Log Out" runat="server" OnClick="logout_Click"/>
				</div>
			</div>
		</div>
    </div>

    <div class="container">
      <div class="row">

          <!-- hospitaals -->
			<div class="span6">
				<a href='hospital/hospital-map.html' 
                         id ="button1"
					     class='lightview btn btn-primary btn-lg active'
					     data-lightview-group='example'
					     data-lightview-title="Dog Hospital List" 
					     data-lightview-caption="All local Dog hospitals near you."
					     role="button">
				     </a>
            </div>

          <!-- food -->
			<div class="span6">
				<a href='DogFood.aspx' id ="button2" role="button" class='btn btn-primary btn-lg active'>
<!--					     
					     data-lightview-group='example'
					     data-lightview-title="Dog Food" 
					     data-lightview-caption=""-->
				     </a>
            </div>

          <!-- dog park-->
        <div class="span6">
		<a href='WebForm2.aspx' 
                     id ="button3"
					 class='lightview btn btn-primary btn-lg active'
					 data-lightview-group='example'
					 data-lightview-title="Local Dog Parks" 
					 data-lightview-caption=""
					 role="button">
				 </a>
        </div>
    
              <div class="span6">
            <!-- dog store-->
		<a href='stores/stores-map.html' 
                     id ="button4"
					 class='lightview btn btn-primary btn-lg active'
					 data-lightview-group='example'
					 data-lightview-title="Local dog stores" 
					 data-lightview-caption=""
					 role="button">
				 </a>
        </div>		
          <!-- vets -->
        <div class="span6">
		<a href='vet/vet-map.html' 
                     id ="button5"
					 class='lightview btn btn-primary btn-lg active'
					 data-lightview-group='example'
					 data-lightview-title="Local Vets" 
					 data-lightview-caption=""
					 role="button">
				 </a>
        </div>		

          <!-- COUPON -->
        <div class="span6">
		<a href='CouponTest.aspx' id ="button6"	role="button" class=' btn btn-primary btn-lg active'>
<!--					 
					 data-lightview-group='example'
					 data-lightview-title="Pet-related Coupons" 
					 data-lightview-caption=""-->

			 </a>
        </div>		
      </div>
    </div> <!-- /container -->
	</form>
</body>
</html>