<% @ Control language="c#" Inherits="PageAdmin.lanmu_zdymodel"%>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1"><%=Site_Tag%> &gt; <%=Lanmu_site%></li>
<li class="uc_lanmu_site_2"><%=Lanmu_3%></li>
</ul>
</div>
<div class="uc_lanmu_content">
<%=Lanmu_Header%>
      {pa:model_header}
<asp:Repeater id="List"  runat="server">
<ItemTemplate>
      {pa:model_list}
</ItemTemplate>
</asp:Repeater>
      {pa:model_bottom}


<asp:Panel cssclass="uc_lanmu_page" id="Page_Panel"  Visible="false" runat="server">
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
  <option value="<%=Get_LanmuUrl(i,1)%>"><%=i%></option>
<%
  }
%>
</select><%=Page_Tag5%>
<script type="text/javascript">Go_Page(<%=PageCount%>,<%=CurrentPage%>)</script>
</asp:Panel>
</div>
</div>