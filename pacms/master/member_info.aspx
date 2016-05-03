<% @ Page Language="C#"  Inherits="PageAdmin.member_info" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="member_3" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>会员管理</b></td></tr>
 <tr><td height=10 ></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">
<form runat="server" >
<div id="tabdiv">
<ul>
<li id="tab" name="tab"  onclick="showtab(0,1)" style="font-weight:bold">会员信息</li>
<li id="tab" name="tab"  onclick="location.href='member_fnc_rk.aspx?username=<%=Request.QueryString["username"]%>'">汇款入帐</li>
<li id="tab" name="tab"  onclick="location.href='member_fnc_xf.aspx?username=<%=Request.QueryString["username"]%>'">消费扣款</li>
<li id="tab" name="tab"  onclick="location.href='member_fnc_fk.aspx?username=<%=Request.QueryString["username"]%>'">会员返款</li>
<li id="tab" name="tab"  onclick="location.href='finance_1.aspx?username=<%=Request.QueryString["username"]%>'">财务记录</li>
</ul>
</div>
<table border=0 cellpadding=0 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top align="left">
 <table border=0 cellpadding="0px" cellspacing="1px" width=95% align=center>

      <tr>
        <td align="left" height="30px">会员类别：</td><td lign="left"><asp:DropDownList Id="Member_type" DataTextField="m_type"  DataValueField="id" runat="server"/> </td>
      

        <td align="left" width="10%">密码：</td><td lign="left" ><asp:TextBox  Id="UserPass"  Cssclass="member_info_textbox"  runat="server" Maxlength="16"/>&nbsp;&nbsp;<asp:button Text="重置" id="SetPass" cssclass="button" runat="server" OnClick="PageAdmin_Update_Pass"/></td>
     </tr>

      <tr >
        <td align="left" width="10%" height="30px">用户名：</td><td lign="left" ><asp:TextBox Id="UserName" runat="server" Cssclass="member_info_textbox" Enabled="false" style="width:120px" />&nbsp;<asp:Button Text="会员中心" id="GoMember" cssclass="button" runat="server" OnClick="PageAdmin_Get_Member"/></td>
       
        <td align="left" >公司名称：</td><td lign="left" ><asp:TextBox  Id="Company" runat="server"  Cssclass="member_info_textbox"  maxlength="50" /></td>
     </tr>

      <tr >
        <td align="left" height="30px">联系人姓名：</td><td lign="left" ><asp:TextBox Id="TrueName" runat="server" Cssclass="member_info_textbox"  maxlength="50" /></td>

        <td align="left" >电子邮件：</td><td lign="left"><asp:TextBox  Id="Email" runat="server" Cssclass="member_info_textbox"  maxlength="50"/></td>
     </tr>

      <tr >
        <td align="left" height="30px">性别：</td><td lign="left"><asp:TextBox Id="Sex" Runat="server" Cssclass="member_info_textbox"  maxlength="50"/></td>
        <td align="left" >所在城市：</td><td lign="left"><asp:TextBox  Id="City" runat="server" Cssclass="member_info_textbox"  maxlength="50" /></td>
     </tr>

     <tr >
       <td align="left" height="30px">所在省份：</td><td lign="left"><asp:TextBox  Id="Province" runat="server" Cssclass="member_info_textbox"  maxlength="50"/></td>
       
        <td align="left" >邮编：</td><td lign="left"><asp:TextBox  Id="Postcode" runat="server" Cssclass="member_info_textbox"  maxlength="50"/></td>
     </tr>

    <tr >
        <td align="left" height="30px">联系地址：</td><td lign="left"><asp:TextBox  Id="Address" runat="server" Cssclass="member_info_textbox"  maxlength="100"/></td>
       
        <td align="left" >传真：</td><td lign="left"><asp:TextBox  Id="Fax" runat="server" Cssclass="member_info_textbox"  maxlength="50"/></td>
     </tr>

    <tr >
        <td align="left" height="30px">联系电话：</td><td lign="left"><asp:TextBox  Id="Tel" runat="server"  Cssclass="member_info_textbox"  maxlength="50"/></td>
        <td align="left" >MSN：</td><td lign="left"><asp:TextBox  Id="Msn" runat="server" Cssclass="member_info_textbox"  maxlength="50" /></td>
     </tr>

     <tr >
        <td align="left" height="30px">QQ：</td><td lign="left"><asp:TextBox  Id="QQ" runat="server" Cssclass="member_info_textbox" maxlength="50" /></td>
        <td align="left">访问来源：</td><td lign="left"><asp:TextBox Id="Urlfrom" runat="server" Cssclass="member_info_textbox"  maxlength="50" /></td>
     </tr>


     <tr >
        <td align="left" height="30px">注册IP：</td><td lign="left"><asp:TextBox  Id="Reg_Ip" runat="server" Cssclass="member_info_textbox" /></td>
        <td align="left">最后登陆IP：</td><td lign="left"><asp:TextBox  Id="Lst_Ip" runat="server" Cssclass="member_info_textbox" /></td>
     </tr>

     <tr >
        <td align="left" height="30px">注册时间：</td><td lign="left"><asp:TextBox  Id="RegDate" runat="server" Cssclass="member_info_textbox" /></td>
        <td align="left">最后登陆时间：</td><td lign="left"><asp:TextBox  Id="LastLogin" runat="server" Cssclass="member_info_textbox" /></td>
     </tr>
   </table>

  </td>
  <tr>
 </table>

<br>
<table border=0 cellpadding=0 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top align="left">

 <table border=0 cellpadding=2 cellspacing=0 width=95% align=center>
   <tr>
     <td height=20 colspan=4><b>财务信息</b></td>
   </tr>
      <tr>
        <td align="left" width="25%">可用金额&nbsp;&nbsp;<asp:TextBox  Id="Fnc_ky" runat="server" size="12" Maxlength="20"  onkeyup="if(isNaN(value))this.value='0'" /></td>

        <td align="left" width="25%">消费金额&nbsp;&nbsp;<asp:TextBox  Id="Fnc_xf" size="12"  runat="server" Maxlength="20" onkeyup="if(isNaN(value))this.value='0'"  /></td>

        <td align="left" width="25%">返款总额&nbsp;&nbsp;<asp:TextBox  Id="Fnc_fk" runat="server" size="12"  Maxlength="20" onkeyup="if(isNaN(value))this.value='0'"  /></td>

        <td align="left" width="25%">入款总额&nbsp;&nbsp;<asp:TextBox  Id="Fnc_rk" runat="server" size="12"  Maxlength="20" onkeyup="if(isNaN(value))this.value='0'"  /></td>
     </tr>
   </table>


 <table border=0 cellpadding=2 cellspacing=0 width=95% align=center>
   <tr>
     <td height=20 colspan=4><b>其他信息</b></td>
   </tr>
    <tr>
        <td align="left" width="25%">待审文章&nbsp;&nbsp;<asp:TextBox Id="Uncheck_Article" runat="server" size="12" Maxlength="10"  Enabled="false"/><a href="information_1.aspx?username=<%=User_Name%>&check=0"><image src="images/sign_3.gif" title="详细" border="0" hspace="2"></a></td>

        <td align="left" width="25%">文章总数&nbsp;&nbsp;<asp:TextBox  Id="All_Article" size="12"  runat="server" Maxlength="10"  Enabled="false"/><a href="information_1.aspx?username=<%=User_Name%>"><image src="images/sign_3.gif" title="详细" border="0" hspace="2"></a></td>

        <td align="left" width="25%">待审产品&nbsp;&nbsp;<asp:TextBox  Id="Uncheck_Product" runat="server" size="12"  Maxlength="10"  Enabled="false"/><a href="product_1.aspx?username=<%=User_Name%>&&check=0"><image src="images/sign_3.gif" title="详细" border="0" hspace="2"></a></td>

        <td align="left" width="25%">产品总数&nbsp;&nbsp;<asp:TextBox  Id="All_Product" runat="server" size="12"  Maxlength="10"  Enabled="false"/><a href="product_1.aspx?username=<%=User_Name%>"><image src="images/sign_3.gif" title="详细" border="0" hspace="2"></a></td>
     </tr>
    <tr>
        <td align="left" width="25%">待复留言&nbsp;&nbsp;<asp:TextBox  Id="Noreplay_Feedback" runat="server" size="12"  Maxlength="10"  Enabled="false"/><a href="feedback_1.aspx?username=<%=User_Name%>&replay=0"><image src="images/sign_3.gif" title="详细" border="0" hspace="2"></a></td>

        <td align="left" width="25%">留言总数&nbsp;&nbsp;<asp:TextBox  Id="All_Feedback" runat="server" size="12"  Maxlength="10"  Enabled="false"/><a href="feedback_1.aspx?username=<%=User_Name%>"><image src="images/sign_3.gif" title="详细" border="0" hspace="2"></a></td>

        <td align="left" width="25%">未付订单&nbsp;&nbsp;<asp:TextBox Id="NoPay_Order" runat="server" size="12" Maxlength="10"  Enabled="false"/><a href="order_1.aspx?username=<%=User_Name%>"><image src="images/sign_3.gif" title="详细" border="0" hspace="2"></a></td>

        <td align="left" width="25%">定单总数&nbsp;&nbsp;<asp:TextBox  Id="All_Order" size="12"  runat="server" Maxlength="10"  Enabled="false"/><a href="order_1.aspx?username=<%=User_Name%>"><image src="images/sign_3.gif" title="详细" border="0" hspace="2"></a></td>

     </tr>
   </table>

  </td>
  <tr>
 </table>
<br>


<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
<td height=25 align=center >
<asp:Button      Cssclass=button   text="修改"   onclick="PageAdmin_Data_Update" runat="server" />
<input type="button" class=button  value="返回"  onclick="history.back()">
</td>
 </tr>
</table>
</form>
</td>
</tr>
</table>
</center>
<script>
  function  FRegIp()
   {
     if(document.getElementById("Reg_Ip").value!="")
     {
      window.open("http://www.ip138.com/ips.asp?ip="+document.getElementById("Reg_Ip").value,"ip");
     }
   }

  function  FLstIp()
   {
     if(document.getElementById("Lst_Ip").value!="")
     {
      window.open("http://www.ip138.com/ips.asp?ip="+document.getElementById("Lst_Ip").value,"ip");
     }
   }
   document.getElementById("Reg_Ip").onclick=FRegIp;
   document.getElementById("Lst_Ip").onclick=FLstIp;
</script>
</body>
</html>  



