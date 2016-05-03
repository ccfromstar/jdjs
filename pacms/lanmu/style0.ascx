<% @ Control Inherits="PageAdmin.lanmu_style"%>
<% @ Register TagPrefix="aspcn" TagName="uc_banner" src="~/incs/banner.ascx" %>
<aspcn:uc_banner  runat="server" id="banner" thetype="banner"/>
<div class="lanmu_box" id="<%=LanmuType%>_box">
<aspcn:uc_banner  runat="server" id="smallbanner"  thetype="smallbanner" /><asp:PlaceHolder id="holder" runat="server" />
</div>