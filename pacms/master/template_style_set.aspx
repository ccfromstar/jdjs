<% @ Page Language="C#" Inherits="PageAdmin.template_style_set" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="lanmu_3" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<table  border=0 cellpadding=0 cellspacing=0 width=95% align="center">
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>模块样式设置</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% align="center">
 <tr>
<td valign=top>
<table  border=0 cellpadding=0 cellspacing=0 width="100%" align="center">
 <tr><td height="25px">当前模块样式：<%=Request.QueryString["name"]%></td></tr>
</table>
<form runat="server" >
<table border=0 cellpadding=5 cellspacing=0 width="100%" align=center  class=table_style2>
<tr>
  <td valign=top>
<table border=0 cellpadding="2" cellspacing="5" width="95%" align=center>

<tr>
  <td  height=25 width="100px">外层容器样式</td>
  <td align="left"><asp:TextBox id="T_box_style" runat="server" TextMode="MultiLine" Columns="70" Rows="4" />
</tr>

<tr>
  <td  height=25 width="100px">内层容器样式</td>
  <td align="left"><asp:TextBox id="T_box_1_style" runat="server" TextMode="MultiLine" Columns="70" Rows="4" />
</tr>

<tr>
  <td  height=25 width="100px">标题容器样式</td>
  <td align="left"><asp:TextBox id="T_titlebox_style" runat="server" TextMode="MultiLine" Columns="70" Rows="4" />
</tr>

<tr>
  <td  height=25 width="100px">标题样式</td>
  <td align="left"><asp:TextBox id="T_title_style" runat="server" TextMode="MultiLine" Columns="70" Rows="4" />
</tr>

<tr>
  <td  height=25 width="100px">more样式</td>
  <td align="left"><asp:TextBox id="T_more_style" runat="server" TextMode="MultiLine" Columns="70" Rows="4" />
</tr>

<tr>
  <td  height=25 width="100px">内容区样式</td>
  <td align="left"><asp:TextBox id="T_content_style" runat="server" TextMode="MultiLine" Columns="70" Rows="4" />
</tr>

<tr>
  <td  height=25 width="100px">列表样式</td>
  <td align="left"><asp:TextBox id="T_list_style" runat="server" TextMode="MultiLine" Columns="70" Rows="4" />
</tr>

<tr>
  <td  height=25 width="100px">图片样式</td>
  <td align="left"><asp:TextBox id="T_pic_style" runat="server" TextMode="MultiLine" Columns="70" Rows="4" />
</tr>

</table>

</td>
</tr>
</table>

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
<td height=25 align=center >
<asp:Button  Cssclass=button   text="提交"   runat="server" onclick="PageAdmin_Data_Update"/>
<input type="button" class=button  value="返回"  onclick="location.href='Template_style.aspx'">
</td>
 </tr>
</table>
<br>
注：以上请采用标志CSS语法，最大字符数为200，留空则采用默认样式。
</form>
</body>
</html>  



