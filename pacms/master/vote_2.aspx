<% @ Page Language="C#" Inherits="PageAdmin.vote_2" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" />
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1 align="left"><b>问卷调查内容设置</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top  align="left">

<form runat="server" >
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top  align="left">

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  colspan=2 height=25  align="left"><b>问卷名称：</b><%=Request.QueryString["name"]%></td>
 </tr>
</table>
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  height=25  align="left" width="100px">问卷标题</td>
  <td  height=25  align="left"><asp:TextBox id="Tb_title" TextMode="singleLine" size="50" maxlength="50" runat="server" />
<asp:RequiredFieldValidator   ControlToValidate="Tb_title" display="Dynamic" type="integer"  runat="server">
请输入问卷标题</asp:RequiredFieldValidator>
</td>
 </tr>

<tr>
  <td  height=25  align="left" width="100px">投票限制</td>
  <td  height=25  align="left">
   <asp:DropDownList id="Dp_Onlyone" runat="server">
     <asp:ListItem Value="0">不限制</asp:ListItem>
     <asp:ListItem Value="1">一人只能投一次</asp:ListItem>
   </asp:DropDownList>
 </td>
 </tr>

<tr>
  <td  height=25  align="left" width="100px">问卷选项</td>
  <td  height=25  align="left">
   <asp:DropDownList id="Dp_Style" runat="server">
     <asp:ListItem Value="0">单选框</asp:ListItem>
     <asp:ListItem Value="1">多选框</asp:ListItem>
   </asp:DropDownList>
 </td>
 </tr>

<tr>
  <td  height=25  align="left" width="100px">问卷内容</td>
  <td  height=25  align="left">
<asp:TextBox id="Tb_content" TextMode="multiLine" rows="20" columns="80" runat="server" />
<asp:RequiredFieldValidator   ControlToValidate="Tb_content" display="Dynamic" type="integer"  runat="server">
请输入问卷标题</asp:RequiredFieldValidator>
 </td>
 </tr>
</table>
<br>
<div align=center>
<asp:Button   Text="提交" CssClass="button"  Runat="server" OnClick="PageAdmin_Data_Update"/>
<input type="button" class=button  value="返回"  onclick="location.href='vote_1.aspx'">
</div>

</td>
</tr>
</table>
</form>
<br>
问卷内容说明：一行为一个选项,内容中不能出现下划线"|"。
<br>
</td>
</tr>
</table>
</center>
</body>
</html>  



