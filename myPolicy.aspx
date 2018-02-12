<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="myPolicy.aspx.cs" Inherits="InsuranceCompanyWebApp.myPolicy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

      <div class="row"></div>
    <nav class="navbar navbar-default">
  <div class="container-fluid">
    
    <ul class="nav navbar-nav">
      <li ><a href="Manage.aspx">Мој Профил</a></li>
      <li class="active"><a href="/myPolicy.aspx">Мои Полиси</a></li>
      <li><a href="/myProperty.aspx">Мој Имот</a></li>
      <li><a href="/myVehicles.aspx">Мои Возила</a></li>
      <li ><a href="/moiTransakcii.aspx">Мои Трансакции</a></li>
    </ul>
  </div>
</nav>

    <h2>Мои полиси</h2>

    <hr />

    <h4>Осигурани возила</h4>
    <p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="Vertical" OnRowDataBound="GridView2_RowDataBound" style="margin-top: 0px" AllowSorting="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="br_polisa" HeaderText="Број на полиса" />
                <asp:BoundField DataField="datum_izdavanje" HeaderText="Датум на издавање" />
                <asp:BoundField DataField="seriski_br" HeaderText="Број на шасија" />
                <asp:BoundField DataField="registracija" HeaderText="Регистрација" />
                <asp:BoundField DataField="godina" HeaderText="Година" />
                <asp:BoundField DataField="model" HeaderText="Модел" NullDisplayText="Нема податоци" />
                <asp:BoundField DataField="proizvoditel" HeaderText="Производител" NullDisplayText="Нема податоци" />
                <asp:BoundField DataField="br_vrati" HeaderText="Број на врати" NullDisplayText="Нема податоци" />
                <asp:TemplateField HeaderText="Платено?">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnPlateno1" runat="server" Text="A" CommandArgument='<%#Eval("br_polisa") %>' OnCommand="btnPlateno1_Click" /> 
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
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

    <hr />

    <h4>Осигуран имот</h4>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" OnRowDataBound="GridView1_RowDataBound" ForeColor="#333333" GridLines="Vertical" DataKeyNames="br_polisa" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="tip_imot" HeaderText="Тип на имот" />
            <asp:ButtonField CommandName="select" DataTextField="br_polisa" HeaderText="Број на Полиса" Text="Button" />
            <asp:BoundField DataField="vrednost" HeaderText="Вредност" />
            <asp:BoundField DataField="datum_izdavanje" HeaderText="Датум на издавање" />
            <asp:BoundField DataField="grad" HeaderText="Град" />
            <asp:BoundField DataField="ulica" HeaderText="Улица" />
            <asp:BoundField DataField="broj" HeaderText="Број" />
            <asp:TemplateField HeaderText="Платено?">
                <ItemTemplate>
                    <asp:LinkButton ID="btnPlateno" runat="server" Text="A" CommandArgument='<%#Eval("br_polisa") %>' OnCommand="btnPlateno_Click" /> 
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:ButtonField CommandName="select" HeaderText="Детали" Text="▼">
            <ItemStyle HorizontalAlign="Center" />
            </asp:ButtonField>
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5CB85C" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>




    <br />
    <asp:GridView ID="GridView3" runat="server" CellPadding="4" ForeColor="#333333" GridLines="Vertical">
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5CB85C" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <br />
    <asp:Label ID="Label1" runat="server"></asp:Label>


</asp:Content>
