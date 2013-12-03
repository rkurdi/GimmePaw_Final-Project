<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DogProfileRegistration.aspx.cs" Inherits="Login_Webform.Account.DogProfileRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
        <header>
    <div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">	  
				<a href="Home.aspx" class="btn">Home</a>				
				<div class="navbar-form pull-right">
                    <%--<asp:Button ID="logout" text="Log Out" runat="server" OnClick="logout_Click"/>--%>
				</div>
			</div>
		</div>
    </div>


        </header>
        <br />
        <br />

<div id="navcontainer">
<%--<ul id="navlist">
<li id="active"><a href="DogProfile.aspx" id="current">Dog Profile</a></li>
<li><a href="UploadImages.aspx">Image Gallery</a></li>

</ul>--%>
</div>
	
    <div class="container" align="center" >
        <div class="dog">
        <h3>Dog Profile</h3>
        <br />
        <div class="form-group">

			<asp:TextBox ID="DogName" runat="server" Value="Name" ></asp:TextBox>
        </div>
        <div class="form-group">

			<asp:TextBox ID="Breed" runat="server" Value="Breed" ></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:HiddenField ID="Gender" runat="server" Value="" />
            <table>
                <tr>
                    <td>
                        <asp:RadioButton ID="Male" runat="server" Text="Male" GroupName="Gendermf" OnCheckedChanged="Gender_CheckedChange" AutopostBack="true" />
                    </td>
                    <td>
                        <asp:RadioButton ID="Female" runat="server" Text="Female" GroupName="Gendermf" OnCheckedChanged="Gender_CheckedChange" AutopostBack="true" />
                    </td>
                </tr>
            </table>
            
        </div>
				
        <div class="form-group">

		    <asp:TextBox ID="Age" runat="server" Value="Age" ></asp:TextBox>
        </div>				

        <asp:Button ID="SaveDogProfile" runat="server" Text="Save Dog Profile" OnClick="SaveDogProfile_Click" />
        </div> <!-- end of dog class -->
	</div>
    </form>
</body>
</html>

