<% @ Control language="c#" Inherits="PageAdmin.navigation" %>   
 <asp:Repeater id="DL_lanmu2"  runat="server"    OnItemDataBound="Data_Bound">
   <ItemTemplate>
   <asp:PlaceHolder id="Holder" runat="server"/>
   <asp:Label id="Lb_type" Text='<%#DataBinder.Eval(Container.DataItem,"thetype")%>' runat="server" Visible="false"/>
   <asp:Label id="Lb_id" Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server" Visible="false"/>
   <asp:Label id="Lb_lanmu2" Text='<%#DataBinder.Eval(Container.DataItem,"lanmu2")%>' runat="server" Visible="false"/>
   <asp:Label id="Lb_ModelId" Text='<%#DataBinder.Eval(Container.DataItem,"zdymodel_id")%>' runat="server" Visible="false"/>
   </ItemTemplate>
</asp:Repeater>
