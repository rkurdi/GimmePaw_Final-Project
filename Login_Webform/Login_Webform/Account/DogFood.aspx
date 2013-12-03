<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DogFood.aspx.cs" Inherits="ProjectTest.DogFood" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
                Dog Foods at Walmart<br />
            </div>

            <asp:GridView ID="GridView_df" runat="server" Style="text-align: center" CssClass="table table-hover table-striped" AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="'ItemContainer">
                                <div class="PhotoContainer">
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Photo") %>'/>
                                </div>
                                <div class="LabelContainer">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                                </div>
                                <div class="UrlContainer">
                                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("Url") %>' NavigateUrl='<%# Eval("Url") %>' Target="_blank"></asp:HyperLink>
                                </div>
                                <div class="PriceContainer">
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
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
