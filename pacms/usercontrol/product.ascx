<% @ Control language="c#" Inherits="PageAdmin.product" %>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1"><%=Site_Tag%> &gt; <%=Lanmu_site%></li>
<li class="uc_lanmu_site_2"><%=Lanmu_3%></li>
</ul>
</div>
<div class="uc_lanmu_content">
<%=Lanmu_Header%>
<asp:DataList id="DL_Style_1" RepeatDirection="Horizontal" border="0" RepeatLayout="table" width="99%" runat="server" HorizontalAlign="center" cellspacing="5" cellpadding="0">
<ItemTemplate>
<ul class="product_style_1"  title=" <%#DataBinder.Eval(Container.DataItem,"name").ToString().Replace("\"","&#34")%> ">
<li><a href="<%#GetUrl(Request.QueryString["menuid"],Request.QueryString["lanmuid"],DataBinder.Eval(Container.DataItem,"id").ToString())%>" target="<%=Target%>"><img src="<%#Get_Image(DataBinder.Eval(Container.DataItem,"thumbnail").ToString())%>"   class="product_style_1_image"  style="<%=ImageStyle%>" border="0"></a></li>
<li><a href="<%#GetUrl(Request.QueryString["menuid"],Request.QueryString["lanmuid"],DataBinder.Eval(Container.DataItem,"id").ToString())%>" target="<%=Target%>"><%#Get_title_num(DataBinder.Eval(Container.DataItem,"name").ToString(),true)%></a></li>
</ul>
</ItemTemplate>
</asp:DataList>

<asp:DataList id="DL_Style_2" RepeatColumns="1" RepeatDirection="Horizontal" RepeatLayout="table" width="99%" runat="server" cellspacing="5" cellpadding="0">
<ItemTemplate>
<ul  class="product_style_2">
<li class="product_style_2_box_1">
<a href="<%#GetUrl(Request.QueryString["menuid"],Request.QueryString["lanmuid"],DataBinder.Eval(Container.DataItem,"id").ToString())%>" target="<%=Target%>"><img src="<%#Get_Image(DataBinder.Eval(Container.DataItem,"thumbnail").ToString())%>" border="0" widht="100px" class="product_style_2_image"   style="<%=ImageStyle%>" border="0"></a>
<br><a href="<%#GetUrl(Request.QueryString["menuid"],Request.QueryString["lanmuid"],DataBinder.Eval(Container.DataItem,"id").ToString())%>" target="<%=Target%>"><%#Get_title_num(DataBinder.Eval(Container.DataItem,"name").ToString(),true)%></a>
</li>
<li class="product_style_2_box_2">
<%#DataBinder.Eval(Container.DataItem,"introduct").ToString()%>
</li>
<li class="clear"></li>
</ul>
</ItemTemplate>
</asp:DataList>

<div class="uc_lanmu_page" style="display:<%=Page_Show%>">
<%=Page_Tag1%><%=RecordCount%><%=Page_Tag2%>&nbsp;
<%=Page_Tag3%><%=CurrentPage%>/<%=PageCount%>&nbsp;
<a id="P_First" href="<%=F_Url%>"><%=F_Name%></a>&nbsp;
<a id="P_Prev"  href="<%=P_Url%>"><%=P_Name%></a>&nbsp;
<a id="P_Next"  href="<%=N_Url%>"><%=N_Name%></a>&nbsp;
<a id="P_Last"  href="<%=L_Url%>"><%=L_Name%></a>&nbsp;
<%=Page_Tag4%>
<select id="P_Page" onchange="location.href=this.options[this.selectedIndex].value">
<%
 for(int i=1;i<=PageCount;i++)
  {
%>
  <option value="<%=Get_PageUrl(i)%>"><%=i%></option>
<%
  }
%>
</select><%=Page_Tag5%>
</div>
<script language="javascript">Go_Page(<%=PageCount%>,<%=CurrentPage%>)</script>

</div>
</div>