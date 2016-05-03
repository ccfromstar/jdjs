<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="dsyqlinks.ascx.cs" Inherits="JDJS.Web.hongsheng.dsControls.dsyqlinks" %>

<div class="dslefttit">  
       友情链接
</div>
<div class="dsyqlink">  
        <ul>
           <asp:Repeater ID="RepLink" runat="server">
            <ItemTemplate>          
                <li>  <a href="http://<%#Eval("reurl") %>" target="_blank" title="<%#Eval("title") %>"><%#LTP.Common.StringPlus.StrCut(Eval("title").ToString(),30,"...") %></a></li>
            </ItemTemplate>
           </asp:Repeater>
        </ul>
     
 </div>