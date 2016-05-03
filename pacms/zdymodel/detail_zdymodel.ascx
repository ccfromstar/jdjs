<% @ Control language="c#" Inherits="PageAdmin.detail_zdymodel"%>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1"><%=Site_Tag%> &gt; <%=Lanmu_site%></li>
<li class="uc_lanmu_site_2"><%=Lanmu_3%></li>
</ul>
</div>
<div class="uc_lanmu_content">
      {pa:model_header}
  <asp:Repeater id="List"  runat="server">
   <ItemTemplate>
      {pa:model_list}
   </ItemTemplate>
   </asp:Repeater>
      {pa:model_bottom}
<br>
<asp:PlaceHolder id="Show_Comments" runat="server"  Visible="false" />
</div>
</div>
 