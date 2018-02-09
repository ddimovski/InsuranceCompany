<%@ Page Title="Купи полиса" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addPropertyPolicy.aspx.cs" Inherits="InsuranceCompanyWebApp.addPropertyPolicy" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .baratel{
            color: #5cb85c;
            font-weight:bold;
        }
    </style>

    
    <h2><%: Title %></h2>
    <div class="row">
        <div class="col-md-6">
            <section id="applicantForm">
                <div class="form-horizontal">
                    <h4>Барател</h4>
                    <hr />
                    
                    <div class="form-group">
                        <asp:Label ID="LabelFname" runat="server" " CssClass="col-md-2 control-label">Име</asp:Label>
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
                            <asp:Label ID="lblEMBG" runat="server" Style="text-align:left"  CssClass="col-md-4 control-label pull-left">0211996440029</asp:Label>
                        </div>
                    </div>
                   
                    
                </div>
               
            </section>
        </div>

        <div class="col-md-6">
            <section id="typePolicy">
                <div class="form-horizontal">
                    <h4>Вид на осигурување</h4>
                    <hr />
                    

                    <div class="form-group">   
                    <div class="row">
                        <div class="col-md-6">
                            <asp:LinkButton ID="Property" CssClass="btn btn-success btn-block" runat="server" CausesValidation="False">Имот</asp:LinkButton>
                        </div>
                        <div class="col-md-6">
                            <asp:LinkButton ID="Vehicle" CssClass="btn btn-default btn-block" runat="server" OnClick="Vehicle_Click" CausesValidation="False">Возило</asp:LinkButton>
                        </div>
                    </div>
                    </div>

                <div id="propertyPolicy">

                    <div class="form-group">
                        <h4>Тип на имот</h4>
                        <div class="radio">
                        <asp:RadioButtonList runat="server" ID="RadioButtonListType" RepeatDirection="Horizontal" Width="50%" Font-Bold="True">
                            <asp:ListItem Selected="True" Value="flat">Стан</asp:ListItem>
                            <asp:ListItem Value="house">Куќа</asp:ListItem> 
                        </asp:RadioButtonList>
                        </div>
                    </div>

                    <br />

                    <div class="form-group">
                        <asp:Label ID="LabelC" runat="server" AssociatedControlID="City" CssClass="col-md-2 control-label">Град</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="City" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="City" ErrorMessage="Полето за град во кој се наоѓа имотот е задолжително." ForeColor="Red"></asp:RequiredFieldValidator>
                           
                        </div>
                    </div>

                     <div class="form-group">
                        <asp:Label ID="LabelS" runat="server" AssociatedControlID="Street" CssClass="col-md-2 control-label">Улица</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Street" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="Street" ErrorMessage="Полето за улица на која се наоѓа имотот е задолжително." ForeColor="Red"></asp:RequiredFieldValidator>
                           
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="LabelN" runat="server" AssociatedControlID="Number" CssClass="col-md-2 control-label">Број</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Number" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="Number" ErrorMessage="Полето за број на кој се наоѓа имотот е задолжително." ForeColor="Red"></asp:RequiredFieldValidator>
                           
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="LabelА" runat="server" AssociatedControlID="Ареа" CssClass="col-md-2 control-label">Површина</asp:Label>
                        <div class="col-md-2">
                            <asp:TextBox placeholder="м2" runat="server" ID="Ареа" CssClass="form-control" />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="LabelV" runat="server" AssociatedControlID="Value" CssClass="col-md-2 control-label">Вредност</asp:Label>
                        <div class="col-md-2">
                            <asp:TextBox placeholder="Денар" runat="server" ID="Value" CssClass="form-control" />
                        </div>
                    </div>

                </div>

                    <br />

                    <div class="form-group">
                        <div class="col-md-10">
                            <asp:Button ID="Button1" runat="server" Text="Поднеси барање" CssClass="btn btn-default btn-block" />
                        </div>
                    </div>

                </div>   
            </section>
        </div>

        
    </div>

</asp:Content>


