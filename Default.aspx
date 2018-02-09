<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="InsuranceCompanyWebApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .osig:hover{
            background-color:#eeeeee;
        }

        ul{
            list-style:none
        }
    </style>


    <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">Купете осигурување онлајн - Најбрзо и најсигурно до вашето осигурување</p>
        <p><a href="About.aspx" class="btn btn-success btn-large">Повеќе за нас &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-6 osig" style="text-align:center">

            <img style="text-align:center; width:75%; height:200px; padding-top:10px;" src="img/imot.jpg" /> 
            <h3>Осигурување на вашиот имот</h3>
            <p>Осигурајте го вашиот имот според податоците за:</p>
            <ul>
                    <li>Видот на имот</li>
                    <li>Сопственик на имотот</li>
                    <li>Површина на имотот</li>
                    <li>Локација на имотот</li>
                    <li>Проценета вредност на имотот</li>
            </ul>
            <br />
            <p><a href="addPropertyPolicy.aspx" class="btn btn-default btn-large">Купи полиса &raquo;</a></p>

        </div>

        <div class="col-md-6 osig" style="text-align:center">

            <img style="text-align:center; width:75%; height:200px; padding-top:10px;" src="img/vozilo.jpg" /> 
            <h3>Осигурување на вашeто возило</h3>
            <p>Осигурајте го вашето возило според податоците за: </p>
            <ul>
                    <li>Сопственик на возилото</li>
                    <li>Регистарска таблица на возилото</li>
                    <li>Дополнително:</li>
                    <li>Година на производство на возилото</li>
                    <li>Модел на возилото</li>
                    
            </ul>
            <br />
            <p><a href="addVehiclePolicy.aspx" class="btn btn-default btn-large">Купи полиса &raquo;</a></p>

        </div>
    </div>

</asp:Content>
