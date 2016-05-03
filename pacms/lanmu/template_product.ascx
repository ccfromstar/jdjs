<% @ Control  language="c#" Inherits="PageAdmin.template_product"%>
<%=Template_StartHtml%>
<div id="Template_<%=_TemplateId%>" class="template_box<%=Layout%>" style="width:<%=Templath_Width%>;<%=Template_box_style%>">
<asp:PlaceHolder  id="P_Title"  runat="server">
<div class="template_title<%=Layout%>"  style="<%=Template_titlebox_style%>"><span class="template_sign" style="<%=Template_title_style%>"><%=Lanmu_title%></span><span class="template_more"  style="display:<%=Show_more%>;<%=Template_more_style%>"><a href="<%=More_Url%>" target="<%=Target%>">more</a></span></div>
</asp:PlaceHolder>
<asp:PlaceHolder id="P_Header"  runat="server" Visible="false"><div  class="template_header"><%=Templath_Header%></div></asp:PlaceHolder>
<div class="template_box_1<%=Layout%>"  style="<%=Template_box_1_style%>">

<asp:PlaceHolder id="P1" runat="server" visible="false">
<div id="Template_Content_<%=_TemplateId%>"  class="template_list_box" style="<%=Template_content_style%>">
<asp:Repeater id="RP_1"  runat="server"  visible="false">
   <ItemTemplate>
      <ul class="template_list_title_box" style="<%=Template_list_style%>"  title=" <%#DataBinder.Eval(Container.DataItem,"name").ToString().Replace("\"","&#34")%> ">
       <li class="template_list_title_left"><a href="<%#GetUrl(DataBinder.Eval(Container.DataItem,"lanmu1id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu3id").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString())%>"  class="a_template_list_title"  target="<%=Target%>"><%#Get_title_num(DataBinder.Eval(Container.DataItem,"name").ToString(),true)%></a></li>
       <li class="template_list_title_right"><span style="display:<%=Date_Show%>"><%#DataBinder.Eval(Container.DataItem,"thedate","{0:yyyy-MM-dd}")%></span></li>
     </ul>
  </ItemTemplate>
</asp:Repeater>
</div>
</asp:PlaceHolder>

<asp:PlaceHolder id="P2" runat="server" visible="false">
<table border=0 cellpadding="0" cellspacing="0" width="100%" style="<%=Template_content_style%>">
 <tr><td class="template_list_box_left"><%=Product_Content%></td>
 <td id="Template_Content_<%=_TemplateId%>" class="template_list_box_right" valign="top">
<asp:Repeater id="RP_2"  runat="server"  visible="false">
   <ItemTemplate>
      <ul   class="template_list_title_box" style="<%=Template_list_style%>" title=" <%#DataBinder.Eval(Container.DataItem,"name").ToString().Replace("\"","&#34")%> ">
       <li class="template_list_title_left"><a href="<%#GetUrl(DataBinder.Eval(Container.DataItem,"lanmu1id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu3id").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString())%>"   class="a_template_list_title"  target="<%=Target%>"><%#Get_title_num(DataBinder.Eval(Container.DataItem,"name").ToString(),true)%></a></li>
       <li class="template_list_title_right"><span style="display:<%=Date_Show%>"><%#DataBinder.Eval(Container.DataItem,"thedate","{0:yyyy-MM-dd}")%></span></li>
     </ul>
  </ItemTemplate>
</asp:Repeater>
</td>
</tr>
</table>
</asp:PlaceHolder>
</div>
</div>


