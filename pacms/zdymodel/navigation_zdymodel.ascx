<% @ Control  language="c#" Inherits="PageAdmin.navigation_zdymodel" %>
<div id="Navigation_<%=_Lanmu2Id%>"  class="nav_box"  style="<%=Nav_box_style%>">
<asp:PlaceHolder  id="P_Title"  runat="server">
<div class="nav_title" style="<%=Nav_titlebox_style%>"><span class="nav_sign" style="<%=Nav_title_style%>"><%=Lanmu_Title%></span><span class="nav_more"  style="display:<%=Show_more%>;<%=Nav_more_style%>"><a href="<%=Lanmu_Url%>" class="amore">more</a></span></div>
</asp:PlaceHolder>
<asp:PlaceHolder id="P_Header"  runat="server" Visible="false"><div  class="nav_header"><%=Nav_Header%></div></asp:PlaceHolder>
<div class="nav_content" style="<%=Nav_content_style%>">
      {pa:model_header}
  <asp:Repeater id="List"  runat="server">
   <ItemTemplate>
      {pa:model_list}
   </ItemTemplate>
   </asp:Repeater>
      {pa:model_bottom}
</div>
</div>

