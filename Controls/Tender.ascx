<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tender.ascx.cs" Inherits="JDJS.Web.Controls.Tender" %>
<div class="Tender">
<div class="alltitle"><a href="ProjectList.aspx?Part=1">更多>></a></div>
<div class="allbody">
    <ul class="allul">
    <asp:Repeater ID="RepTrade" runat="server">
    <ItemTemplate>
        <li><span>[<%#Eval("发布日期", "{0:yyyy-MM-dd}")%>]</span><a href="ProjectDetail.aspx?Part=1&Id=<%#Eval("序号") %>" title="<%#Eval("项目名称")%>"><%#LTP.Common.StringPlus.StrCut(Eval("项目名称").ToString(),35,"...")%></a><%#NewStr(Eval("发布日期", "{0:yyyy-MM-dd}").ToString())%></li>
    </ItemTemplate>
    </asp:Repeater>
    </ul>
</div>
</div>

