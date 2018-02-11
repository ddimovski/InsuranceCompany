<%@ Page Title="Купи полиса" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addVehiclePolicy.aspx.cs" Inherits="InsuranceCompanyWebApp.addVehiclePolicy" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .baratel{
            color: #5cb85c;
            font-weight:bold;
        }

        
    </style>

    
    <script type="text/javascript">

        $(document).ready(function () {
            ValidatorEnable(document.getElementById("MainContent_RequiredFieldValidator2"), true);
            ValidatorEnable(document.getElementById("MainContent_RequiredFieldValidator1"), true);
            ValidatorEnable(document.getElementById("MainContent_RegularExpressionValidator2"), true);
        });</script>
    
    <h2><%: Title %></h2>
    <div class="row">
        <div class="col-md-6">
            <section id="applicantForm">
                <div class="form-horizontal">
                    <h4>Барател</h4>
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
                   
                    
                </div>
               
            </section>
        </div>

        <div class="col-md-6" >
            <section id="typePolicy" runat="server" >
                <div class="form-horizontal">
                    <h4>Вид на осигурување</h4>
                    <hr />
                    

                    <div class="form-group">   
                    <div class="row">
                        <div class="col-md-6">
                            <asp:LinkButton ID="Property" CssClass="btn btn-default btn-block" runat="server" CausesValidation="False" OnClick="Property_Click">Имот</asp:LinkButton>
                        </div>
                        <div class="col-md-6">
                            <asp:LinkButton ID="Vehicle" CssClass="btn btn-success btn-block" runat="server" CausesValidation="False">Возило</asp:LinkButton>
                        </div>
                    </div>
                    </div>

                <div id="vehiclePolicy">
                    

                   
                    <div class="form-group">
                        <asp:Label ID="LabelR" runat="server" AssociatedControlID="Registration" CssClass="col-md-3 control-label">Регистрација</asp:Label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="Registration" CssClass="form-control" />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="Registration" ErrorMessage="Полето за регистрација на возилото е задолжително." ForeColor="Red"></asp:RequiredFieldValidator>
                           
                        </div>
                    </div>

                     <div class="form-group">
                        <asp:Label ID="LabelSerialN" runat="server" AssociatedControlID="SerialN" CssClass="col-md-3 control-label">Сериски број</asp:Label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="SerialN" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="SerialN" ErrorMessage="Полето за сериски број на возилото е задолжително." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ErrorMessage="Серискиот број треба да содржи само броеви" ControlToValidate="SerialN" ValidationExpression="^[0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                              </div>
                    </div>

                    
                    <div class="form-group">
                        <asp:Label ID="LabelProizvoditel" runat="server" AssociatedControlID="Model" CssClass="col-md-3 control-label">Производител</asp:Label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="proizvoditel" CssClass="form-control" />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="LabelModel" runat="server" AssociatedControlID="Model" CssClass="col-md-3 control-label">Модел</asp:Label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="Model" CssClass="form-control" />
                        </div>
                    </div>
                    <br />
                    <div class="form-group">
                        <div class="row">
                            
                            <div class="col-md-1"></div>
                        <div class="col-md-3">
                        <asp:DropDownList ID="DropDownListYear" runat="server" >
                                <asp:ListItem Value="2018">- Година -</asp:ListItem>
                                <asp:ListItem Value="2018">2018</asp:ListItem>
                                <asp:ListItem Value="2017">2017</asp:ListItem>
                                <asp:ListItem Value="2016">2016</asp:ListItem>
                                <asp:ListItem Value="2015">2015</asp:ListItem>
                                <asp:ListItem Value="2014">2014</asp:ListItem>
                                <asp:ListItem Value="2013">2013</asp:ListItem>
                                <asp:ListItem Value="2012">2012</asp:ListItem>
                                <asp:ListItem Value="2011">2011</asp:ListItem>
                                <asp:ListItem Value="2010">2010</asp:ListItem>
                                <asp:ListItem Value="2009">2009</asp:ListItem>
                                <asp:ListItem Value="2008">2008</asp:ListItem>
                                <asp:ListItem Value="2007">2007</asp:ListItem>
                                <asp:ListItem Value="2006">2006</asp:ListItem>
                                <asp:ListItem Value="2005">2005</asp:ListItem>
                                <asp:ListItem Value="2004">2004</asp:ListItem>
                                <asp:ListItem Value="2003">2003</asp:ListItem>
                                <asp:ListItem Value="2002">2002</asp:ListItem>
                                <asp:ListItem Value="2001">2001</asp:ListItem>
                                <asp:ListItem Value="2000">2000</asp:ListItem>
                                <asp:ListItem Value="1999">1999</asp:ListItem>
                                <asp:ListItem Value="1998">1998</asp:ListItem>
                                <asp:ListItem Value="1997">1997</asp:ListItem>
                                <asp:ListItem Value="1996">1996</asp:ListItem>
                                <asp:ListItem Value="1995">1995</asp:ListItem>
                                <asp:ListItem Value="1994">1994</asp:ListItem>
                                <asp:ListItem Value="1993">1993</asp:ListItem>
                                <asp:ListItem Value="1992">1992</asp:ListItem>
                                <asp:ListItem Value="1991">1991</asp:ListItem>
                                <asp:ListItem Value="1990">1990</asp:ListItem>
                                <asp:ListItem Value="1989">1889</asp:ListItem>
                                <asp:ListItem Value="1988">1888</asp:ListItem>
                                <asp:ListItem Value="1987">1887</asp:ListItem>
                                <asp:ListItem Value="1986">1886</asp:ListItem>
                                <asp:ListItem Value="1985">1885</asp:ListItem>
                        </asp:DropDownList>
                        </div>
                            <div class="col-md-1"></div>
                        <div class="col-md-3">
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropdown-toggle">
                                <asp:ListItem Value="nDoors">- Број на врати -</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                                <asp:ListItem Value="5">5</asp:ListItem>
                                <asp:ListItem Value="6">6</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        </div>  
                    </div>

                </div>

                    <br />

                    <div class="form-group">
                        <div class="col-md-12">
                            <asp:Button ID="Button1" runat="server" Text="Поднеси барање" CssClass="btn btn-default btn-block" OnClick="Button1_Click" />
                        </div>
                    </div>
                    <asp:Label ID="result" runat="server" Text=""></asp:Label>
                </div>   
            </section>

            <section id="complete" runat="server" visible="false">
                
                <div class="row" style="text-align:center">
                    <div class="col-md-12">
                         <asp:Label ID="showMessage" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="row"><br /></div>
                <div class="row">
                    <div class="col-md-12">
                         <asp:Label ID="price" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:Button ID="pay" runat="server" Text="Продолжи кон плаќање" CssClass="btn btn-default btn-block" OnClick="pay_Click" />
                    </div>
                </div>
            </section>

        </div>
        <br />
            </div>

</asp:Content>
