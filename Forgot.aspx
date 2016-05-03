<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Forgot.aspx.cs" Inherits="JDJS.Web.Forgot" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div class="SubMain">
    <img alt="" src="style/images/user-tl.gif" />
 <div class="SubCenter">
    <div style=" width:624px; margin:auto; height:500px; padding-top:30px;">
      <img src="style/images/forget.gif" alt="" border="0" usemap="#Map" />
     <map name="Map" id="Map">
       <area shape="rect" coords="496, 4, 621, 34" href="javascript:history.go(-1);" />
     </map>
     </div>
 </div>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>
