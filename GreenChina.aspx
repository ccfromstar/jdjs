<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="GreenChina.aspx.cs" Inherits="JDJS.Web.GreenChina" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div class="SubMain">
    <img alt="" src="style/images/绿动中国2.gif" />
    <div class="SubCenter">
       <div class="subtitle"  style=" background:url(style/images/应用案例.gif);"><span><a href="GreenChinaList.aspx?Part=6">更多>></a></span></div>
       <div class="subbody">
            <ul class="subbdul">
                <asp:Repeater ID="RepInfo1" runat="server">
                <ItemTemplate>
                    <li><span>[<%#Eval("ptime","{0:yyyy-MM-dd}")%>]</span><a href="GreenChinaDetail.aspx?Part=6&Id=<%#Eval("id") %>" title="<%#Eval("title") %>"><%#LTP.Common.StringPlus.StrCut(Eval("title").ToString(),82,"...") %></a><%#NewStr(Eval("ptime", "{0:yyyy-MM-dd}").ToString())%></li>
                </ItemTemplate>
                </asp:Repeater>
            </ul>
       </div>
       <div class="subfoot"></div>
    </div>
    <div class="SubCenter">
       <div class="subtitle"  style=" background:url(style/images/绿动态.gif);"><span><a href="GreenChinaList.aspx?Part=7">更多>></a></span></div>
       <div class="subbody">
            <ul class="subbdul">
            <asp:Repeater ID="RepInfo2" runat="server">
                <ItemTemplate>
                    <li><span>[<%#Eval("ptime","{0:yyyy-MM-dd}")%>]</span><a href="GreenChinaDetail.aspx?Part=7&Id=<%#Eval("id") %>" title="<%#Eval("title") %>"><%#LTP.Common.StringPlus.StrCut(Eval("title").ToString(),82,"...") %></a><%#NewStr(Eval("ptime", "{0:yyyy-MM-dd}").ToString())%></li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
       </div>
       <div class="subfoot"></div>
    </div>
    <div class="SubCenter">
       <div class="subtitle"  style=" background:url(style/images/协会奖项.gif);"><span><a href="GreenChinaList.aspx?Part=8">更多>></a></span></div>
       <div class="subbody">
            <ul class="subbdul">
            <asp:Repeater ID="RepInfo3" runat="server">
                <ItemTemplate>
                    <li><span>[<%#Eval("ptime","{0:yyyy-MM-dd}")%>]</span><a href="GreenChinaDetail.aspx?Part=8&Id=<%#Eval("id") %>" title="<%#Eval("title") %>"><%#LTP.Common.StringPlus.StrCut(Eval("title").ToString(),82,"...") %></a><%#NewStr(Eval("ptime", "{0:yyyy-MM-dd}").ToString())%></li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
       </div>
       <div class="subfoot"></div>
    </div>
    <div class="SubCenter">
       <div class="subtitle"  style=" background:url(style/images/绿标小贴士.gif);"><span><a href="GreenChinaList.aspx?Part=9">更多>></a></span></div>
       <div class="subbody">
            <ul class="subbdul">
            <asp:Repeater ID="RepInfo4" runat="server">
                <ItemTemplate>
                    <li><span>[<%#Eval("ptime","{0:yyyy-MM-dd}")%>]</span><a href="GreenChinaDetail.aspx?Part=9&Id=<%#Eval("id") %>" title="<%#Eval("title") %>"><%#LTP.Common.StringPlus.StrCut(Eval("title").ToString(),82,"...") %></a><%#NewStr(Eval("ptime", "{0:yyyy-MM-dd}").ToString())%></li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
       </div>
       <div class="subfoot"></div>
    </div>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
