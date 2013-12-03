<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Login_Webform.Account.Profile" %>

<asp:Content ID="Content2" ContentPlaceHolderID="javascript" runat="server">
    <style type='text/css'>
     </style>


    <script type='text/javascript'>

        $(function () {
            $("a[data-role=tab]").each(function () {
                var anchor = $(this);
                anchor.bind("click", function () {
                    $.mobile.changePage(anchor.attr("href"), {
                        transition: "none",
                        changeHash: false
                    });
                    return false;
                });
            });

            $("div[data-role=page]").bind("pagebeforeshow", function (e, data) {
                $.mobile.silentScroll(0);
                $.mobile.changePage.defaults.transition = 'slide';
            });
        
            function isNumber(evt) {
                evt = (evt) ? evt : window.event;
                var charCode = (evt.which) ? evt.which : evt.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
                return true;
            }
            /*
                $(document).ready(function () {
                    $("#tabs").tabs({active: document.tabTest.currentTab.value});
                    $('#tabs a').click(function(e) {
                        var curTab = $('.ui-tabs-active');
                        curTabIndex = curTab.index();
                        document.tabTest.currentTab.value = curTabIndex;
                    });
                });
                */



            function openWin() {
                window.open("http://vhost0221.dc1.on.ca.compute.ihost.com/find-local-parks.html", "_blank", "toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes, width=400, height=400");
            }
            alert($('#<%=obj.ClientID %>').val());
            //HiddenField

    </script>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div style="display: none;">
        <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
    </div>
    <div id="page-1" data-role="page">

        <div data-role="header">
            <a class="force-reload" href="Home.aspx" data-icon="arrow-l" data-iconpos="left" data-transition="slideup">Back</a>
            <h1>Profile</h1>
            <a href="#save" data-icon="check" data-theme="b">Save</a>
        </div>

        <div data-role="content">
            <div data-role="fieldcontain">
                <p>
                    <asp:TextBox ID="DogName" runat="server" Value="Name" OnTextChanged="DogName_TextChanged"></asp:TextBox>
                    <!--<input type="text" name="textinput" id="textinput" value="" placeholder="Name" />-->
                </p>
                <div data-role="fieldcontain">
                    <p>
                        <asp:TextBox ID="Breed" runat="server" Value="Breed" OnTextChanged="Breed_TextChanged"></asp:TextBox>
                        <!--<input type="text" name="textinput2" id="textinput2" value="" placeholder="Breed"   />-->
                    </p>
                    <div data-role="fieldcontain">
                        <asp:HiddenField ID="hiddenGender" runat="server" Value="" />

                        <select name="Gender" id="selectmenu" data-native-menu="false">
                            <option data-placeholder="true">Gender</option>
                            <option value="M">Male</option>
                            <option value="F">Female</option>
                        </select>
                    </div>
                    <div data-role="fieldcontain">
                        <!--<asp:TextBox ID="TextBox4" runat="server" ></asp:TextBox>-->
                        <input type="text" name="textinput6" id="Age" value="" placeholder="Age" onkeypress="return isNumber(event)" />
                    </div>
                    <div data-role="fieldcontain">
                        <!--<input type="text" name="textinput4" id="f_food" value="" placeholder="Favorite Foods" />-->
                        <asp:TextBox ID="FavoriteFoods" runat="server"></asp:TextBox>

                        <asp:HiddenField ID="obj" runat="server" Value="" />
                    </div>
                    <div data-role="fieldcontain">
                        <input type="text" name="textinput3" id="f_parks" value="" placeholder="Favorite Parks" />
                    </div>
                    </p>
                </div>
                </p>
            </div>
        </div>
        </div>
    </div>

    </div>
        </div>
        </div>
    </div>
</asp:Content>
