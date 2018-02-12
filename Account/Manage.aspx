<%@ Page Title="Мој Профил" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="InsuranceCompanyWebApp.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    
    <style>
        .pad {
            margin-left:15px;
            }
    </style>

  
    <div class="row"></div>
    <nav class="navbar navbar-default">
  <div class="container-fluid">
    
    <ul class="nav navbar-nav">
      <li class="active"><a href="Manage.aspx">Мој Профил</a></li>
      <li><a href="/myPolicy.aspx">Мои Полиси</a></li>
      <li><a href="/myProperty.aspx">Мој Имот</a></li>
      <li><a href="/myVehicles.aspx">Мои Возила</a></li>
      <li><a href="/moiTransakcii.aspx">Мои Трансакции</a></li>
    </ul>
  </div>
</nav>

    <div class="row">
        <div class="col-md-12">
            <div class="form-horizontal">
                <h2>Мој профил</h2>
                <hr />
                
                 
                    <div class="form-group">
                        <asp:Label ID="LabelFname" runat="server" CssClass="col-md-2 control-label">Име</asp:Label>
                        <div class="col-md-10 baratel">
                            <asp:Label ID="lblName" runat="server" Style="text-align:left" CssClass="col-md-4 control-label pull-left"></asp:Label>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="LabelLname" runat="server"  CssClass="col-md-2 control-label ">Презиме</asp:Label>
                        <div class="col-md-10 baratel">
                            <asp:Label ID="lblLastName" runat="server" Style="text-align:left" CssClass="col-md-4 control-label" ></asp:Label>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="LabelEMBG" runat="server"  CssClass="col-md-2 control-label">ЕМБГ</asp:Label>
                        <div class="col-md-10 baratel">
                            <asp:Label ID="lblEMBG" runat="server" Style="text-align:left" CssClass="col-md-4 control-label pull-left"></asp:Label>
                        </div>
                    </div>
                   
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server"  CssClass="col-md-2 control-label">Телефон:</asp:Label>
                        
                            <asp:Panel ID="panelTelefoni" runat="server" CssClass="col-md-10 "></asp:Panel>
                        </div>
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-10 baratel pull-left">
                                <asp:TextBox ID="tbTelefoni" TextMode="Number" CssClass="pad" runat="server"></asp:TextBox>
                                <asp:Button ID="btnTelefon" CssClass="btn btnSuccess " runat="server"  Text="Додади број" OnClick="buttonTel_Click" UseSubmitBehavior="False" />
                            </div>
                        </div>
                </div>
                </div>

            </div>
  

</asp:Content>
