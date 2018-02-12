<%@ Page Title="Мои Трансакции" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="moiTransakcii.aspx.cs" Inherits="InsuranceCompanyWebApp.moiTransakcii" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <div class="row"></div>
    <nav class="navbar navbar-default">
  <div class="container-fluid">
    
    <ul class="nav navbar-nav">
      <li ><a href="Manage.aspx">Мој Профил</a></li>
      <li><a href="/myPolicy.aspx">Мои Полиси</a></li>
      <li><a href="/myProperty.aspx">Мој Имот</a></li>
      <li><a href="/myVehicles.aspx">Мои Возила</a></li>
      <li class="active"><a href="/moiTransakcii.aspx">Мои Трансакции</a></li>
    </ul>
  </div>
</nav>

    <h2>Мои трансакции</h2>
    <hr  />
   
    <p>
        <asp:GridView ID="gvTransakcii" runat="server" CellPadding="4" ForeColor="#333333" GridLines="Vertical" style="margin-top: 0px" AllowSorting="False" OnRowDataBound="gvTransakcii_RowDataBound">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5CB85C" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#5CB85C" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
    </p>
    <h4>Вкупен износ: <asp:Label ID="vkupno" runat="server" Text=""></asp:Label></h4>
    
</asp:Content>
