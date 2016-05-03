<% @ Control language="c#" Inherits="PageAdmin.banner"%>
<asp:PlaceHolder id="Holder1" runat="server">
<style type="text/css">
.banner_background{width:<%=Banner_Image_Width%>px;height:<%=Banner_Image_Height%>px;background:url(<%=Banner_Image_Url%>) no-repeat 0 0;}
</style> 
<div class="banner_box" id="banner_box">
<div class="banner_background"><%=Banner_Content%></div>
</div>

</asp:PlaceHolder>

<asp:PlaceHolder id="Holder2" runat="server">
<div class="banner_box" id="banner_box"><%=Lanmu_Banner%></div>
</asp:PlaceHolder>

<asp:PlaceHolder id="Holder3" runat="server">
<div class="banner_small_box" id="banner_small_box"><%=Lanmu_Small_Banner%></div>
</asp:PlaceHolder>
