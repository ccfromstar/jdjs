<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="JDJS.Web.Project" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div class="SubMain">
    <img alt="" src="style/images/Project-tl.gif" />
    <div class="SubCenter">
       <div class="subtitle"  style=" background:url(style/images/Project-md1.gif);"><span><a href="ProjectList.aspx?Part=1">更多>></a></span></div>
       <div class="subbody">
            <ul class="subbdul">
                <asp:Repeater ID="RepInfo1" runat="server">
                <ItemTemplate>
                    <li><span>[<%#Eval("发布日期", "{0:yyyy-MM-dd}")%>]</span><a href="ProjectDetail.aspx?Part=1&Id=<%#Eval("序号") %>" title="<%#Eval("项目名称") %>"><%#LTP.Common.StringPlus.StrCut(Eval("项目名称").ToString(), 82, "...")%></a><%#NewStr(Eval("发布日期", "{0:yyyy-MM-dd}").ToString())%></li>
                </ItemTemplate>
                </asp:Repeater>
            </ul>
       </div>
       <div class="subfoot"></div>
    </div>
    <div class="SubCenter">
       <div class="subtitle" style=" background:url(style/images/Project-md2.gif);"><span><a href="ProjectList.aspx?Part=2">更多>></a></span></div>
       <div class="subbody">
            <ul class="subbdul">
            <asp:Repeater ID="RepInfo2" runat="server">
                <ItemTemplate>
                    <li><span>[<%#Eval("发布日期", "{0:yyyy-MM-dd}")%>]</span><a href="ProjectDetail.aspx?Part=2&Id=<%#Eval("序号") %>" title="<%#Eval("项目名称") %>"><%#LTP.Common.StringPlus.StrCut(Eval("项目名称").ToString(), 82, "...")%></a><%#NewStr(Eval("发布日期", "{0:yyyy-MM-dd}").ToString())%></li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
       </div>
       <div class="subfoot"></div>
    </div>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>

