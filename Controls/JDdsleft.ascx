<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="JDdsleft.ascx.cs" Inherits="JDJS.Web.Controls.JDdsleft" %>
<div style="width:200px;height:175px;text-align:center; padding-top:2px">
 <a target="_self" href="../ProjectGL/Login.aspx"><img alt="建定工程通入口" src="uploads/jdgct.jpg"  style=" border:none;"/></a>
</div>
<div class="JDdsleft">
    <ul>
        
        <asp:Repeater ID="RepJDds" runat="server">
        <ItemTemplate>
          
          <li>  <a href="http://<%#Eval("HtmlURL") %>" target="_blank" title="<%#Eval("HtmlTitle") %>"><%#LTP.Common.StringPlus.StrCut(Eval("Cmpname").ToString(), 30, "...")%></a></li>
        </ItemTemplate>
        </asp:Repeater>
     </ul>


</div>