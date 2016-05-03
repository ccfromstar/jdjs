<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="top2012.ascx.cs" Inherits="JDJS.Web.Controls.top2012" %>
<script type="text/javascript" src="/js/imagechange.js"></script>
<div id="top2012">
<div class="top">
<img style="width:210px;height:120px;float:left;border:1px #004fa8 solid ;border-right-width:0px;" alt="" src="style/images/blank.gif" />

<div style="width:790px; height:120px;float:left; border:1px #004fa8 solid;border-left-width:0px;">
        <ul class="topul">
        <asp:Repeater ID="matindex" runat="server">
        <ItemTemplate>
           <li>  <a  href="Matitempage.aspx?specialCode=<%#Eval("specialCode")%>" target="_self"title="<%#Eval("name") %>"><%#LTP.Common.StringPlus.StrCut(Eval("name").ToString(), 16, "...")%></a></li>
        </ItemTemplate>
        </asp:Repeater>
        </ul>
</div>
</div>
 
</div>