<%@ Page Title="Мој Имот" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="myProperty.aspx.cs" Inherits="InsuranceCompanyWebApp.myProperty" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

      <div class="row"></div>
    <nav class="navbar navbar-default">
  <div class="container-fluid">
    
    <ul class="nav navbar-nav">
      <li ><a href="Manage.aspx">Мој Профил</a></li>
      <li><a href="/myPolicy.aspx">Мои Полиси</a></li>
      <li class="active"><a href="/myProperty.aspx">Мој Имот</a></li>
      <li ><a href="/myVehicles.aspx">Мои Возила</a></li>
      <li ><a href="/moiTransakcii.aspx">Мои Трансакции</a></li>
    </ul>
  </div>
</nav>

     <h2>Мој имот</h2>

    <hr />

    <h4>Мои куќи</h4>
    <p>
        <asp:GridView ID="gvKukji" runat="server" CellPadding="4" ForeColor="#333333" GridLines="Vertical" OnRowDataBound="GridView2_RowDataBound" style="margin-top: 0px">
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

     <hr />

    <h4>Мои станови</h4>
    <p>
        <asp:GridView ID="gvStanovi" runat="server" CellPadding="4" ForeColor="#333333" GridLines="Vertical" style="margin-top: 0px">
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

</asp:Content>
