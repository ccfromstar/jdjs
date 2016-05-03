<% @ Page Language="C#" Inherits="PageAdmin.member_fnc_rk" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="member_3" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>汇款入帐</b></td></tr>
 <tr><td height=10 ></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">

<form runat="server" >
<div id="tabdiv">
<ul>
<li id="tab" name="tab"  onclick="location.href='member_info.aspx?username=<%=Request.QueryString["username"]%>'">会员信息</li>
<li id="tab" name="tab"  style="font-weight:bold">汇款入帐</li>
<li id="tab" name="tab"  onclick="location.href='member_fnc_xf.aspx?username=<%=Request.QueryString["username"]%>'">消费扣款</li>
<li id="tab" name="tab"  onclick="location.href='member_fnc_fk.aspx?username=<%=Request.QueryString["username"]%>'">会员返款</li>
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
        <td align="left" width="10%">入款金额</td><td lign="left"><asp:TextBox Id="fnc_rk_amount" runat="server" size="15" Maxlength="15" /></td>
     </tr>
      <tr>
        <td align="left" width="10%">汇款方式</td>
        <td lign="left">
         <asp:DropDownList id="fnc_rk_way" runat="server">
               <asp:ListItem>建设银行</asp:ListItem> 
                <asp:ListItem>邮政汇款</asp:ListItem>
                <asp:ListItem>工商银行</asp:ListItem>
                <asp:ListItem>中国银行</asp:ListItem>
                <asp:ListItem>农业银行</asp:ListItem>
                <asp:ListItem>招商银行</asp:ListItem>  
                <asp:ListItem>交通银行</asp:ListItem>  
                <asp:ListItem>在线支付</asp:ListItem> 
                <asp:ListItem>公司帐号</asp:ListItem>
                <asp:ListItem>现金支付</asp:ListItem>
                <asp:ListItem>其它方式</asp:ListItem>
          </asp:DropDownList>
        </td>
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



