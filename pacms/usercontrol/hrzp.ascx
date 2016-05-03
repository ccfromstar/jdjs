<% @ Control language="c#" Inherits="PageAdmin.hrzp" %>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1"><%=Tags_1%> &gt; <%=Lanmu_site%></li>
<li class="uc_lanmu_site_2"><%=Lanmu_3%></li>
</ul>
</div>
<div class="uc_lanmu_content">
<%=Lanmu_Header%>
<table border=0 cellpadding=0 cellspacing=0 width=99% align=center  class="hrzp_header">
<tr> 
       <td width=25% align=center class="hrzp_header_title"><%=Tags_2%></td>
       <td width=25% align=center class="hrzp_header_title"><%=Tags_3%></td>
       <td width=25% align=center class="hrzp_header_title"><%=Tags_4%></td>
       <td width=25% align=center class="hrzp_header_title"><%=Tags_5%></td>
</tr>
</table>
<asp:Repeater id="DL_1"  runat="server">
<ItemTemplate> 
     <table border=0 cellpadding=0 cellspacing=0 width="99%" align=center Class="hrzp_list">
      <tr>
      <td width=25% align=center><a href="<%#GetUrl(Request.QueryString["menuid"],Request.QueryString["lanmuid"],DataBinder.Eval(Container.DataItem,"id").ToString())%>"><%#DataBinder.Eval(Container.DataItem,"zhiwei")%></a></td>
      <td width=25% align=center><%#DataBinder.Eval(Container.DataItem,"renshu")%></td>
      <td width=25% align=center><%#DataBinder.Eval(Container.DataItem,"address")%></td>
      <td width=25% align=center><%#DataBinder.Eval(Container.DataItem,"startdate","{0:yyyy-MM-dd}")%></td>
       </tr>
      </table>
</ItemTemplate> 
</asp:Repeater>
</div>
</div>
