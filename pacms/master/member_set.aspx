<% @ Page Language="C#"  Inherits="PageAdmin.member_set" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="member_1"/> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>会员系统设置</b></td></tr>
 <tr><td height=10 ></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">
<form runat="server" >

<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top align="left">
    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
      <tr>
        <td height=25  width="100px">会员注册</td>
        <td>
         <asp:DropDownList Id="Dl_Reg" Runat="server">
          <asp:ListItem value="1">开放注册</asp:ListItem>
          <asp:ListItem value="0">关闭注册</asp:ListItem>
         </asp:DropDownList>
       </td>
     </tr>

   <tr>
    <td align="left"  width=100px width=100px>禁止注册会员<br><span style="color:#999999">半角逗号分开</span></td>
   <td align="left" ><asp:TextBox id="Tb_forbid_username"  TextMode="multiLine"  columns="80" rows="5" runat="server" /></td>
  </tr>
<!--
   <tr>
    <td align="left"  width=100px width=100px>短信息自动清理<br><span style="color:#999999">0为不清理</span></td>
   <td align="left" ><asp:TextBox id="Tb_msg_expire" runat="server" maxlength="4" size="10"/>天前的信息</td>
  </tr>
-->
   <tr>
    <td align="left"  width=100px width=100px>会员注册协议</td>
   <td align="left" ><asp:TextBox id="Agreement"  TextMode="multiLine"  columns="80" rows="15" runat="server" /></td>
  </tr>

   <tr>
    <td  colspan="2" align="center" height="40px"><asp:Button class=button   text="提交"  Id="Bt_Submit" runat="server" OnClick="PageAdmin_Data_Update" /></td>
  </tr>
  </table>

  </td>
  <tr>
 </table>

</form>
</td>
</tr>
</table>
</center>
</body>
</html>  



