<% @ Control language="c#" Inherits="PageAdmin.search_zdymodel"%>
      {pa:model_header}
  <asp:Repeater id="List"  runat="server">
   <ItemTemplate>
      {pa:model_list}
   </ItemTemplate>
   </asp:Repeater>
      {pa:model_bottom}

 