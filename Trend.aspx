<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Trend.aspx.cs" Inherits="JDJS.Web.Trend" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div class="SubMain">
    <img alt="" src="style/images/Market-tl.gif" />
<div class="SubTop"></div>
    <div class="SubCenter">
       <img alt="" src="style/images/Trend-tl.gif" /><div class="subbody">
            <ul class="subbdul">
                <asp:Repeater ID="RepInfo" runat="server">
                <ItemTemplate>
                    <li><span>[<%#Eval("update","{0:yyyy-MM-dd}")%>]</span><a href="/html/<%#Eval("link")%>.html" title="<%#Eval("title") %>"><%#LTP.Common.StringPlus.StrCut(Eval("title").ToString(),82,"...") %></a><%#NewStr(Eval("update", "{0:yyyy-MM-dd}").ToString())%></li>
                </ItemTemplate>
                </asp:Repeater>
            </ul>
       </div>
       <div class="subfoot"></div>
       <uc1:UcfarPager ID="Pager" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
    </div>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>
