<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="dsyqlinks.ascx.cs" Inherits="JDJS.Web.Controls.dsyqlinks" %>

<div class="dslefttit">  
       友情链接
</div>
<div  class="leftzcdwul">
       
        <ul>
        
        <asp:Repeater ID="RepLink" runat="server">
        <ItemTemplate>
          
          <li>  <a href="http://<%#Eval("url") %>" target="_blank" title="<%#Eval("company") %>"><%#LTP.Common.StringPlus.StrCut(Eval("company").ToString(),30,"...") %></a></li>
        </ItemTemplate>
        </asp:Repeater>
        </ul>
 </div>