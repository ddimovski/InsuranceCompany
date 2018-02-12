<%@ Page Title="Мои Возила" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="myVehicles.aspx.cs" Inherits="InsuranceCompanyWebApp.myVehicles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div class="row"></div>
    <nav class="navbar navbar-default">
  <div class="container-fluid">
    
    <ul class="nav navbar-nav">
      <li ><a href="Manage.aspx">Мој Профил</a></li>
      <li><a href="/myPolicy.aspx">Мои Полиси</a></li>
      <li><a href="/myProperty.aspx">Мој Имот</a></li>
      <li class="active"><a href="/myVehicles.aspx">Мои Возила</a></li>
      <li ><a href="/moiTransakcii.aspx">Мои Трансакции</a></li>
    </ul>
  </div>
</nav>

     <h2>Мои возила</h2>

    <hr />

   
    <p>
        <asp:GridView ID="gvVozila" runat="server" CellPadding="4" ForeColor="#333333" GridLines="Vertical" style="margin-top: 0px" AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="seriski_br" HeaderText="Број на шасија" />
                <asp:BoundField DataField="registracija" HeaderText="Регистрација" />
                <asp:BoundField DataField="proizvoditel" HeaderText="Производител" NullDisplayText="Нема податоци" />
                <asp:BoundField DataField="model" HeaderText="Модел" NullDisplayText="Нема податоци" />
                <asp:BoundField DataField="godina" HeaderText="Година на производство" NullDisplayText="2018" />
                <asp:BoundField DataField="br_vrati" HeaderText="Број на врати" NullDisplayText="Нема податоци" />
            </Columns>
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
</asp:Content>
