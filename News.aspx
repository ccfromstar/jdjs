<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="JDJS.Web.News" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div class="SubMain">
    <img alt="" src="style/images/News-tl.gif" />
    <div class="SubCenter">
       <div class="subtitle"  style=" background:url(style/images/new-md1.gif);"><span><a href="NewsList.aspx?Part=1">更多>></a></span></div>
       <div class="subbody">
            <ul class="subbdul">
                <asp:Repeater ID="RepInfo1" runat="server">
                <ItemTemplate>
                    <li><span>[<%#Eval("ptime","{0:yyyy-MM-dd}")%>]</span><a href="NewsDetail.aspx?Part=1&Id=<%#Eval("id") %>" title="<%#Eval("title") %>"><%#LTP.Common.StringPlus.StrCut(Eval("title").ToString(),82,"...") %></a><%#NewStr(Eval("ptime", "{0:yyyy-MM-dd}").ToString())%></li>
                </ItemTemplate>
                </asp:Repeater>
            </ul>
       </div>
       <div class="subfoot"></div>
    </div>
    <div class="SubCenter">
       <div class="subtitle" style=" background:url(style/images/new-md2.gif);"><span><a href="NewsList.aspx?Part=2">更多>></a></span></div>
       <div class="subbody">
            <ul class="subbdul">
            <asp:Repeater ID="RepInfo2" runat="server">
                <ItemTemplate>
                    <li><span>[<%#Eval("ptime","{0:yyyy-MM-dd}")%>]</span><a href="NewsDetail.aspx?Part=2&Id=<%#Eval("id") %>" title="<%#Eval("title") %>"><%#LTP.Common.StringPlus.StrCut(Eval("title").ToString(),82,"...") %></a><%#NewStr(Eval("ptime", "{0:yyyy-MM-dd}").ToString())%></li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
       </div>
       <div class="subfoot"></div>
    </div>
    <div class="SubCenter">
       <div class="subtitle"  style=" background:url(style/images/new-md3.gif);"><span><a href="NewsList.aspx?Part=3">更多>></a></span></div>
       <div class="subbody">
            <ul class="subbdul">
            <asp:Repeater ID="RepInfo3" runat="server">
                <ItemTemplate>
                    <li><span>[<%#Eval("ptime","{0:yyyy-MM-dd}")%>]</span><a href="NewsDetail.aspx?Part=3&Id=<%#Eval("id") %>" title="<%#Eval("title") %>"><%#LTP.Common.StringPlus.StrCut(Eval("title").ToString(),82,"...") %></a><%#NewStr(Eval("ptime", "{0:yyyy-MM-dd}").ToString())%></li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
       </div>
       <div class="subfoot"></div>
    </div>
    <div class="SubCenter">
       <div class="subtitle"  style=" background:url(style/images/new-md4.gif);"><span><a href="NewsList.aspx?Part=4">更多>></a></span></div>
       <div class="subbody">
            <ul class="subbdul">
            <asp:Repeater ID="RepInfo4" runat="server">
                <ItemTemplate>
                    <li><span>[<%#Eval("ptime","{0:yyyy-MM-dd}")%>]</span><a href="NewsDetail.aspx?Part=4&Id=<%#Eval("id") %>" title="<%#Eval("title") %>"><%#LTP.Common.StringPlus.StrCut(Eval("title").ToString(),82,"...") %></a><%#NewStr(Eval("ptime", "{0:yyyy-MM-dd}").ToString())%></li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
       </div>
       <div class="subfoot"></div>
    </div>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>

