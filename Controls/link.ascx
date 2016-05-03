<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="link.ascx.cs" Inherits="JDJS.Web.Controls.link" %>
<div id="link">
    <div class="link-tl"></div>
    <div class="yqlink-bd">
            
<%--        <img style=" width:24px; height:66px;" src="style/images/link.gif" />--%>
        
        
        <ul class="entyqul">
        <li><asp:Label ID="Label1" runat="server" Text="支持单位(排名不分先后)：" ForeColor="Blue" Font-Bold="True"></asp:Label></li>
        <asp:Repeater ID="RepLink" runat="server">
        <ItemTemplate>
          <%-- <a href='<%#Eval("url") %>'><img style=" border:1px #bdbdbd solid" alt="" src='uploads/<%#Eval("img") %>' /></a>--%>
          
          <li>  <a href="http://<%#Eval("url") %>" target="_blank" title="<%#Eval("company") %>"><%#LTP.Common.StringPlus.StrCut(Eval("company").ToString(),26,"...") %></a></li>
        </ItemTemplate>
        </asp:Repeater>
        </ul>
    </div>
    <div class="link-ft"></div>
</div>