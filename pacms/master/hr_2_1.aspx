<% @ Page Language="C#" Inherits="PageAdmin.hr_2_1" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" />
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>招聘信息编辑</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top class=table_style2  align="left">
  
<form runat="server">
<table border=0 cellpadding=0 cellspacing=5 width=95% align=center>
<tr>
  <td  colspan=2 height=25px><b>招聘信息编辑</b></td>
 </tr>
 <tr>
  <td width=100px >招聘职位</td>
  <td><asp:TextBox TextMode="singleLine" id="TBzhiwei" runat="server" size=50 maxlength=45 />
 <asp:RequiredFieldValidator id="rfv1" ControlToValidate="TBzhiwei" display="Static" type="integer"  runat="server">
请输入招聘职位名称</asp:RequiredFieldValidator>
</td>
 </tr>
<tr>
  <td width=100px >招聘部门</td>
  <td><asp:TextBox TextMode="singleLine" id="TBbumen" runat="server" size=50 maxlength=45 />
 <asp:RequiredFieldValidator id="rfv2" ControlToValidate="TBbumen" display="Static" type="integer"  runat="server">
请输入招聘部门</asp:RequiredFieldValidator>
</td>
 </tr>

<tr>
  <td width=100px >工作性质</td>
  <td>
<asp:DropDownList  id="DLxingzhi" runat="server" >
<asp:ListItem value="全职">全职</asp:ListItem>
<asp:ListItem value="兼职">兼职</asp:ListItem>
</asp:DropDownList>
</td>
 </tr>

<tr>
  <td width=100px >性别要求</td>
  <td>
<asp:DropDownList  id="DLxingbie" runat="server" >
<asp:listItem value="不限">不限</asp:listItem>
<asp:listItem value="男性">男性</asp:listItem>
<asp:listItem value="女性">女性</asp:listItem>
</asp:DropDownList>
</td>
 </tr>
<tr>
  <td width=100px >工作地点</td>
  <td><asp:TextBox TextMode="singleLine" id="TBdidian" runat="server" size=40 maxlength=45 />
 <asp:RequiredFieldValidator id="rfv4" ControlToValidate="TBdidian" display="Static" type="integer"  runat="server">
请输入工作地点</asp:RequiredFieldValidator>
</td>
 </tr>
<tr>
  <td width=100px >招聘人数</td>
  <td><asp:TextBox TextMode="singleLine" id="TBnum" runat="server" text="1" size=5 maxlength=3 />人
 <asp:RequiredFieldValidator id="rfv5" ControlToValidate="TBnum" display="Static" type="integer"  runat="server">
请输入招聘人数</asp:RequiredFieldValidator>
</td>
 </tr>
<tr>
  <td width=100px>开始日期</td>
  <td><asp:TextBox   id="TBstart" runat="server" size=20 maxlength=20 />
 <asp:RangeValidator id="rfv7" ControlToValidate="TBstart" display="Static" type="Date" MinimumValue="2008-1-1" MaximumValue="9000-1-1" runat="server">
日期格式错误</asp:RangeValidator>
</td>
 </tr>
<tr>
  <td width=100px>结束日期</td>
  <td><asp:TextBox   id="TBover" runat="server" size=20 maxlength=20 />
 <asp:RangeValidator id="rfv8" ControlToValidate="TBover"  display="Static" type="Date" MinimumValue="2008-1-1" MaximumValue="9000-1-1" runat="server">
日期格式错误</asp:RangeValidator>
</td>
 </tr>
<tr>
  <td width=100px>职位要求</td>
  <td><asp:TextBox TextMode="MultiLine" id="TByaoqiu" runat="server" Columns=80 rows=10 />
 <asp:RequiredFieldValidator id="rfv6" ControlToValidate="TByaoqiu" display="Static" type="integer"  runat="server">
请描述一下职位要求</asp:RequiredFieldValidator>
</td>
 </tr>
<tr>
  <td width=100px >备注</td>
  <td><asp:TextBox TextMode="MultiLine" id="TBqita" runat="server" Columns=80 rows=4 />
</td>
 </tr>
<tr>
  <td width=100px >排序号</td>
  <td><asp:TextBox TextMode="singleLine" id="TBxuhao" runat="server" size=4 Text="0" maxlength=2 />
</td>
 </tr>
</table>
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
<td height=25 align=center >
<asp:Label  id="lbl"  runat="server" />
<asp:Button class=button   text="提交"  runat="server" onclick="PageAdmin_Data_Update" />
<input type="button" value="返回"     class="button" onclick="location.href='hr_1.aspx'" />
</td>
 </tr>
</table>


</form>


</td>
</tr>
</table>
</center>
</body>
</html>  



