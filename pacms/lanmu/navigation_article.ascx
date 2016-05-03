<% @ Control  language="c#" Inherits="PageAdmin.navigation_article"%>
<div id="Nav_<%=_Lanmu2Id%>" class="nav_box" style="<%=Nav_box_style%>">
<asp:PlaceHolder  id="P_Title"  runat="server">
<div class="nav_title" style="<%=Nav_titlebox_style%>"><span class="nav_sign" style="<%=Nav_title_style%>"><%=Lanmu_title%></span><span class="nav_more" style="display:<%=Show_more%>;<%=Nav_more_style%>"><a href="<%=Information_Url%>"  target="<%=Target%>">more</a></span></div>
</asp:PlaceHolder>
<asp:PlaceHolder id="P_Header"  runat="server" Visible="false"><div  class="nav_header"><%=Nav_Header%></div></asp:PlaceHolder>
<div id="Nav_Conent_<%=_Lanmu2Id%>" class="nav_list"   style="<%=Nav_content_style%>">
<asp:PlaceHolder id="P_marquee1" runat="server" Visible="false">
<div id="Nav_Demo_<%=_Lanmu2Id%>" style="height:<%=Nav_Height%>px"><div  id="Nav_Demo_1_<%=_Lanmu2Id%>">
</asp:PlaceHolder>
<asp:Repeater id="Repeater_1"  runat="server"  visible="false">
    <HeaderTemplate>
     <ul id="Nav_Tj_<%=_Lanmu2Id%>">
    </HeaderTemplate>
   <ItemTemplate>
    <li  class="nav_list_tj_box"><a href="<%#GetUrl(DataBinder.Eval(Container.DataItem,"lanmu1id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu3id").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString(),DataBinder.Eval(Container.DataItem,"url").ToString())%>"   target="<%=Target%>"><img src="<%#Get_Image(DataBinder.Eval(Container.DataItem,"thumbnail").ToString())%>" border="0" class="nav_list_tj_image" style="display:<%#Images_Exists(DataBinder.Eval(Container.DataItem,"thumbnail").ToString())%>;<%=ImageStyle%>"></a>
    <a href="<%#GetUrl(DataBinder.Eval(Container.DataItem,"lanmu1id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu3id").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString(),DataBinder.Eval(Container.DataItem,"url").ToString())%>"   target="<%=Target%>" class="nav_list_tj_title"  style="<%#DataBinder.Eval(Container.DataItem,"title_style")%>"><%#Server.HtmlEncode(DataBinder.Eval(Container.DataItem,"title").ToString())%></a>
    <br><%#DataBinder.Eval(Container.DataItem,"introduction")%>
    </li>
  </ItemTemplate>
    <FooterTemplate>
      </ul>
    </FooterTemplate>
</asp:Repeater>

<asp:Repeater id="Repeater_2"   runat="server" visible="false">
    <HeaderTemplate>
     <ul id="Nav_Normal_<%=_Lanmu2Id%>">
    </HeaderTemplate>
   <ItemTemplate>
    <li class="nav_list_style_1"  style="<%=Nav_list_style%>" title=" <%#DataBinder.Eval(Container.DataItem,"title").ToString().Replace("\"","&#34")%> ">
    <a href="<%#GetUrl(DataBinder.Eval(Container.DataItem,"lanmu1id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu3id").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString(),DataBinder.Eval(Container.DataItem,"url").ToString())%>" class="nav_list_title"  target="<%=Target%>" style="<%#DataBinder.Eval(Container.DataItem,"title_style")%>"><%#Get_title_num(DataBinder.Eval(Container.DataItem,"title").ToString(),true)%></a><span class="nav_list_date" style="display:<%=Date_Show%>">&nbsp;[<%#DataBinder.Eval(Container.DataItem,"thedate","{0:MM-dd}")%>]</span>
    </li>
   </ItemTemplate>
    <FooterTemplate>
      </ul>
    </FooterTemplate>
</asp:Repeater>

<asp:Repeater id="Repeater_3"   runat="server" Visible="false">
    <HeaderTemplate>
     <ul id="Nav_Normal_<%=_Lanmu2Id%>">
    </HeaderTemplate>
   <ItemTemplate>
    <li class="nav_list_style_2" style="<%=Nav_list_style%>" title=" <%#DataBinder.Eval(Container.DataItem,"title").ToString().Replace("\"","&#34")%> ">
    <a href="<%#GetUrl(DataBinder.Eval(Container.DataItem,"lanmu1id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu3id").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString(),DataBinder.Eval(Container.DataItem,"url").ToString())%>" target="<%=Target%>"><img src="<%#DataBinder.Eval(Container.DataItem,"thumbnail")%>" border="0"   class="nav_list_image" style="<%=ImageStyle%>"></a>
    <br><a href="<%#GetUrl(DataBinder.Eval(Container.DataItem,"lanmu1id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu3id").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString(),DataBinder.Eval(Container.DataItem,"url").ToString())%>" class="nav_list_title"  target="<%=Target%>" style="<%#DataBinder.Eval(Container.DataItem,"title_style")%>"><%#Get_title_num(DataBinder.Eval(Container.DataItem,"title").ToString(),true)%></a>
    </li>
   </ItemTemplate>
    <FooterTemplate>
      </ul>
    </FooterTemplate>
</asp:Repeater>
<asp:PlaceHolder id="P_marquee2" runat="server" Visible="false">
</div><div id="Nav_Demo_2_<%=_Lanmu2Id%>"></div></div>
</asp:PlaceHolder>
</div>
</div>
<asp:PlaceHolder id="P_marquee_set" runat="server" Visible="false">
<script type="text/javascript">
var NavRoll_<%=_Lanmu2Id%>=new PARoll
(
{
speed:80,
box:"Nav_Demo_<%=_Lanmu2Id%>",
box1:"Nav_Demo_1_<%=_Lanmu2Id%>",
box2:"Nav_Demo_2_<%=_Lanmu2Id%>",
objname:"NavRoll_<%=_Lanmu2Id%>",
width:"",
height:"",
direction:"top"
}
)
</script>
</asp:PlaceHolder>


