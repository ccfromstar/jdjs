<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="yqlinks.ascx.cs" Inherits="JDJS.Web.Controls.yqlinks" %>

<div id="link2">
   <!--<div class="styleyqindex1">友情链接： </div>-->
   <br/>
   <div class="link-tl"></div>
    <div class="yqlink-bd">
    
        <ul class="entyqul">
        <asp:Repeater ID="RepLink2" runat="server">
        <ItemTemplate>
           <li>  <a href="http://<%#Eval("url") %>" target="_blank" title="<%#Eval("company") %>"><%#LTP.Common.StringPlus.StrCut(Eval("company").ToString(),26,"...") %></a></li>
        </ItemTemplate>
        </asp:Repeater>
        </ul>
    </div>
   <div class="link-ft"></div>
</div>