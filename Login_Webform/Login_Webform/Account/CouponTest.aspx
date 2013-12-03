<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CouponTest.aspx.cs" Inherits="Login_Webform.Account.CouponTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
    <style>
        .hidden {display:none}
    </style>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    
    <form id="form1" runat="server">

    <div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">	  
				<a href="Home.aspx" class="btn">Home</a>				

			</div>
		</div>
    </div>
        <div>
            <div class="auto-style1">
                Pet deals near you<br />
                ZipCode:
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
                <br />
            </div>

            <asp:GridView ID="GridView1" runat="server" Style="text-align: center" CssClass="table table-hover table-striped" AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="'ItemContainer">
                                <div class="LabelContainer">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                                </div>
                                <div class="UrlContainer">
                                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("Url") %>' NavigateUrl='<%# Eval("Url") %>' Target="_blank"></asp:HyperLink>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>
    </form>
</body>
</html>
