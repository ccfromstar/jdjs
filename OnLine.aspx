<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="OnLine.aspx.cs" Inherits="JDJS.Web.OnLine" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            font-size: medium;
        }
        .style3
        {
            color: #0000FF;
        }
        .style6
        {
            font-weight: bold;
            color: #3333FF;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div class="SubMain">
    <img alt="" src="style/images/jdjctitle.gif" />
<div class="SubTop"></div>
    <div class="SubCenter" style=" line-height:30px;">
       <img alt="" src="style/images/online.gif" />
       <div class="subbody" style=" text-align:center; padding-bottom:50px;">
            <br />
            ---------------------------------------------------------------------------------------------------<br />
            请选择您想试读下载的电子刊物<br />
            <br />
            <span class="style2"><span class="style3"><a class="style6" 
                href="uploads/《建定建材》2013年12月刊试读版.exe">“上海《建定建材》”2013年12月电子（试读）版</a><br />
            <br />
            </span></span></div>
       <div class="subfoot"></div>
    </div>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>
