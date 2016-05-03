<% @ Page language="c#" Inherits="PageAdmin.member"%>
<% @ Register TagPrefix="aspcn" TagName="uc_top" src="~/incs/web_top.ascx" %>
<% @ Register TagPrefix="aspcn" TagName="uc_banner" src="~/incs/banner.ascx" %>
<% @ Register TagPrefix="aspcn" TagName="uc_menu" src="~/member/menu.ascx" %>
<% @ Register TagPrefix="aspcn" TagName="uc_bottom" src="~/incs/web_bottom.ascx" %>
<aspcn:uc_top    runat="server" />
<LINK href="/member/member.css" type="text/css" rel="stylesheet" />
<script src="/js/member.js" type="text/javascript"></script>
<aspcn:uc_banner  runat="server" id="default" thetype="default"/>
<div class="lanmu_box_style1" id="sublanmu_style1">
<div class="lanmu_box_style1_left" id="sublanmu_style1_left"><aspcn:uc_menu  runat="server" /></div>
<div class="lanmu_box_style1_right" id="sublanmu_style1_right"><asp:PlaceHolder id="P1" runat="server" /></div>
<div class="lanmu_box_style1_clear" id="sublanmu_style1_bottom"></div>
</div>
<aspcn:uc_bottom   id="uc_bottom" runat="server" />
</div>
</body>
</html>