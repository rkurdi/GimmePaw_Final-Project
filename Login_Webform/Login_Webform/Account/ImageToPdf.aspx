<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImageToPdf.aspx.cs" Inherits="Login_Webform.Account.ImageToPdf" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="https://code.jquery.com/jquery.js"></script>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<script src="bootstrap/js/bootstrap.min.js"></script>	
	<link href="boostrap/css/bootstrap.css" rel="stylesheet" />
	<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />
    <style type="text/css">
        .dog {
            border: 1px solid #808080;
        }
#navlist li
{
display: inline;
list-style-type: none;
padding-right: 20px;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
                <div style="display:none;"><asp:Label ID="lblName" runat="server" Text=""></asp:Label></div>
    <div>
<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">	  
				<a href="Home.aspx" class="btn">Home</a>				
				<div class="navbar-form pull-right">
                    <asp:Button ID="logout" text="Log Out" runat="server" OnClick="logout_Click"/>
				</div>
			</div>
		</div>
    </div>



        <br />
        <br />

<div id="navcontainer">
<ul id="navlist">
<li id="active"><a href="UploadImages.aspx" id="current">Image Gallery</a></li>
<li><a href="DogProile.aspx">Dog Profile</a></li>

</ul>
</div>
                <asp:FileUpload ID="FileUpload1" runat="server" />    

                <div id="upload">
                    <asp:Button ID="Button1" runat="server" OnClick="CreatePDFFile" Text="Convert medical file to pdf" />                    
                </div>

        <br /><br />
    <asp:hiddenfield id="hiddenlabel"  runat="server" Value="" ></asp:hiddenfield>
    <asp:hiddenfield id="hiddenlblvals"  runat="server" Value="" ></asp:hiddenfield>
    <asp:Repeater ID="RepeaterImages" runat="server">
        <ItemTemplate>
            <a href='<%# Container.DataItem %>'
			 class='lightview' 
			 data-lightview-group='example'

			 data-lightview-caption= '<%# Container.ItemIndex %>'
			 data-role="" >

                <asp:Image ID="Image" runat="server" ImageUrl='<%# Container.DataItem %>' Height="200" Width="200"/>

            </a>
        </ItemTemplate>
    </asp:Repeater>

    </div>
    </form>
</body>
</html>
