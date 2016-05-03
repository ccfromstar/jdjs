<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="notice.ascx.cs" Inherits="JDJS.Web.Controls.notice" %>
<div id="notice" style=" height:80px" class="notice">
    <ul class="notice">
        <asp:Repeater ID="repnotice" runat="server">
            <ItemTemplate>
                <li><a href="NewsDetail.aspx?Part=5&Id=<%# Eval("id") %>" title="<%# Eval("title") %>"><%# LTP.Common.StringPlus.StrCut(Eval("title").ToString(),23,"...")%></a><%#NewStr(Eval("ptime", "{0:yyyy-MM-dd}").ToString())%></li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>