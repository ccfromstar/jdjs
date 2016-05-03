<% @ Control language="c#" Inherits="PageAdmin.articleinfo"%>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1"><%=Tags_1%> &gt; <%=Lanmu_site%></li>
<li class="uc_lanmu_site_2"><%=Lanmu_3%></li>
</ul>
</div>
<div class="uc_lanmu_content">
<asp:PlaceHolder id="Show_style1" runat="server"  Visible="false">
<div  class="articleinfor_title"><h1><%=Information_title%></h1></div>
<div  class="articleinfor_tishi">
<%=Tags_2%><%=Information_date%><%=Tags_Author%><%=Information_Author%><%=Tags_Source%><%=Information_Source%>&nbsp;&nbsp;<%=Tags_3%><%=Information_click%>&nbsp;&nbsp;【<%=Tags_4%><a href="javascript:FontZoom('16px','32px','Infor_Content')"><%=Tags_5%></a> <a href="javascript:FontZoom('14px','28px','Infor_Content')"><%=Tags_6%></a>  <a href="javascript:FontZoom('12px','25px','Infor_Content')"><%=Tags_7%></a>】
</div>
<asp:PlaceHolder id="Show_download1" runat="server"  Visible="false">
<p class="articleinfor_download"><a href="<%=Information_DownLoad%>" target="_blank"><img src="/images/fileicon/<%=File_Icon%>.gif" border=0 alt="Download" hspace=5 vspace=0 align="absmiddle"><%=Tags_8%></a> (<%=DownLoad_Beizhu%>)</p>
</asp:PlaceHolder>
<div id="Infor_Content"><%=Information_content%></div>
</asp:PlaceHolder>

<asp:PlaceHolder id="Show_style2" runat="server">
<div class="articleinfor_box_1">
 <div class="articleinfor_box_1_left" >
  <img src="<%=Upload%>" width="120px"  class="articleinfor_image" onClick="ShowImage('<%=Upload%>')">
</div>

<div class="articleinfor_box_1_right">
<div class="articleinfor_title_1"><h1><%=Information_title%></h1></div>
<asp:PlaceHolder id="Show_download2" runat="server"  Visible="false">
<p><a href="<%=Information_DownLoad%>" target="_blank"><img src="/images/fileicon/<%=File_Icon%>.gif" border=0 alt="Download" hspace=5 vspace=0 align="absmiddle"><%=Tags_8%></a> (<%=DownLoad_Beizhu%>)</p>
</asp:PlaceHolder>
<%=Information_Introduct%>
</div>
</div>
<asp:PlaceHolder id="Show_detail" runat="server"  Visible="false">
<div  class="articleinfor_detail"><%=Tags_9%></div>
<div  class="articleinfor_box_2" id="Infor_Content"><%=Information_content%></div>
</asp:PlaceHolder>
<div  class="articleinfor_tishi"><%=Tags_2%><%=Information_date%><%=Tags_Author%><%=Information_Author%><%=Tags_Source%><%=Information_Source%>&nbsp;<%=Tags_3%><%=Information_click%>&nbsp;【<%=Tags_4%><a href="javascript:FontZoom('16px','32px','Infor_Content')"><%=Tags_5%></a> <a href="javascript:FontZoom('14px','28px','Infor_Content')"><%=Tags_6%></a>  <a href="javascript:FontZoom('12px','25px','Infor_Content')"><%=Tags_7%></a>】</div>
</asp:PlaceHolder>
<script type="text/javascript" src="/js/internal_page.js"></script>
<br>
<ul class="uc_lanmu_pn">
<li class="uc_lanmu_prevtitle" style="display:<%=Prev_Style%>"><%=Tags_10%><%=Prev_Title%></li>
<li class="uc_lanmu_nexttitle" style="display:<%=Next_Style%>"><%=Tags_11%><%=Next_Title%></li>
</ul>
<asp:PlaceHolder id="Show_Comments" runat="server"  Visible="false" />
</div>
</div>

