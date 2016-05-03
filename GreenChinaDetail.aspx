<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="GreenChinaDetail.aspx.cs" Inherits="JDJS.Web.GreenChinaDetail" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div class="SubMain">
    <img alt="" src="style/images/绿动中国2.gif" />
    <div class="SubCenter">
       <asp:Image ID="ImgBg" runat="server" /><div class="subbody">
           <asp:Panel ID="PanTl" runat="server">
                <%--<div class="detailtitle"><asp:Label ID="lbTitle" runat="server" ></asp:Label></div>--%>
                <div class="detailbody"><asp:Label ID="lbBody" runat="server" ></asp:Label></div>
           </asp:Panel>
           <asp:Panel ID="PanImg" runat="server" Visible="False">
               <div class="detailbody" style=" text-align:center;"><asp:Image ID="Img" runat="server" /></div>
           </asp:Panel>
       </div>
       <div class="subfoot"></div>
    </div>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
