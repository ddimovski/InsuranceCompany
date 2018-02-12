<%@ Page Title="Мој Профил" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="InsuranceCompanyWebApp.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    

  
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
                


            </div>
        </div>
    </div>

</asp:Content>
