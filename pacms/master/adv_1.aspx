<% @ Page Language="C#" Inherits="PageAdmin.adv_1"%>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server"  Type="basic_4"/>
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1 align="left"><b>站内广告管理</b></td></tr>
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
  <td  colspan=2 height=25  align="left"><b>弹出窗口广告</b></td>
 </tr>
<tr>
  <td  height=25px  align="left" width="100px">开 关</td>
  <td  height=25px  align="left" >
<asp:RadioButton id="Av1_open"  GroupName="Av1_1" runat="server" />开启
<asp:RadioButton id="Av1_close" GroupName="Av1_1" runat="server"/>关闭
</td>
</tr>

<tr>
  <td  height=25px  align="left" width="100px">应用范围</td>
  <td  height=25px  align="left" >
<asp:RadioButton id="Av1_index"  GroupName="Av1_2" runat="server" />首页
<asp:RadioButton id="Av1_all" GroupName="Av1_2" runat="server" />所有栏目
</td>
</tr>

<tr>
  <td  height=25px  align="left" width="100px">窗口标题</td>
  <td  height=25px  align="left" ><asp:TextBox id="Av1_Title" maxlength="80" size="60" runat="server" /></td>
</tr>

<tr>
  <td  height=25px  align="left" width="100px">窗口参数</td>
  <td  height=25px  align="left" ><asp:TextBox id="Av1_Set" maxlength="80" size="60" runat="server" /></td>
</tr>
<tr>
  <td  height=25px  align="left" width="100px">窗口内容<br><a href="javascript:Open_Editor('adv','adv1_content','<%=FieldId%>','1')"><img src=images/edit.gif width=20 height=20 align=absmiddle vspace=5 hspace=5 border=0 alt="可视化编辑"></a></td>
  <td  height=25px  align="left" ><asp:TextBox id="Av1_Content" TextMode="multiline" columns="80" rows="5" runat="server" /></td>
</tr>
</table>

</td>
</tr>
</table>


<br>
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top  align="left">

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  colspan=2 height=25  align="left"><b>漂浮广告</b></td>
 </tr>
<tr>
  <td  height=25px  align="left" width="100px">开 关</td>
  <td  height=25px  align="left" >
<asp:RadioButton id="Av2_open"  GroupName="Av2" runat="server" />开启
<asp:RadioButton id="Av2_close" GroupName="Av2" runat="server" />关闭
</td>
</tr>

<tr>
  <td  height=25px  align="left" width="100px">应用范围</td>
  <td  height=25px  align="left" >
<asp:RadioButton id="Av2_index"  GroupName="Av2_2" runat="server" />首页
<asp:RadioButton id="Av2_all" GroupName="Av2_2" runat="server" />所有栏目
</td>
</tr>

<tr>
  <td  height=25px  align="left" width="100px">漂浮内容<br><a href="javascript:Open_Editor('adv','adv2_content','<%=FieldId%>','1')"><img src=images/edit.gif width=20 height=20 align=absmiddle vspace=5 hspace=5 border=0 alt="可视化编辑"></a></td>
  <td  height=25px  align="left" ><asp:TextBox id="Av2_Content" TextMode="multiline" columns="80" rows="5" runat="server" /></td>
</tr>
</table>

</td>
</tr>
</table>


<br>
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top  align="left">

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  colspan=2 height=25  align="left"><b>两侧对联广告</b></td>
 </tr>
<tr>
  <td  height=25px  align="left" width="100px">开 关</td>
  <td  height=25px  align="left" >
<asp:RadioButton id="Av3_open"  GroupName="Av3_1" runat="server" />开启
<asp:RadioButton id="Av3_close" GroupName="Av3_1" runat="server" />关闭
</td>
</tr>
<tr>
  <td  height=25px  align="left" width="100px">应用范围</td>
  <td  height=25px  align="left" >
<asp:RadioButton id="Av3_index"  GroupName="Av3_2" runat="server" />首页
<asp:RadioButton id="Av3_all"    GroupName="Av3_2" runat="server" />所有栏目
</td>
</tr>
<tr>
  <td  height=25px  align="left" width="100px">左侧内容<br><a href="javascript:Open_Editor('adv','adv3_content_left','<%=FieldId%>','1')"><img src=images/edit.gif width=20 height=20 align=absmiddle vspace=5 hspace=5 border=0 alt="可视化编辑"></a></td>
  <td  height=25px  align="left" ><asp:TextBox id="Av3_Left_Content" TextMode="multiline" columns="80" rows="3" runat="server" /></td>
</tr>
<tr>
  <td  height=25px  align="left" width="100px">右侧内容<br><a href="javascript:Open_Editor('adv','adv3_content_right','<%=FieldId%>','1')"><img src=images/edit.gif width=20 height=20 align=absmiddle vspace=5 hspace=5 border=0 alt="可视化编辑"></a></td>
  <td  height=25px  align="left" ><asp:TextBox id="Av3_Right_Content" TextMode="multiline" columns="80" rows="3" runat="server" /></td>
</tr>
</table>

</td>
</tr>
</table>
<br>
<div align=center><asp:Button Text=" 保存 " Cssclass="button" runat="server" OnClick="PageAdmin_Data_Update"/></div>
</form>
<br>
</td>
</tr>
</table>
</center>
</body>
</html>  



