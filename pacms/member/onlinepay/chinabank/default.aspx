<%@ Page Language="C#"  Inherits="chinabank_pay" src="Default.ascx.cs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>网银在线支付接口</title>
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
<form  method="post" name=formbill action="/member/onlinepay/chinabank/Send.aspx">
    <tr>
      <td  width="200px" align="left">请填入您要入款的金额，支付成功后该款项将直接划入您的会员帐户上。<br><br>请输入入款金额，按确定。 </td>
    <tr>
      <td height=20 align="left">
<input name="remark2" type="hidden" id="remark2" value="在线支付" >
<input name="v_oid" type="hidden" maxlength="64" value="">
<input name="v_rcvname" type="hidden" value="<%=TrueName%>">
<input name="v_rcvaddr" type="hidden" id="v_rcvaddr"  value="<%=Address%>">
<input name="v_rcvtel" type="hidden" id="v_rcvtel"  value="<%=Tel%>">
<input name="v_rcvpost" type="hidden" id="v_rcvpost"  value="<%=Postcode%>">
<input type="hidden" name="v_rcvemail" value="<%=Email%>">
<input type="hidden" name="v_rcvmobile" value="">
<input name="remark1" type="hidden" id="remark1" value="">
<input name="v_ordername" type="hidden" id="v_ordername" value="<%=TrueName%>">
<input name="v_orderaddr" type="hidden" id="v_orderaddr"  value="<%=TrueName%>">
<input name="v_ordertel" type="hidden" id="v_ordertel"  value="<%=Tel%>">
<input name="v_orderpost" type="hidden" id="v_orderpost"  value="<%=Postcode%>">
<input name="v_orderemail" type="hidden" id="v_orderemail" value="<%=Email%>">
<input name="v_ordermobile" type="hidden" id="v_ordermobile" value="">
入款金额：<input name="v_amount" type=text value="0.1" maxlength="6" size="5" onkeyup="if(isNaN(value))execCommand('undo')">&nbsp;元
<input type="submit" name="Submit" value=" 确 定 " class="button" onclick="if(document.formbill.v_amount.value=='0'){alert('支付金额必须大于0!');return false;}">
   </TD>
     </TR>
</form>
        </TD>
      </TR>
  </FORM></TBODY>
</TABLE>
</div>
</BODY></HTML>
