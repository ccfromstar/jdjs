<% @ Page Language="C#"  Inherits="PageAdmin.data_manage" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="basic_2" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<form runat="server">
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td align="left"  height=10></td></tr>
 <tr><td align="left"  class=table_style1><b>数据库管理</b></td></tr>
 <tr><td align="left"  height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td align="left"  valign=top class=table_style2>

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
 <td align="left" height="25px" width="100px">正在使用的数据库</td>
<td><asp:TextBox id="Tb_dbPath"  maxlength="50" size="40" Enabled="false" runat="server"/></td>
</tr>
<tr>
  <td align="left"   height="25px" width="100px">数据库类型</td>
  <td><asp:TextBox id="Tb_dbtype"  maxlength="50"  size="40" Enabled="false" runat="server"/></td>
</tr>
<tr>
 <td align="left" height="25px" width="100px">备份保存路径</td>
<td><asp:TextBox id="Backup_Path" Text="/backup/" maxlength="50" size="40" Enabled="false" runat="server"/></td>
</tr>
</table>

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
<td align="center"  height=40 align=center >
<asp:Label  id="lbl"  runat="server" />
<asp:Button class=button   text="备份数据"  Id="Bt_Submit" onclick="PageAdmin_Data_Backup" runat="server" />
</td>
 </tr>
</table>
</td>
</tr>
</table>
<br>

<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td align="left"  valign=top class=table_style2>
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  colspan=2 height=25><b>备份文件</b></td>
 </tr>
</table>
<table border=0 cellpadding=0 cellspacing=0 width=95% align=center class=tablestyle>
 <tr>
  <td height="20px" class=white width=15% align=center>文件类型</td>
  <td height="20px" class=white width=35% align=center>备份保存路径</td>
  <td class=white align=center width=15%>文件大小</td>
  <td class=white align=center width=20%>备份时间</td>
  <td class=white align=center width=15%>操作</td>
 </tr>
<asp:Repeater id="P1" runat="server" OnItemDataBound="Data_Bound">
<ItemTemplate>
   <tr>
    <td align=center  class=tdstyle><%#Get_BackType(DataBinder.Eval(Container.DataItem,"db_type").ToString())%></td>
    <td align=center  class=tdstyle><%#DataBinder.Eval(Container.DataItem,"db_path")%></td>
    <td align=center  class=tdstyle><%#DataBinder.Eval(Container.DataItem,"db_size")%></td>
    <td align=center  class=tdstyle><%#DataBinder.Eval(Container.DataItem,"thedate")%></td>
    <td align=center  class=tdstyle><asp:LinkButton id="Cancel" Text="删除" runat="server" CommandName='<%#DataBinder.Eval(Container.DataItem,"db_path")%>'  OnCommand="Data_Cancel" /></td>
  </tr>
</ItemTemplate>
</asp:Repeater>
</table>
</td>
</tr>
</table>

<br>

<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td align="left"  valign=top class=table_style2>
<table border=0 cellpadding=0 cellspacing=5 width=95% align=center>
<tr>
  <td><b>运行sql语句</b></td>
  <td align="left"><asp:TextBox id="Tb_sql" Textmode="multiline" columns="75" rows="10"  runat="server"/>
</td>
<tr>
  <td align="center" colspan="2"><asp:Button id="B_Submit" class=button   text="运行"  onclick="PageAdmin_Run_Sql" runat="server" />
</td>
 </tr>
</table>
注意:为保证数据库安全，运行sql前请先备份数据库，非专业人士请不要随意执行。
</td>
</tr>
</table>
</form>
</center>
</body>
</html>  



