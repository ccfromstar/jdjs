<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="JDJS.Web.AboutUs" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            color: #0066FF;
            font-size: medium;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div class="SubMain">
    <img alt="" src="style/images/aboutus-tl.gif" />
    <div  style=" text-align:center; padding-top:50px;">
        <span ><span class="style2"><b>上海建定建设工程信息网隶属于上海标锭建设工程服务有限公司</b></span><br />
        
        <br />
        </span><br />
        <img alt="" src="uploads/aboutus.gif" />
    </div>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>

