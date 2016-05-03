<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="PolicyDetail.aspx.cs" Inherits="JDJS.Web.PolicyDetail" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div class="SubMain">
    <img alt="" src="style/images/Policy-tl.gif" />
    <div class="SubCenter">
       <asp:Image ID="ImgBg" runat="server" /><div class="subbody">
                <%--<div class="detailtitle"><asp:Label ID="lbTitle" runat="server" ></asp:Label></div>--%>
                <div class="detailbody"><asp:Label ID="lbBody" runat="server" ></asp:Label></div>
       </div>
       <div class="subfoot"></div>
    </div>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>
