<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewImages.aspx.cs" Inherits="Login_Webform.Account.ViewImages" %>

<asp:Content ID="Content2" ContentPlaceHolderID="javascript" runat="server">
    <script type="text/javascript" >
        $(window).load(function () {

            var label = document.getElementById('<%=hiddenlabel.ClientID %>');
            var arrlbl = $(label).val().split("&");
            $(document.getElementById('<%=hiddenlblvals.ClientID %>')).val() = arrlbl;
        });
    </script>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div data-role="page" id="homepage">

        <div data-role="header">
            <h1>GimmePaw</h1>
        </div>

           <b> Hello <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Home</asp:LinkButton>
        </b>
        <div data-role="content">

    <asp:hiddenfield id="hiddenlabel"  runat="server" Value="" ></asp:hiddenfield>
    <asp:hiddenfield id="hiddenlblvals"  runat="server" Value="" ></asp:hiddenfield>


                             <!--			 data- lightview-title='< %# hiddenlabel.Value %>' -->
<%--    <asp:GridView ID="RepeaterImages" runat="server">          
        <ItemTemplate>
            <a href='<%# Container.DataItem %>'
			 class='lightview' 
			 data-lightview-group='example'

			 data-lightview-caption= '<%# Container.DataItem %>'
			 data-role="" >

                <asp:Image ID="Image" runat="server" ImageUrl='<%# Container.DataItem %>' Height="200" Width="200"/>

            </a>
        </ItemTemplate>
    </asp:GridView>--%>
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
    </div>
</asp:Content>
