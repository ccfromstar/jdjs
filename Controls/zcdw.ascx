<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="zcdw.ascx.cs" Inherits="JDJS.Web.Controls.zcdw" %>

<div class="leftzcdw"> 
        <div></div> 
        <asp:Label ID="Label1" runat="server" Text="支持单位(排名不分先后)：" ForeColor="Blue" Font-Bold="True"></asp:Label>
</div>
<div  class="leftzcdwul">
    <div></div>    
    <asp:DropDownList ID="DropDownListzcdw" runat="server" AutoPostBack="True" 
        onselectedindexchanged="DropDownListzcdw_SelectedIndexChanged" Width="200px">
   
    </asp:DropDownList>
        
        <!--<ul>
        
        <asp:Repeater ID="RepLink" runat="server">
        <ItemTemplate>
          
          <li>  <a href="http://<%#Eval("url") %>" target="_blank" title="<%#Eval("company") %>"><%#LTP.Common.StringPlus.StrCut(Eval("company").ToString(),30,"...") %></a></li>
        </ItemTemplate>
        </asp:Repeater>
        </ul>-->
 </div>