<%@ Page Title="Регистрирај се" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="InsuranceCompanyWebApp.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Креирај нова корисничка сметка</h4>
        <hr />

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="firstName" CssClass="col-md-2 control-label">Име:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="firstName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="firstName"
                    CssClass="text-danger" ErrorMessage="Полето за име е задолжително." />
            </div>
        </div>

         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="lastName" CssClass="col-md-2 control-label">Презиме:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="lastName"  CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="lastName"
                    CssClass="text-danger" ErrorMessage="Полето за презиме е задолжително." />
            </div>
        </div>

         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="embg" CssClass="col-md-2 control-label">ЕМБГ:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="embg" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="firstName"
                    CssClass="text-danger" ErrorMessage="Полето за ЕМБГ е задолжително." />
            </div>
        </div>


        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">E-mail</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="Полето за e-mail е задолжително." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Лозинка</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="Полето за лозинка е задолжително." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Потврди лозинка</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Полето за потврдена лозинка е задолжително" />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Лозинката и потврдената лозинка не се совпаѓаат." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Регистрирај се" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>
