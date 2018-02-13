<%@ Page Title="Мои Полиси" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="myPolicy.aspx.cs" Inherits="InsuranceCompanyWebApp.myPolicy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

      <div class="row"></div>
    <nav class="navbar navbar-default">
  <div class="container-fluid">
    
    <ul class="nav navbar-nav">
      <li ><a href="/Account/Manage.aspx">Мој Профил</a></li>
      <li class="active"><a href="/myPolicy.aspx">Мои Полиси</a></li>
      <li><a href="/myProperty.aspx">Мој Имот</a></li>
      <li><a href="/myVehicles.aspx">Мои Возила</a></li>
      <li ><a href="/moiTransakcii.aspx">Мои Трансакции</a></li>
    </ul>
  </div>
</nav>

    <h2>Мои полиси</h2>

    <hr />
    
    <br />
        <div class="row">
        <div class="col-md-5">
            <div class="form-horizontal">
                <div style="text-align:center">
                    <h4>Филтер според датум на издавање на полиса</h4>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="ponovi" CssClass="col-md-6 control-label">Датум од:</asp:Label>
                                    <div class="col-md-6">
                                        <asp:TextBox placeholder="yyyy-mm-dd" runat="server" ID="ponovi" CssClass="form-control" />
                                    </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="postari" CssClass="col-md-6 control-label">Датум до:</asp:Label>
                                    <div class="col-md-6">
                                        <asp:TextBox placeholder="yyyy-mm-dd" runat="server" ID="postari" CssClass="form-control" />
                                    </div>
                        </div>
                    </div>
                </div>  
            </div>
        </div>

        <div class="col-md-5">
            <div class="form-horizontal">
                <div style="text-align:center">
                    <h4>Филтер според старост на возилото</h4>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="ponovoV" CssClass="col-md-6 control-label">Година од:</asp:Label>
                                    <div class="col-md-6">
                                        <asp:TextBox placeholder="yyyy" runat="server" ID="ponovoV" CssClass="form-control" />
                                    </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="postaroV" CssClass="col-md-6 control-label">Година до:</asp:Label>
                                    <div class="col-md-6">
                                        <asp:TextBox placeholder="yyyy" runat="server" ID="postaroV" CssClass="form-control" />
                                    </div>
                        </div>
                    </div>
                </div>  
            </div>
        </div>

        <div class="col-md-2">
            <h4></h4>
            <br />
            <div class="form-group">
                <div class="col-md-12">
                    <asp:Button runat="server" Text="Филтрирај" CssClass="btn btn-success btn-block" OnClick="Unnamed5_Click" />
                </div>
            </div>
        </div>
        
    </div>

    <h4>Осигурани возила</h4>
    <p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="Vertical" OnRowDataBound="GridView2_RowDataBound" style="margin-top: 0px" AllowSorting="True" OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowEditing="GridView2_RowEditing" OnRowUpdating="GridView2_RowUpdating">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="br_polisa" HeaderText="Број на полиса" ReadOnly="True" />
                <asp:BoundField DataField="datum_izdavanje" HeaderText="Датум на издавање" ReadOnly="True" />
                <asp:BoundField DataField="seriski_br" HeaderText="Број на шасија" ReadOnly="True"  />
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
                <asp:CommandField CancelText="Откажи" DeleteText="Избриши" EditText="Измени" InsertText="Додади" NewText="Нова полиса" SelectText="Селектирај" ShowEditButton="True" UpdateText="Ажурирај" />
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
    <br />
    <div class="row">
        <div class="col-md-5">
            <div class="form-horizontal">
                <div style="text-align:center">
                    <h4>Филтер според датум на издавање на полиса</h4>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="ponoviPolisi" CssClass="col-md-6 control-label">Датум од:</asp:Label>
                                    <div class="col-md-6">
                                        <asp:TextBox placeholder="yyyy-mm-dd" runat="server" ID="ponoviPolisi" CssClass="form-control" />
                                    </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="postariPolisi" CssClass="col-md-6 control-label">Датум до:</asp:Label>
                                    <div class="col-md-6">
                                        <asp:TextBox placeholder="yyyy-mm-dd" runat="server" ID="postariPolisi" CssClass="form-control" />
                                    </div>
                        </div>
                    </div>
                </div>  
            </div>
        </div>

        <div class="col-md-5">
            <div class="form-horizontal">
                <div style="text-align:center">
                    <h4>Филтер според вредност на имотот</h4>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="poskapImot" CssClass="col-md-6 control-label">Вредност од:</asp:Label>
                                    <div class="col-md-6">
                                        <asp:TextBox placeholder="денари" runat="server" ID="poskapImot" CssClass="form-control" />
                                    </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="poevtinImot" CssClass="col-md-6 control-label">Вредност до:</asp:Label>
                                    <div class="col-md-6">
                                        <asp:TextBox placeholder="денари" runat="server" ID="poevtinImot" CssClass="form-control" />
                                    </div>
                        </div>
                    </div>
                </div>  
            </div>
        </div>

        <div class="col-md-2">
            <h4></h4>
            <br />
            <div class="form-group">
                <div class="col-md-12">
                    <asp:Button runat="server" Text="Филтрирај" CssClass="btn btn-success btn-block" OnClick="Unnamed10_Click" />
                </div>
            </div>
        </div>
        
    </div>

    <h4>Осигуран имот</h4>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" OnRowDataBound="GridView1_RowDataBound" ForeColor="#333333" GridLines="Vertical" DataKeyNames="br_polisa" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="tip_imot" HeaderText="Тип на имот" ReadOnly="True" />
            <asp:ButtonField CommandName="select" DataTextField="br_polisa" HeaderText="Број на Полиса" Text="Button" />
            <asp:BoundField DataField="vrednost" HeaderText="Вредност" />
            <asp:BoundField DataField="datum_izdavanje" HeaderText="Датум на издавање" ReadOnly="True" />
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
            <asp:CommandField CancelText="Откажи" DeleteText="Избриши" EditText="Измени" InsertText="Внеси" NewText="Нова полиса" ShowEditButton="True" UpdateText="Ажурирај" />
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
