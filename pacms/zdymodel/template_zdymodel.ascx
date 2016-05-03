<% @ Control  language="c#" Inherits="PageAdmin.template_zdymodel" %>
<%=Template_StartHtml%>
<div id="Module_<%=_TemplateId%>" class="template_box<%=Layout%>"   style="width:<%=Template_Width%>;<%=Template_box_style%>">
<asp:PlaceHolder  id="P_Title"  runat="server">
<div class="template_title<%=Layout%>" style="<%=Template_titlebox_style%>"><span class="template_sign" style="<%=Template_title_style%>"><%=Template_Title%></span><span class="template_more"  style="display:<%=Show_more%>;<%=Template_more_style%>"><a href="<%=Template_Url%>" class="amore">more</a></span></div>
</asp:PlaceHolder>
<asp:PlaceHolder id="P_Header"  runat="server" Visible="false"><div  class="template_header"><%=Template_Header%></div></asp:PlaceHolder>
<asp:PlaceHolder  id="P_Content"  runat="server">
<div class="template_box_1<%=Layout%>"  style="<%=Template_box_1_style%>">
<div class="template_introduct_content" style="<%=Template_content_style%>">
      {pa:model_header}
  <asp:Repeater id="List"  runat="server">
   <ItemTemplate>
      {pa:model_list}
   </ItemTemplate>
   </asp:Repeater>
      {pa:model_bottom}
</div>
</div>
</asp:PlaceHolder>
</div>

