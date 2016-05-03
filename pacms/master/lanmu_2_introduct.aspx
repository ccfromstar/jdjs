﻿<% @ Page Language="C#" Inherits="PageAdmin.lanmu_2_introduct" %>
<% @ Register TagPrefix="aspcn" TagName="uc_fckeditor" src="/incs/fckeditor/fckeditor.ascx" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" />
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>自定义内容设置</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">
<form runat="server" >
<div id="tabdiv">
<ul>
<li id="tab" name="tab"  onclick="showtab(0,1)" style="font-weight:bold">内容设置</li>
<li id="tab" name="tab"  onclick="showtab(1,1)">自定义样式</li>
</ul>
</div>
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  colspan=2 height=25><b>当前导航</b>：<%=Request.QueryString["lanmu1"]%> > <%=Request.QueryString["lanmu2"]%></td>
 </tr>
</table>

<div name="tabcontent" id="tabcontent">
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td width=60px><b>内容编辑</b></td>
  <td><asp:TextBox  id="Content"  TextMode="MultiLine"  runat="server" />
      <aspcn:uc_fckeditor  Tb_Id="Content" Fck_Height="400" Fck_Style="Normal" runat="server"/>
  </td>
 </tr>
</table>
</div>

<div name="tabcontent" id="tabcontent" style="display:none">
<table border=0 cellpadding="0" cellspacing="1" width="95%" align=center>
<tr>
  <td  height=25 width="100px">默认导航标志</td>
  <td align="left"><asp:RadioButton id="RB_Show" GroupName="Hide" runat="server" />显示&nbsp;&nbsp;<asp:RadioButton id="RB_Hide" GroupName="Hide" runat="server" />隐藏</td>
 </tr>
 <tr>
  <td  height=25>目标地址</td>
  <td align="left"><asp:TextBox id="Url" runat="server"  size="60" maxlength="100"/></td>
 </tr>
<tr>
  <td  height=25>导航风格</td>
  <td align="left"><asp:DropDownList  id="D_Style"  DataTextField="name" DataValueField="id" Runat="server" /></td>
</tr>
<tr>
  <td  height=25>自定义头信息</td>
  <td align="left"><asp:TextBox  id="HeadContent"  TextMode="MultiLine"  runat="server" />
      <aspcn:uc_fckeditor Tb_Id="HeadContent" Fck_Height="250" Fck_Style="Basic" runat="server" /></td>
 </tr>
<tr>
  <td  height=40>导航应用</td>
  <td align="left">
模块页：<asp:DropDownList  id="D_Nav_used_template"  Runat="server">
<asp:ListItem value="1">显示</asp:ListItem>
<asp:ListItem value="0" style="color:#ff0000">隐藏</asp:ListItem>
</asp:DropDownList>&nbsp;
子栏目页：<asp:DropDownList  id="D_Nav_used_lanmu"  Runat="server">
<asp:ListItem value="1">显示</asp:ListItem>
<asp:ListItem value="0" style="color:#ff0000">隐藏</asp:ListItem>
</asp:DropDownList>&nbsp;
详细页：<asp:DropDownList  id="D_Nav_used_detail"  Runat="server">
<asp:ListItem value="1">显示</asp:ListItem>
<asp:ListItem value="0" style="color:#ff0000">隐藏</asp:ListItem>
</asp:DropDownList>
</td>
</tr>
</table>
</div>

<br>
<div align=center>
<asp:Button      Cssclass=button   text="提交"   runat="server" onclick="PageAdmin_Data_Update" />
<input type="button" class=button  value="返回"  onclick="location.href='lanmu_2.aspx?lanmu1id=<%=Request.QueryString["lanmu1id"]%>&lanmu1=<%=Server.UrlEncode(Request.QueryString["lanmu1"])%>&thetype=<%=Request.QueryString["thetype"]%>'">
</div>

</td>
</tr>
</table>
<br>
<span style="color:#ff0000">注意：</span>粘贴js代码时请切换到源代码模式。
<asp:Label id="LblErr" runat="server" />
</form>
</td>
</tr>
</table>
</center>
</body>
<script language="javascript">
var C_Tab="<%=Request.QueryString["tab"]%>";
if(C_Tab!="")
 {
   showtab(C_Tab,0);
 }   
</script>
</html>  



