<% @ Control  language="c#" Inherits="PageAdmin.navigation_product"%>
<div id="Nav_<%=_Lanmu2Id%>" class="nav_box" style="<%=Nav_box_style%>">
<asp:PlaceHolder  id="P_Title"  runat="server">
<div class="nav_title" style="<%=Nav_titlebox_style%>"><span class="nav_sign" style="<%=Nav_title_style%>"><%=Lanmu_title%></span><span class="nav_more" style="display:<%=Show_more%>;<%=Nav_more_style%>"><a href="<%=Information_Url%>"  target="<%=Target%>">more</a></span></div>
</asp:PlaceHolder>
<asp:PlaceHolder id="P_Header"  runat="server" Visible="false"><div  class="nav_header"><%=Nav_Header%></div></asp:PlaceHolder>
<div id="Nav_Conent_<%=_Lanmu2Id%>"   class="nav_list" style="<%=Nav_content_style%>">
<asp:Repeater id="Repeater_1"   runat="server" Visible="false">
    <HeaderTemplate>
     <ul id="Nav_Normal_<%=_Lanmu2Id%>">
    </HeaderTemplate>
   <ItemTemplate>
    <li class="nav_list_style_1"  style="<%=Nav_list_style%>" title=" <%#DataBinder.Eval(Container.DataItem,"name").ToString().Replace("\"","&#34")%> ">
    <a href="<%#GetUrl(DataBinder.Eval(Container.DataItem,"lanmu1id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu3id").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString())%>" class="nav_list_title"  target="<%=Target%>"><%#Get_title_num(DataBinder.Eval(Container.DataItem,"name").ToString(),true)%></a>
    </li>
   </ItemTemplate>
    <FooterTemplate>
        </ul>
    </FooterTemplate>
</asp:Repeater>
<asp:Repeater id="Repeater_2"   runat="server" Visible="false">
    <HeaderTemplate>
     <ul id="Nav_Normal_<%=_Lanmu2Id%>">
    </HeaderTemplate>
   <ItemTemplate>
    <li class="nav_list_style_2"  style="<%=Nav_list_style%>" title=" <%#DataBinder.Eval(Container.DataItem,"name").ToString().Replace("\"","&#34")%> ">
    <p align=center><a href="<%#GetUrl(DataBinder.Eval(Container.DataItem,"lanmu1id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu3id").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString())%>" target="<%=Target%>"><img src="<%#Get_Image(DataBinder.Eval(Container.DataItem,"thumbnail").ToString())%>" border="0"   class="nav_list_image" style="<%=ImageStyle%>"></a></p>
    <p align=center><a href="<%#GetUrl(DataBinder.Eval(Container.DataItem,"lanmu1id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu3id").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString())%>" class="nav_list_title"  target="<%=Target%>"><%#Get_title_num(DataBinder.Eval(Container.DataItem,"name").ToString(),true)%></a></p>
    </li>
   </ItemTemplate>
    <FooterTemplate>
      </ul>
    </FooterTemplate>
</asp:Repeater>
<asp:PlaceHolder id="P_marquee" runat="server" Visible="false">
 <ul id="Nav_Copy_<%=_Lanmu2Id%>"></ul>
</asp:PlaceHolder>
</div>
</div>

<asp:PlaceHolder id="P_marquee_set" runat="server" Visible="false">
<script language=javascript>
var nav_speed_<%=_Lanmu2Id%>=100;
var ObjNav_<%=_Lanmu2Id%>=document.getElementById("Nav_Conent_<%=_Lanmu2Id%>");
var ObjNav1_<%=_Lanmu2Id%>=document.getElementById("Nav_Normal_<%=_Lanmu2Id%>");
var ObjNav2_<%=_Lanmu2Id%>=document.getElementById("Nav_Copy_<%=_Lanmu2Id%>");

ObjNav2_<%=_Lanmu2Id%>.innerHTML=ObjNav1_<%=_Lanmu2Id%>.innerHTML;
function Nav_Marquee_<%=_Lanmu2Id%>(){
if(ObjNav2_<%=_Lanmu2Id%>.offsetTop-ObjNav_<%=_Lanmu2Id%>.scrollTop<=0)
ObjNav_<%=_Lanmu2Id%>.scrollTop-=ObjNav1_<%=_Lanmu2Id%>.offsetHeight;
else{
ObjNav_<%=_Lanmu2Id%>.scrollTop++;
}
}
var NavVar_<%=_Lanmu2Id%>=setInterval(Nav_Marquee_<%=_Lanmu2Id%>,nav_speed_<%=_Lanmu2Id%>);
ObjNav_<%=_Lanmu2Id%>.onmouseover=function(){clearInterval(NavVar_<%=_Lanmu2Id%>)}
ObjNav_<%=_Lanmu2Id%>.onmouseout=function(){NavVar_<%=_Lanmu2Id%>=setInterval(Nav_Marquee_<%=_Lanmu2Id%>,nav_speed_<%=_Lanmu2Id%>)}
</script>
</asp:PlaceHolder>


