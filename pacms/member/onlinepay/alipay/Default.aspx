<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>支付宝在线支付接口</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<style type="text/css">
body{word-break:break-all;font-size:9pt;line-height:14px;margin:0 0 0 0;text-align:center;}
.button {
	width:55px;
	font-size:9pt;
	height:19px;
	cursor: hand;
	background-image: url(../payimage/button.gif);
	background-position: center center;
	border-top: 0px outset #eeeeee;
	border-right: 0px outset #888888;
	border-bottom: 0px outset #888888;
	border-left: 0px outset #eeeeee;
	padding-top: 4px;
	background-repeat: repeat-x;
	}
</style>
</head>
<body>
<div  style="margin-left:auto;margin-right:auto;text-align:center;width:380px;height:250px;padding:150px 0 0 120px;border:1px solid #031545;background:#333333 url(../payimage/paybg.jpg) no-repeat 0 0;">
<TABLE cellSpacing=0 cellPadding=4  border=0>
<form id="form1" runat="server">
    <tr>
      <td  width="200px" align="left">请填入您要入款的金额，支付成功后该款项将直接划入您的会员帐户上。<br><br>请输入入款金额，按确定。 </td>
    <tr>
  <tr><td>
<asp:TextBox ID="T_gateway" Text="https://www.alipay.com/cooperate/gateway.do?" visible="false" runat="server" Width="350px"></asp:TextBox>
<asp:DropDownList ID="T_service" visible="false"  runat="server"><asp:ListItem>create_direct_pay_by_user</asp:ListItem></asp:DropDownList>
<asp:TextBox ID="T_partner"  visible="false"  runat="server" Width="350px"></asp:TextBox>
<asp:TextBox ID="T_sign_type" Text="MD5" visible="false"   runat="server" Width="350px"></asp:TextBox>
<asp:TextBox ID="T_subject" Text="支付宝在线支付" visible="false"  runat="server" Width="350px" ></asp:TextBox>
<asp:TextBox ID="T_body" Text="在线支付" visible="false"  runat="server" Width="350px"></asp:TextBox>
<asp:TextBox ID="T_payment_type" Text="1" visible="false"  runat="server" Width="350px"></asp:TextBox>
<asp:TextBox ID="T_show_url" Text="" visible="false" runat="server" Width="350px"></asp:TextBox>
<asp:TextBox ID="T_seller_email" runat="server" visible="false" Width="350px"></asp:TextBox>
<asp:TextBox ID="T_key" runat="server" visible="false" Width="350px" ></asp:TextBox>
<asp:TextBox ID="T_return_url"  visible="false" runat="server" Width="350px"></asp:TextBox>
<asp:TextBox ID="T_notify_url"  visible="false"  runat="server" Width="350px"></asp:TextBox>
<asp:TextBox ID="T_inputchatset" runat="server" visible="false" Text="utf-8" Width="350px"></asp:TextBox>
入款金额：<asp:TextBox ID="T_total_fee" Text="0.1" runat="server" Maxlength="6" size="5"></asp:TextBox>&nbsp;元
<asp:Button ID="Button1"  runat="server"  CssClass="button" Text="确 定" OnClick="Button1_Click" />
 </tr>
  <td>
    </form>
</table>
</div>
<script>
function C_Tb()
 {
   if(document.form1.T_total_fee.value=='0')
    {
     alert('支付金额必须大于0!');
     return false;
    }
   else
    {
     return true;
    }
 }

</script>
</body>
</html>
