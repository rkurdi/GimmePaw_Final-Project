<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeBehind="UploadImages.aspx.cs" Inherits="Login_Webform.Account.UploadImages" %>
<html>
<head runat="server">
    <title></title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
    </style>

    <script src="../Scripts/jquery-1.6.4.min.js" type="text/javascript"></script>
        <link rel="stylesheet" media="screen" href="../Scripts/jquery-mobile/jquery.mobile.theme-1.0.min.css" />
        <link rel="stylesheet" media="screen" href="../Scripts/jquery-mobile/jquery.mobile.structure-1.0.min.css" />
        <link rel="stylesheet" type="text/css" href="../lightbox/css/lightview/lightview.css" />

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js"></script> 
<style type="text/css">

#navlist li
{
display: inline;
list-style-type: none;
padding-right: 20px;
}
    .auto-style1 {
        font-size: large;
        color: #FF0000;
    }
    </style>

</head>
<body>
    <form runat="server" style="text-align: center">
<div class="navbar navbar-inverse navbar-fixed-top">
		
			<div class="container">	
                <table>
                    <tr>
                        <td>
                            <a href="Home.aspx" class="btn">Home</a>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><a href="DogProfile.aspx">Dog Profile</a></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><a href="ImageToPdf.aspx">Upload Medical Information as PDF</a></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <asp:Button ID="logout" text="Log Out" runat="server" OnClick="logout_Click" />
                        </td>
                    </tr>
                </table>  
				
			</div>
    </div>



        <br />
        <strong><span class="auto-style1">Picture Gallery</span></strong><br />

<%--<div id="navcontainer">
<ul id="navlist">
<li id="active"><a href="DogProfile.aspx" id="current">Dog Profile</a></li>
<li><a href="ImageToPdf.aspx">Image to PDF</a></li>
</ul>
</div>--%>
	
        <div style="display:none;"><asp:Label ID="lblName" runat="server" Text=""></asp:Label></div>
        <div data-role="content">

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
            <br />
            <br />
                <asp:FileUpload ID="FileUpload1" runat="server" />

                <br />
                <br />
                <div id="upload">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Upload Picture" />                    
                </div>
            <asp:Label runat="server" id="StatusLabel" text="Upload status: " />
        </div>
    </div>
</form>
</body>
</html>