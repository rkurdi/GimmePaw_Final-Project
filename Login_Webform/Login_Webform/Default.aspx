<%@ Page Title="GimmePaw!" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Login_Webform._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%: Title %></h1>
            </hgroup>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<div align="center">
    <ul>
        <h3><a href="Account/Login.aspx">Log In</a></h3>
        <h3><a href="Account/Register.aspx">Register</a></h3>
    </ul>
</div>
</asp:Content>
