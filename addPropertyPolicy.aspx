<%@ Page Title="Купи полиса" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addPropertyPolicy.aspx.cs" Inherits="InsuranceCompanyWebApp.addPropertyPolicy" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .baratel{
            color: #5cb85c;
            font-weight:bold;
        }
    </style>

    <script type="text/javascript">

        $(document).ready(function () {

            ValidatorEnable(document.getElementById("MainContent_RequiredFieldValidator1"), true);
            ValidatorEnable(document.getElementById("MainContent_RequiredFieldValidator2"), true);
            ValidatorEnable(document.getElementById("MainContent_RequiredFieldValidator3"), true);
            ValidatorEnable(document.getElementById("MainContent_RequiredFieldValidator4"), true);
            ValidatorEnable(document.getElementById("MainContent_RequiredFieldValidator8"), true);
            ValidatorEnable(document.getElementById("MainContent_RequiredFieldValidator9"), true);


            $('input[type="radio"]').click(function () {
                
                if ($(this).attr("value") == "flat") {
                    $("#flat").show('slow');
                    $("#house").hide('slow');

                    ValidatorEnable(document.getElementById("MainContent_RequiredFieldValidator5"), true);
                    ValidatorEnable(document.getElementById("MainContent_RequiredFieldValidator6"), true);
                    ValidatorEnable(document.getElementById("MainContent_RequiredFieldValidator7"), true);



                }
                if ($(this).attr("value") == "house") {
                    $("#flat").hide('slow');
                    $("#house").show('slow');
                    ValidatorEnable(document.getElementById("MainContent_RequiredFieldValidator5"), false);
                    ValidatorEnable(document.getElementById("MainContent_RequiredFieldValidator6"), false);
                    ValidatorEnable(document.getElementById("MainContent_RequiredFieldValidator7"), false);
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
                    
                    <div class="form-group">
                        <asp:Label ID="LabelFname" runat="server"  CssClass="col-md-2 control-label">Име</asp:Label>
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
                        <asp:RadioButtonList runat="server" ID="RadioButtonListType" RepeatDirection="Horizontal" Width="50%" Font-Bold="True" OnSelectedIndexChanged="RadioButtonListType_SelectedIndexChanged">
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
                        <div class="col-md-4">
                            <asp:TextBox runat="server" TextMode="Number" ID="Number" CssClass="form-control" />
                            
                        </div>
                      
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="Number" ErrorMessage="Полето за број на кој се наоѓа имотот е задолжително." ForeColor="Red"></asp:RequiredFieldValidator>
                          
                    </div>

                     <div class="form-group">
                        <asp:Label ID="Label1" runat="server" AssociatedControlID="Code" CssClass="col-md-2 control-label">Код</asp:Label>
                        <div class="col-md-4">
                            <asp:TextBox runat="server" TextMode="Number" ID="Code" CssClass="form-control" />
                            
                        </div>
                         <div class="row">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="Number" ErrorMessage="Полето за поштенски код е задолжително." ForeColor="Red"></asp:RequiredFieldValidator>
                           </div>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="LabelА" runat="server"  AssociatedControlID="Area" CssClass="col-md-2 control-label">Површина</asp:Label>
                        <div class="col-md-4">
                            <asp:TextBox placeholder="м2" TextMode="Number" runat="server" ID="Area" CssClass="form-control" />
                           
                        </div>
                         <div class="row"><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                ControlToValidate="Area" ErrorMessage="Полето за површина на имотот е задолжително." ForeColor="Red"></asp:RequiredFieldValidator>
                           </div>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="LabelV" runat="server" AssociatedControlID="Value" CssClass="col-md-2 control-label">Вредност</asp:Label>
                        <div class="col-md-4">
                            <asp:TextBox placeholder="Ден." TextMode="Number" runat="server" ID="Value" CssClass="form-control" />
                           
                        </div>
                         <div class="row">
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                ControlToValidate="Value" ErrorMessage="Полето за вредност на имотот е задолжително." ForeColor="Red"></asp:RequiredFieldValidator>
                           </div>
                    </div>

                    <div id="flat">
                    <div class="form-group">
                        <asp:Label ID="LabelVlez" runat="server" AssociatedControlID="vlez" CssClass="col-md-2 control-label">Влез</asp:Label>
                        <div class="col-md-4">
                            <asp:TextBox runat="server" TextMode="Number" ID="vlez" CssClass="form-control" />
                            
                        </div>
                        <div class="row">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="vlez" ErrorMessage="Полето за влез во зградата е задолжително." ForeColor="Red"></asp:RequiredFieldValidator>
                           
                        </div>
                    </div>

                     <div class="form-group">
                        <asp:Label ID="LabelSprat" runat="server"  AssociatedControlID="sprat" CssClass="col-md-2 control-label">Спрат</asp:Label>
                        <div class="col-md-4">
                            <asp:TextBox runat="server" TextMode="Number" ID="sprat" CssClass="form-control" />
                           
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="sprat" ErrorMessage="Полето за број на спрат е задолжително." ForeColor="Red"></asp:RequiredFieldValidator>
                           
                    </div>

                    <div class="form-group">
                        <asp:Label ID="LabelStan" runat="server" AssociatedControlID="stan" CssClass="col-md-2 control-label">Број на стан</asp:Label>
                        <div class="col-md-4">
                            <asp:TextBox runat="server" TextMode="Number" ID="stan" CssClass="form-control" />
                           
                        </div>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="stan" ErrorMessage="Полето за број на стан е задолжително." ForeColor="Red"></asp:RequiredFieldValidator>
                           
                    </div>
                    </div>

                    <div class="form-group" id="house">
                        <asp:Label ID="LabelBrSpratovi" runat="server" AssociatedControlID="brSpratovi" CssClass="col-md-2 control-label">Број на спратови</asp:Label>
                        <div class="col-md-4">
                            <asp:TextBox runat="server" TextMode="Number" ID="brSpratovi" CssClass="form-control" />
                           
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
        </div>

        
    </div>

</asp:Content>


