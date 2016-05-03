<% @ Control language="c#" Inherits="PageAdmin.article"%>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1"><%=Site_Tag%> &gt; <%=Lanmu_site%></li>
<li class="uc_lanmu_site_2"><%=Lanmu_3%></li>
</ul>
</div>
<div class="uc_lanmu_content">
<%=Lanmu_Header%>
<asp:Repeater id="DL_style_1" runat="server" >
      <ItemTemplate>
       <ul class="article_style_1">
       <li class="article_title"><asp:Label Text=<%#"<a href='"+DataBinder.Eval(Container.DataItem,"download")+"' target='_blank' ><img src='/images/fileicon/"+Get_Icon(DataBinder.Eval(Container.DataItem,"download").ToString())+".gif'  border='0'  hspace='4' alt='Download' align='left' target='_blank'></a>"%> Visible='<%#Show_DownLoad(DataBinder.Eval(Container.DataItem,"download").ToString())%>' runat="server" /><a href="<%#GetUrl(Request.QueryString["menuid"],Request.QueryString["lanmuid"],DataBinder.Eval(Container.DataItem,"id").ToString(),DataBinder.Eval(Container.DataItem,"url").ToString())%>" target="<%=Target%>"  style="<%#DataBinder.Eval(Container.DataItem,"title_style")%>"><%#Get_title_num(DataBinder.Eval(Container.DataItem,"title").ToString(),true)%></a></li>
       <li class="article_date" style="display:<%=Date_Show%>"><%#DataBinder.Eval(Container.DataItem,"thedate","{0:yyyy-MM-dd}")%></li>
       <li class="clear"></li>
       </ul>
      </ItemTemplate>
</asp:Repeater>

<asp:DataList id="DL_style_2" RepeatDirection="Horizontal" border="0" RepeatLayout="table" width="99%" runat="server" HorizontalAlign="center" cellspacing="0" cellpadding="0">
<ItemTemplate>
<ul  class="article_style_2"  title=" <%#DataBinder.Eval(Container.DataItem,"title").ToString().Replace("\"","&#34")%> ">
<li><a href="<%#GetUrl(Request.QueryString["menuid"],Request.QueryString["lanmuid"],DataBinder.Eval(Container.DataItem,"id").ToString(),DataBinder.Eval(Container.DataItem,"url").ToString())%>"  target="<%=Target%>"><img src="<%#Get_Image(DataBinder.Eval(Container.DataItem,"thumbnail").ToString())%>"   border="0" class="article_style_2_image"  style="<%=ImageStyle%>"></a></li>
<li><a href="<%#GetUrl(Request.QueryString["menuid"],Request.QueryString["lanmuid"],DataBinder.Eval(Container.DataItem,"id").ToString(),DataBinder.Eval(Container.DataItem,"url").ToString())%>"  target="<%=Target%>"  style="<%#DataBinder.Eval(Container.DataItem,"title_style")%>" class="article_style_2_title"><%#Get_title_num(DataBinder.Eval(Container.DataItem,"title").ToString(),true)%></a></li>
<ul>
</ItemTemplate>
</asp:DataList>

<asp:DataList id="DL_style_3" RepeatColumns="1" RepeatDirection="Horizontal" border="0" RepeatLayout="table" width="99%" runat="server" HorizontalAlign="center" cellspacing="0" cellpadding="0">
<ItemTemplate>
<ul class="article_style_3">
<li class="article_style_3_box_1" style="display:<%#Images_Exists(DataBinder.Eval(Container.DataItem,"thumbnail").ToString())%>">
<a href="<%#GetUrl(Request.QueryString["menuid"],Request.QueryString["lanmuid"],DataBinder.Eval(Container.DataItem,"id").ToString(),DataBinder.Eval(Container.DataItem,"url").ToString())%>"   target="<%=Target%>"><img src="<%#Get_Image(DataBinder.Eval(Container.DataItem,"thumbnail").ToString())%>" border="0"  class="article_style_3_image" style="<%=ImageStyle%>"></a>
</li>
<li class="article_style_3_box_2">
<a href="<%#GetUrl(Request.QueryString["menuid"],Request.QueryString["lanmuid"],DataBinder.Eval(Container.DataItem,"id").ToString(),DataBinder.Eval(Container.DataItem,"url").ToString())%>"   target="<%=Target%>"  style="<%#DataBinder.Eval(Container.DataItem,"title_style")%>" class="article_style_3_title"><%#Get_title_num(DataBinder.Eval(Container.DataItem,"title").ToString(),true)%></a><span style="display:<%=Date_Show%>" class="article_style_3_date"><%#DataBinder.Eval(Container.DataItem,"thedate","{0:yyyy-MM-dd}")%></span>
<br><%#DataBinder.Eval(Container.DataItem,"introduction").ToString()%>
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
