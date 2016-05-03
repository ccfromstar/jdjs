<% @ Page Language="C#"  Inherits="PageAdmin.collection_4" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="collection_1" />
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>采集配置</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top>

<form runat="server">
<table border=0 cellpadding=5 cellspacing=0  width=100% align=center  class=table_style2>
<tr>
  <td valign=top  align="left">
  <table border=0 cellpadding=5  width=95% align=center>
    <tr>
     <td  align="left"><b>当前采集：</b><%=Request.QueryString["name"]%></td>
    </tr>
    <tr>
     <td  align="left" height="5"></td>
    </tr>
  </table>
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center> 
      <tr>
          <td>
             <asp:TextBox id="Content" TextMode="MultiLine"  columns="100" rows="40" ScrollBars="Vertical" runat="server"  />
          </td>
      </tr> 
      <tr>
          <td   height=25 colspan=2 align=center>
<asp:Button Text=" 更新 " runat="server" cssclass="button" onclick="PageAdmin_Data_Update" />
<input type="button" class=button  value="返回"  onclick="location.href='collection_1.aspx'">

</td>
      <tr>       
    </table>
 </td>
 <tr>
</table>
<br>
<div align="left">注：采用xml语法，更新后将导致采集规则重置，如果没有修改配置请不要点更新按纽</div>
</form>

</td>
</tr>
</table>
</center>
</body>
</html>  

