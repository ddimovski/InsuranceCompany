<%@ Page Title="Нова полиса" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addNewPolicy.aspx.cs" Inherits="InsuranceCompanyWebApp.addNewPolicy" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">

        $(document).ready(function () {

            $('input[type="radio"]').click(function () {
                if ($(this).attr("value") == "vehicle") {
                    $("#vehiclePolicy").show('slow');
                    $("#propertyPolicy").hide('slow');
                }
                if ($(this).attr("value") == "property") {
                    $("#vehiclePolicy").hide('slow');
                    $("#propertyPolicy").show('slow');
                }

                }
            );

            $('input[type="radio"]').trigger('click');  // trigger the event
        });

	</script>
    
    <h2><%: Title %></h2>
    <div class="row">
        <div class="col-md-6">
            <section id="applicantForm">
                <div class="form-horizontal">
                    <h4>Барател</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label ID="LabelFname" runat="server" CssClass="col-md-2 control-label">Име</asp:Label>
                        <div class="col-md-10">
                            <asp:Label ID="lblName" runat="server" CssClass="col-md-2 control-label pull-left"></asp:Label>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="LabelLname" runat="server"  CssClass="col-md-2 control-label ">Презиме</asp:Label>
                        <div class="col-md-10">
                            <asp:Label ID="lblLastName" runat="server" CssClass="col-md-2 control-label" ></asp:Label>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="LabelEMBG" runat="server"  CssClass="col-md-2 control-label">ЕМБГ</asp:Label>
                        <div class="col-md-10">
                            <asp:Label ID="lblEMBG" runat="server"  CssClass="col-md-2 control-label pull-left"></asp:Label>
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
                    <asp:PlaceHolder runat="server" ID="PlaceHolder1" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="Literal1" />
                        </p>
                    </asp:PlaceHolder>

                    <div class="form-group">   
                    <div class="radio">
                        <asp:RadioButtonList runat="server" ID="vehicle" RepeatDirection="Horizontal" Width="45%" Font-Bold="True">
                            <asp:ListItem Selected="True" Value="vehicle">Возило</asp:ListItem>
                            <asp:ListItem Value="property">Имот</asp:ListItem> 
                        </asp:RadioButtonList>
                    </div>
                    </div>

                <div id="vehiclePolicy">
                    <asp:PlaceHolder runat="server" ID="PlaceHolder2" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="Literal2" />
                        </p>
                    </asp:PlaceHolder>

                    <div class="form-group">
                        <asp:Label ID="LabelOwnerV" runat="server" AssociatedControlID="OwnerV" CssClass="col-md-2 control-label">Сопственик</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="OwnerV" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="OwnerV"
                                CssClass="text-danger" ErrorMessage="Полето за сопственик на возилото е задолжително." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="LabelR" runat="server" AssociatedControlID="Registration" CssClass="col-md-2 control-label">Регистрација</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Registration" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Registration"
                                CssClass="text-danger" ErrorMessage="Полето за регистрација на возилото е задолжително." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="LabelModel" runat="server" AssociatedControlID="Model" CssClass="col-md-2 control-label">Модел</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Model" CssClass="form-control" />
                        </div>
                    </div>
                    <br />
                    <div class="form-group">
                        <div class="row">
                        <div class="col-md-3">
                        <asp:DropDownList ID="DropDownListYear" runat="server" CssClass="dropdown-toggle-button">
                                <asp:ListItem Value="year">- Година -</asp:ListItem>
                                <asp:ListItem>2018</asp:ListItem>
                                <asp:ListItem>2017</asp:ListItem>
                                <asp:ListItem>2016</asp:ListItem>
                                <asp:ListItem>2015</asp:ListItem>
                                <asp:ListItem>2014</asp:ListItem>
                                <asp:ListItem>2013</asp:ListItem>
                                <asp:ListItem>2012</asp:ListItem>
                                <asp:ListItem>2011</asp:ListItem>
                                <asp:ListItem>2010</asp:ListItem>
                                <asp:ListItem>2009</asp:ListItem>
                                <asp:ListItem>2008</asp:ListItem>
                                <asp:ListItem>2007</asp:ListItem>
                                <asp:ListItem>2006</asp:ListItem>
                                <asp:ListItem>2005</asp:ListItem>
                                <asp:ListItem>2004</asp:ListItem>
                                <asp:ListItem>2003</asp:ListItem>
                                <asp:ListItem>2002</asp:ListItem>
                                <asp:ListItem>2001</asp:ListItem>
                                <asp:ListItem>2000</asp:ListItem>
                                <asp:ListItem>1999</asp:ListItem>
                                <asp:ListItem>1998</asp:ListItem>
                                <asp:ListItem>1997</asp:ListItem>
                                <asp:ListItem>1996</asp:ListItem>
                                <asp:ListItem>1995</asp:ListItem>
                                <asp:ListItem>1994</asp:ListItem>
                                <asp:ListItem>1993</asp:ListItem>
                                <asp:ListItem>1992</asp:ListItem>
                                <asp:ListItem>1991</asp:ListItem>
                                <asp:ListItem>1990</asp:ListItem>
                                <asp:ListItem>1889</asp:ListItem>
                                <asp:ListItem>1888</asp:ListItem>
                                <asp:ListItem>1887</asp:ListItem>
                                <asp:ListItem>1886</asp:ListItem>
                                <asp:ListItem>1885</asp:ListItem>
                        </asp:DropDownList>
                        </div>
                        <div class="col-md-2">
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem Value="nDoors">- Број на врати -</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        </div>  
                    </div>

                </div>

                <div id="propertyPolicy">

                    <div class="form-group">   
                    <div class="radio ">
                        <asp:RadioButtonList runat="server" ID="RadioButtonListType" RepeatDirection="Horizontal" Width="45%" Font-Bold="True">
                            <asp:ListItem Selected="True" Value="flat">Стан</asp:ListItem>
                            <asp:ListItem Value="house">Куќа</asp:ListItem> 
                        </asp:RadioButtonList>
                    </div>
                    </div>

                    <br />

                    <div class="form-group">
                        <asp:Label ID="LabelOP" runat="server" AssociatedControlID="OwnerP" CssClass="col-md-2 control-label">Сопственик</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="OwnerP" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="OwnerP"
                                CssClass="text-danger" ErrorMessage="Полето за сопственик на имотот е задолжително." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="LabelL" runat="server" AssociatedControlID="Location" CssClass="col-md-2 control-label">Локација</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Location" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Location"
                                CssClass="text-danger" ErrorMessage="Полето за локација на имотот е задолжително." />
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
                            <asp:Button ID="Button1" runat="server" Text="Поднеси барање" CssClass="btn btn-default btn-block" OnClick="Button1_Click" />
                        </div>
                    </div>

                </div>   
            </section>
        </div>

        
    </div>

</asp:Content>
