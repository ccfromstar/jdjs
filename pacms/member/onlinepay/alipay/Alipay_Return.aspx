﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Alipay_Return.aspx.cs" Inherits="Alipay_Return" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>支付结果</title>
</head>
<body>
    <form id="form1" runat="server">
    <TABLE width=500 border=0 align="center" cellPadding=0 cellSpacing=0>

			<TR> 
			  <TD vAlign=top align=middle> <div align="left"><B>支付结果:<%=Pay_Result%></B></div></TD>
			</TR>
			<TR> 
			  <TD vAlign=top align=middle> <div align="left"><B>订单号:<%=Request.QueryString["trade_no"]%></B></div></TD>
			</TR>
			<TR> 
			  <TD vAlign=top align=middle> <div align="left"><B>支付金额:<%=Request.QueryString["total_fee"]%></B></div></TD>
			</TR>
			<TR> 
			  <TD vAlign=top align=middle> <div align="left"><B>支付类型:<%=Request.QueryString["subject"]%></B></div></TD>
			</TR>				

		</TABLE>
    </form>
</body>
</html>