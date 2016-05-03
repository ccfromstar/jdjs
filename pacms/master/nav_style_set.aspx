<% @ Page Language="C#" Inherits="PageAdmin.nav_style_set" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server"  Type="lanmu_2"/> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<table  border=0 cellpadding=0 cellspacing=0 width=95% align="center">
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>导航样式设置</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% align="center">
 <tr>
<td valign=top>
<table  border=0 cellpadding=0 cellspacing=0 width="100%" align="center">
 <tr><td height="25px">当前导航样式：<%=Request.QueryString["name"]%></td></tr>
</table>
<form runat="server" >
<table border=0 cellpadding=5 cellspacing=0 width="100%" align=center  class=table_style2>
<tr>
  <td valign=top>
<table border=0 cellpadding="2" cellspacing="5" width="95%" align=center>

<tr>
  <td  height=25 width="100px">容器样式</td>
  <td align="left"><asp:TextBox id="Nav_box_style" runat="server" TextMode="MultiLine" Columns="70" Rows="4" />
</tr>

<tr>
  <td  height=25 width="100px">标题容器样式</td>
  <td align="left"><asp:TextBox id="Nav_titlebox_style" runat="server" TextMode="MultiLine" Columns="70" Rows="4" />

</tr>

<tr>
  <td  height=25 width="100px">标题样式</td>
  <td align="left"><asp:TextBox id="Nav_title_style" runat="server" TextMode="MultiLine" Columns="70" Rows="4" />
</tr>

<tr>
  <td  height=25 width="100px">more样式</td>
  <td align="left"><asp:TextBox id="Nav_more_style" runat="server" TextMode="MultiLine" Columns="70" Rows="4" />
</tr>

<tr>
  <td  height=25 width="100px">内容区样式</td>
  <td align="left"><asp:TextBox id="Nav_content_style" runat="server" TextMode="MultiLine" Columns="70" Rows="4" />
</tr>

<tr>
  <td  height=25 width="100px">列表样式</td>
  <td align="left"><asp:TextBox id="Nav_list_style" runat="server" TextMode="MultiLine" Columns="70" Rows="4" />
</tr>

<tr>
  <td  height=25 width="100px">图片样式</td>
  <td align="left"><asp:TextBox id="Nav_pic_style" runat="server" TextMode="MultiLine" Columns="70" Rows="4" />
</tr>

</table>

</td>
</tr>
</table>

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
<td height=25 align=center >
<asp:Button  Cssclass=button   text="提交"   runat="server" onclick="PageAdmin_Data_Update"/>
<input type="button" class=button  value="返回"  onclick="location.href='nav_style.aspx'">
</td>
 </tr>
</table>
<br>
注：以上请采用标志CSS语法，最大字符数为200，留空则采用默认样式。
</form>
</body>
</html>  



