<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="indexmat.ascx.cs" Inherits="JDJS.Web.Controls.indexmat" %>

<div style="width:785px;float:left; border:1px #004fa8 solid;">
    

        <ul class="matspecialul">
        <asp:Repeater ID="matspecial" runat="server" 
            onitemdatabound="matspecial_ItemDataBound">
        <ItemTemplate>
          <li> <a  href="Matitempage.aspx?specialCode=<%#Eval("specialCode")%>" target="_self"title="<%#Eval("name") %>"><%#LTP.Common.StringPlus.StrCut(Eval("name").ToString(), 22, "...")%></a>
  
          </li>

          <ul class="indexmatul2">
                    <asp:Repeater ID="matitem" runat="server">
                        <ItemTemplate>
                            <li> <a href="Seach.aspx?specialCode=<%#Eval("specialCode") %>&midcode=<%#Eval("itemcode") %>" target="_self" title="<%#Eval("name") %>">|<%#LTP.Common.StringPlus.StrCut(Eval("name").ToString(), 16, "...")%>|</a></li>                             
                        </ItemTemplate>
                    </asp:Repeater>
        
          </ul>      
        </ItemTemplate>
         </asp:Repeater>
        </ul>
</div>