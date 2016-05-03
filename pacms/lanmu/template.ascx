<% @ Control language="c#" Inherits="PageAdmin.template" %>
 <asp:Repeater id="DL_template"  runat="server"  OnItemDataBound="Data_Bound">
   <ItemTemplate>
   <%#DataBinder.Eval(Container.DataItem,"starthtml")%><asp:PlaceHolder id="Holder" runat="server"/><%#DataBinder.Eval(Container.DataItem,"endhtml")%>
   <asp:Label id="Lb_type" Text='<%#DataBinder.Eval(Container.DataItem,"thetype")%>' runat="server" Visible="false"/>
   <asp:Label id="Lb_id" Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server" Visible="false"/>
   <asp:Label id="Lb_ModelId" Text='<%#DataBinder.Eval(Container.DataItem,"zdymodel_id")%>' runat="server" Visible="false"/>
   </ItemTemplate>
</asp:Repeater>
