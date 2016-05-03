<% @ Page Language="C#"   Inherits="PageAdmin.member_fnc_fk" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="member_3" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>会员返款</b></td></tr>
 <tr><td height=10 ></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">
<form runat="server" >
<div id="tabdiv">
<ul>
<li id="tab" name="tab"  onclick="location.href='member_info.aspx?username=<%=Request.QueryString["username"]%>'">会员信息</li>
<li id="tab" name="tab"  onclick="location.href='member_fnc_rk.aspx?username=<%=Request.QueryString["username"]%>'">汇款入帐</li>
<li id="tab" name="tab"  onclick="location.href='member_fnc_xf.aspx?username=<%=Request.QueryString["username"]%>'">汇款入帐</li>
<li id="tab" name="tab"  style="font-weight:bold">会员返款</li>
<li id="tab" name="tab"  onclick="location.href='finance_1.aspx?username=<%=Request.QueryString["username"]%>'">财务记录</li>
</ul>
</div>
<table border=0 cellpadding=0 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top align="left">
 <table border=0 cellpadding=0 cellspacing=5 width=95% align=center>
      <tr>
        <td align="left" width="10%">用户名</td><td lign="left"><asp:TextBox Id="Username" runat="server" size="15" Maxlength="16" Enabled="false" /></td>
     </tr>
      <tr>
        <td align="left" width="10%">返款金额</td><td lign="left"><asp:TextBox Id="fnc_fk_amount" runat="server" size="15" Maxlength="10" /></td>
     </tr>
      <tr>
        <td align="left" width="10%">返款事由</td>
        <td lign="left"><asp:DropDownList id="fnc_fk_reason" runat="server">
               <asp:ListItem>优惠</asp:ListItem> 
                <asp:ListItem>奖励</asp:ListItem>
                <asp:ListItem>返款</asp:ListItem>
                <asp:ListItem>其他</asp:ListItem>
          </asp:DropDownList></td>
     </tr>
      <tr>
        <td align="left" width="10%">备注</td><td lign="left"><asp:TextBox Id="beizhu" runat="server" TextMode="multiline" Columns="50" rows="5" /></td>
     </tr>
   </table>

  </td>
  <tr>
 </table>
<br>
<asp:Label id="Lbl_Info" runat="server" Lbl_Error/><br>
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
<td height=25 align=center >
<asp:Button      Cssclass=button   text="确定"   runat="server" onclick="Data_Add"/>
<input type="button" class=button  value="返回"  onclick="history.back()">
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



