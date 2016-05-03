<% @ Control language="c#" Inherits="PageAdmin.productinfo"%>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1"><%=Tags_1%> &gt; <%=Lanmu_site%></li>
<li class="uc_lanmu_site_2"><%=Lanmu_3%></li>
</ul>
</div>
<div class="uc_lanmu_content">
<asp:PlaceHolder id="Holder_1" runat="server">
<div class="productinfo_box_1">
 <div class="productinfo_box_1_left">
  <img src="<%=Upload%>"   class="productinfo_image" onClick="ShowImage('<%=Upload%>')" >
  <br><span style="display:<%=Pd_Order%>"><a href='/order/order.aspx?prodid=<%=Request.QueryString["infoid"]%>&language=<%=P_Language%>'><img src="<%=Tags_3%>" border="0" width="80" height="20" vspace="5" hspace="0" align="absmiddle"></a></span>
</div>
<div class="productinfo_box_1_right">
<div class="productinfo_title"><h1><%=Name%></h1></div>
<div style="display:<%=Get_Display(Xinghao)%>"><%=Tags_4%><%=Xinghao%></div>
<div style="display:<%=Get_Display(Price)%>"><%=Tags_5%><%=Price%><%=Unit%></div>
<%=Introduct%>
</div>
</div>
</asp:PlaceHolder>

<asp:PlaceHolder id="Holder_detail" runat="server">
<div class="productinfo_detail" style="display:<%=Details_Title_Show%>">&nbsp;<%=Tags_6%></div>
<div class="productinfo_box_2"   id="infor_content" ><%=Content%></div>
<script type="text/javascript" src="/js/internal_page.js"></script>
</asp:PlaceHolder>
<br>
<ul class="uc_lanmu_pn">
<li class="uc_lanmu_prevtitle" style="display:<%=Prev_Style%>"><%=Tags_7%><%=Prev_Title%></li>
<li class="uc_lanmu_nexttitle" style="display:<%=Next_Style%>"><%=Tags_8%><%=Next_Title%></li>
</ul>
<br>
<asp:PlaceHolder id="Show_Comments" runat="server"  Visible="false" />
</div>
</div>

