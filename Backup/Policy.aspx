<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Policy.aspx.cs" Inherits="JDJS.Web.Policy" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div class="SubMain">
    <img alt="" src="style/images/Policy-tl.gif" />
    
    <div class="SubCenter">
       <div class="subtitle"  style=" background:url(style/images/Policy-md1.gif);"><span><a href="PolicyList.aspx?Part=1">更多>></a></span>
    <ul class="SubToplist">
        <li><a href="PolicyList.aspx?Part=1&Sort=法律">法律</a></li>
        <li><a href="PolicyList.aspx?Part=1&Sort=行政法规">行政法规</a></li>
        <li><a href="PolicyList.aspx?Part=1&Sort=部门规章">部门规章</a></li>
        <li><a href="PolicyList.aspx?Part=1&Sort=地方性法规和规章">地方性法规和规章</a></li>
        <li><a href="PolicyList.aspx?Part=1&Sort=各类文件">各类文件</a></li>
    </ul>
    </div>
       <div class="subbody">
            <ul class="subbdul">
                <asp:Repeater ID="RepInfo1" runat="server">
                <ItemTemplate>
                    <li><span>[<%#Eval("ptime","{0:yyyy-MM-dd}")%>]</span><a href="PolicyList.aspx?Part=1&Id=<%#Eval("id") %>" title="<%#Eval("title") %>"><%#LTP.Common.StringPlus.StrCut(Eval("title").ToString(), 82, "...")%></a><%#NewStr(Eval("ptime", "{0:yyyy-MM-dd}").ToString())%></li>
                </ItemTemplate>
                </asp:Repeater>
            </ul>
       </div>
       <div class="subfoot"></div>
    </div>
    <div class="SubCenter">
       <div class="subtitle" style=" background:url(style/images/Policy-md2.gif);"><span><a href="PolicyList.aspx?Part=2">更多>></a></span>
        <ul class="SubToplist">
            <li><a href="PolicyList.aspx?Part=2&Sort=最新公告">最新公告</a></li>
            <li><a href="PolicyList.aspx?Part=2&Sort=通知提示">通知提示</a></li>
            <li><a href="PolicyList.aspx?Part=2&Sort=诚信手册">诚信手册</a></li>
            <li><a href="PolicyList.aspx?Part=2&Sort=安全生产许可证">安全生产许可证</a></li>
        </ul>
        </div>
       <div class="subbody">
            <ul class="subbdul">
            <asp:Repeater ID="RepInfo2" runat="server">
                <ItemTemplate>
                    <li><span>[<%#Eval("ptime","{0:yyyy-MM-dd}")%>]</span><a href="PolicyDetail.aspx?Part=2&Id=<%#Eval("id") %>" title="<%#Eval("title") %>"><%#LTP.Common.StringPlus.StrCut(Eval("title").ToString(), 82, "...")%></a><%#NewStr(Eval("ptime", "{0:yyyy-MM-dd}").ToString())%></li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
       </div>
       <div class="subfoot"></div>
    </div>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>
