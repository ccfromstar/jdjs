<% @ Control Inherits="PageAdmin.lanmu_style"%>
<% @ Register TagPrefix="aspcn" TagName="uc_navigation" src="~/lanmu/navigation.ascx" %>
<% @ Register TagPrefix="aspcn" TagName="uc_banner" src="~/incs/banner.ascx" %>
<script   type="text/javascript"> 
<!--
var Lanmu2_id="<%=Lanmu2_id%>";
var Lanmu3_id="<%=Lanmu3_id%>";
--> 
</script>
<aspcn:uc_banner  runat="server" id="banner" thetype="banner"/>
<div class="lanmu_box_style1" id="<%=LanmuType%>_style1">
<div class="lanmu_box_style1_left" id="<%=LanmuType%>_style1_left"><aspcn:uc_navigation Layout="0"  runat="server" /></div>
<div class="lanmu_box_style1_right" id="<%=LanmuType%>_style1_right"><aspcn:uc_banner  runat="server" id="smallbanner"  thetype="smallbanner" /><asp:PlaceHolder id="holder" runat="server" /></div>
<div class="clear" id="<%=LanmuType%>_style1_bottom"></div>
</div>
<script   type="text/javascript"> 
<!-- 
   var lanmu_nav_menu=document.getElementById("Nav_Menu_<%=Lanmu2_id%>");  
   var   lanmu_nav_submenu=document.getElementById("Nav_submenu_<%=Lanmu3_id%>");    
   if(lanmu_nav_menu!=null)
    {
      lanmu_nav_menu.style.display="";
    }
   if(lanmu_nav_submenu!=null)
    {
      lanmu_nav_submenu.style.display="";
    }
-->   
</script>
