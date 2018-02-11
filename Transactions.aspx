<%@ Page Title="Плаќање" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Transactions.aspx.cs" Inherits="InsuranceCompanyWebApp.Transactions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .lbl {font-weight:bold}
    </style>

     <h2><%: Title %></h2>
    <div class="row">
        <div class="col-md-6">
            <section id="applicantForm">
                <div class="form-horizontal">
                    <h4>Полиса</h4>
                    <hr />
                    
                    <div class="form-group">
                        <asp:Label ID="Datum" runat="server"  CssClass="col-md-4 control-label lbl">Датум на издавање:</asp:Label>
                        <div class="col-md-8 baratel">
                            <asp:Label ID="lblDatum" runat="server" Style="text-align:left" CssClass="col-md-6 control-label pull-left"></asp:Label>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="tip" runat="server"  CssClass="col-md-4 control-label lbl">Тип на полиса:</asp:Label>
                        <div class="col-md-8 baratel">
                            <asp:Label ID="lbltipPolisa" runat="server" Style="text-align:left" CssClass="col-md-6 control-label" ></asp:Label>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="vrednost" runat="server"  CssClass="col-md-4 control-label lbl">Вредност:</asp:Label>
                        <div class="col-md-8 baratel">
                            <asp:Label ID="lblVrednost" runat="server" Style="text-align:left"  CssClass="col-md-6 control-label pull-left">0211996440029</asp:Label>
                        </div>
                    </div>
                   
                     <div class="form-group">
                        <asp:Label ID="adresa" runat="server"  CssClass="col-md-4 control-label lbl">Адреса:</asp:Label>
                        <div class="col-md-8 baratel">
                            <asp:Label ID="lblAdresa" runat="server" Style="text-align:left"  CssClass="col-md-6 control-label pull-left">0211996440029</asp:Label>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <asp:Label ID="tipImot" runat="server"  CssClass="col-md-4 control-label lbl">Тип имот:</asp:Label>
                        <div class="col-md-8 baratel">
                            <asp:Label ID="lblTipImot" runat="server" Style="text-align:left"  CssClass="col-md-6 control-label pull-left">0211996440029</asp:Label>
                        </div>
                    </div>

                </div>
               
            </section>
        </div>

        <div class="col-md-6">

            <section id="sum" runat="server">
                  <div class="form-horizontal">
                    <h4>Трансакции</h4>
                    <hr />
                 
                    <div>
                         <div class="form-group">
                        <asp:Label ID="vkupno" runat="server"  CssClass="col-md-4 control-label lbl">Вкупно:</asp:Label>
                        <div class="col-md-8 baratel">
                            <asp:Label ID="lblVkupno" runat="server" Style="text-align:left" CssClass="col-md-6 control-label pull-left"></asp:Label>
                        </div>
                             </div>

                         <div class="form-group">
                        <asp:Label ID="Plateno" runat="server"  CssClass="col-md-4 control-label lbl">Платено:</asp:Label>
                        <div class="col-md-8 baratel">
                            <asp:Label ID="lblPlateno" runat="server" Style="text-align:left" CssClass="col-md-6 control-label pull-left"></asp:Label>
                        </div>

                             </div>

                        <div class="form-group">
                        <asp:Label ID="zaPlakjanje" runat="server"  CssClass="col-md-4 control-label lbl">За плаќање:</asp:Label>
                        <div class="col-md-8 baratel">
                            <asp:Label ID="lblZaPlakjanje" runat="server" Style="text-align:left" CssClass="col-md-6 control-label pull-left"></asp:Label>
                        </div>

                             </div>
                    </div>
                        
                    </div>
                
                  

            </section>
            <br />
            <br />
            <section id="typePolicy" runat="server">
                <div class="form-horizontal">
                    <h4>Нова трансакција</h4>
                    <hr />
                    



                <div id="transakcija">

                   <div class="form-group">
                        <asp:Label ID="LabelIznos" runat="server" AssociatedControlID="Iznos" CssClass="col-md-4 control-label">Износ:</asp:Label>
                        <div class="col-md-6">
                            <asp:TextBox runat="server" ID="Iznos" CssClass="form-control" TextMode="Number" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="Iznos" ErrorMessage="Полето за износ е задолжително." ForeColor="Red"></asp:RequiredFieldValidator>
                           
                        </div>
                    </div>

                     <div class="form-group">
                        <asp:Label ID="LabelKod" runat="server" AssociatedControlID="kod" CssClass="col-md-4 control-label">Број на трансакција:</asp:Label>
                        <div class="col-md-6">
                            <asp:TextBox runat="server" ID="kod" CssClass="form-control" TextMode="Number" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="kod" ErrorMessage="Полето за број на трансакција е задолжително." ForeColor="Red"></asp:RequiredFieldValidator>
                           
                        </div>
                    </div>

                   
                </div>

                    <div class="form-group">
                        <div class="col-md-12">
                            <asp:Button ID="Button1" runat="server" Text="Внеси трансакција" CssClass="btn btn-default btn-block" OnClick="Button1_Click" />
                        </div>
                    </div>
                    <asp:Label ID="result" runat="server" Text=""></asp:Label>
                </div>   
            </section>

            
      </div>
                </div>
     
</asp:Content>
