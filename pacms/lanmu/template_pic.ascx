<% @ Control  language="c#" Inherits="PageAdmin.template_pic" %>
<%=Template_StartHtml%>
<div id="Template_<%=_TemplateId%>" class="template_box<%=Layout%>" style="width:<%=Templath_Width%>;<%=Template_box_style%>">
<asp:PlaceHolder  id="P_Title"  runat="server">
<div class="template_title<%=Layout%>" style="<%=Template_titlebox_style%>"><span class="template_sign" style="<%=Template_title_style%>"><%=Lanmu_title%></span><span class="template_more"  style="display:<%=Show_more%>;<%=Template_more_style%>"><a href="<%=Pic_Url%>"  target="<%=Target%>">more</a></span></div>
</asp:PlaceHolder>
<asp:PlaceHolder id="P_Header"  runat="server" Visible="false"><div  class="template_header"><%=Templath_Header%></div></asp:PlaceHolder>
<div class="template_box_1<%=Layout%>" style="<%=Template_box_1_style%>">
<div id="Template_Content_<%=_TemplateId%>"  class="template_pic_box" style="<%=Template_content_style%>">
<TABLE cellSpacing="0" cellPadding="0" align="center" border="0" cellspace="0" width="100%">
<TBODY>
<TR><TD vAlign=top id="Template_Content_1_<%=_TemplateId%>" width="100%" align="center">
<asp:DataList id="DL_List_1" border="0"  RepeatLayout="table" cellpadding="0" cellspacing="0" width="100%" RepeatDirection="Horizontal" HorizontalAlign="center"  runat="server" visible="false">
   <ItemTemplate>
    <ul  style="<%=Template_list_style%>"  title=" <%#DataBinder.Eval(Container.DataItem,"name").ToString().Replace("\"","&#34")%> ">
    <li  class="template_pic_1"><a href="<%#Get_Prod_Url(DataBinder.Eval(Container.DataItem,"lanmu1id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu3id").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString())%>"  target="<%=Target%>"><img src='<%#DataBinder.Eval(Container.DataItem,"thumbnail")%>'   border="0" class="template_pic_image"  style="<%=ImageStyle%>"></a></li>
    <li  class="template_pic_2" style="display:<%=Pic_Name_Show%>;"><a href="<%#Get_Prod_Url(DataBinder.Eval(Container.DataItem,"lanmu1id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu3id").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString())%>"  target="<%=Target%>"><%#Get_title_num(DataBinder.Eval(Container.DataItem,"name").ToString(),true)%></a></li>
    <li class="template_pic_spacing" style="display:<%=Pic_Spacing%>"></li>
    </ul>
   </ItemTemplate>
</asp:DataList>
<asp:DataList id="DL_List_2" border="0" RepeatLayout="table" width="100%" cellpadding="0" cellspacing="0"  RepeatDirection="Horizontal" HorizontalAlign="center"  runat="server"  visible="false">
   <ItemTemplate>
    <ul  style="<%=Template_list_style%>"  title=" <%#DataBinder.Eval(Container.DataItem,"title").ToString().Replace("\"","&#34")%> ">
    <li  class="template_pic_1"><a href="<%#Get_Infor_Url(DataBinder.Eval(Container.DataItem,"lanmu1id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu3id").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString(),DataBinder.Eval(Container.DataItem,"url").ToString())%>"  target="<%=Target%>"><img src='<%#DataBinder.Eval(Container.DataItem,"thumbnail")%>'  border="0"  class="template_pic_image" style="<%=ImageStyle%>"></a></li>
    <li  class="template_pic_2"  style="display:<%=Pic_Name_Show%>"><a href="<%#Get_Infor_Url(DataBinder.Eval(Container.DataItem,"lanmu1id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu3id").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString(),DataBinder.Eval(Container.DataItem,"url").ToString())%>"  target="<%=Target%>"  style="<%#DataBinder.Eval(Container.DataItem,"title_style")%>"><%#Get_title_num(DataBinder.Eval(Container.DataItem,"title").ToString(),true)%></a></li>
    <li class="template_pic_spacing" style="display:<%=Pic_Spacing%>"></li>
  </ul>
   </ItemTemplate>

</asp:DataList>
</TD>
<asp:PlaceHolder id="Marquee_Td2" runat="server" visible="false">
<TD  vAlign=top id="Template_Content_2_<%=_TemplateId%>"  align="center"></TD>
</asp:PlaceHolder>
</TR>
</TBODY>
</TABLE>
</div>
</div>
</div>
<asp:PlaceHolder id="Marquee_Set" runat="server" visible="false">
<script type="text/javascript">
var TMRoll_<%=_TemplateId%>=new PARoll
(
{
speed:30,
box:"Template_Content_<%=_TemplateId%>",
box1:"Template_Content_1_<%=_TemplateId%>",
box2:"Template_Content_2_<%=_TemplateId%>",
objname:"TMRoll_<%=_TemplateId%>",
width:"",
height:"",
direction:"left"
}
)
</script>
</asp:PlaceHolder>
<%=Template_EndHtml%>
