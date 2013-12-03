<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="1-Profile.aspx.cs" Inherits="Login_Webform.Account.Profile_1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="javascript" runat="server">
    <script type="text/javascript">


    </script>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div style="display:none;"><asp:Label ID="lblName" runat="server" Text=""></asp:Label></div>
<div id="page-1" data-role="page">
    <div data-role="header">
        <a href="Home.aspx"   >Back</a>
        <h1>Profile</h1>
        <a href="#save" data-icon="check" data-theme="b">Save</a>
    </div>
    <div data-role="header" data-position="fixed">
        <div id="tabs" data-role="navbar">
            <ul>
                <li><a href="#page-1" data-role="tab" data-icon="grid" class="ui-btn-active" id="dprofile">Dog Profile</a></li>
                <li><a href="#page-2" data-role="tab" data-icon="grid" id="dpicture">Dog Pictures</a></li>
                <li><a href="#page-3" data-role="tab" data-icon="grid" id="oprofile">Owner's Profile</a></li>
            </ul>
        </div>
    </div>
    <div data-role="content">
        <div align="center">
        </div>
    </div>
</div>

</asp:Content>
