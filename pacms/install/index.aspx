<% @ Page language="c#" Inherits="PageAdmin.Install" %>
<HTML>
<HEAD>
<TITLE>PageAdmin网站系统安装向导</TITLE>
<meta name="keywords"       content="PageAdmin网站系统安装向导"    >
<META  name="description"   content="PageAdmin网站系统安装向导" >
<META content="MSHTML 6.00.2800.1170" name=GENERATOR>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
body,td{
        word-break:break-all;
        color:#000000;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-size: 12px;
        line-height:18px
}

a:link{color:#333333;
	text-decoration: underline;
}
a:visited {color:#333333;
	text-decoration: underline;
}
a:hover {color:#333333;
	 text-decoration:none;
}

.button{
border-top-width:1;
border-bottom-width:1;
border-left-width:1;
border-right-width:1;
border-style:solid;
border-color:#98A9CF;
height:22;
background-color: #ffffff;
cursor:hand
}
.tdbg{
	background-color:#666666;
        color:#ffffff;
     }  

</style>
</HEAD>

<form runat="server" topmargin=0 leftmargin=0>
<table  border="0" cellpadding="0" cellspacing="0" width="100%" align=center>
  <tr>
   <td height=50  bgcolor=#0066CC><img src="images/logo.gif" width=300 height=50></td>
  </tr>
 <tr>
   <td height=20 bgcolor=#0066CC><td>
 </tr>
</table>
<asp:PlaceHolder id="Panel1" runat="server">

<table border=0 cellpadding=0 cellspacing=0 width=100%>
 <tr>
   <td height=20  bgcolor="#98A9CF" align=center>步骤1：用户须知<td>
 </tr>
</table>

<table border=0 cellpadding=0 cellspacing=0 width=100%>
 <tr><td align=center>
<textarea cols="120" rows="28" style="border-top-width:0;border-bottom-width:1;border-left-width:1;border-right-width:1;border-style:solid;border-color:#98A9CF">
PageAdmin网站管理系统最终用户授权协议 

    感谢您使用PageAdmin网站管理系统(以下简称PageAdmin)，PageAdmin是一款基于微软ASP.NET平台开发，集成内容发布、文章、产品、图片、招聘、留言、自定义模型、采集等功能于一体的企业级网站管理系统。
    中山市南头镇华拓网络技术服务中心为PageAdmin产品的开发商，依法独立拥有PageAdmin产品著作权。 官方网站为 www.pageadmin.net。
    无论个人、企业或组织、盈利与否、用途如何（包括以学习和研究为目的），均需仔细阅读本协议，在理解、同意、并遵守本协议的全部条款后，方可开始使用PageAdmin软件。 
    本授权协议适用于PageAdmin软件的所有版本，PageAdmin官方拥有对本授权协议的最终解释权。

    一、协议许可的权利 
    1. 您可以在完全遵守本最终用户授权协议的基础上，将本软件应用于任何用途，而不必支付软件版权授权费用。
    2. 您拥有使用本软件构建的网站全部内容所有权，并独立承担与这些内容的相关法律义务。
    3. 获得商业授权之后，您有权删除、更改PageAdmin的版权信息，同时拥有特定技术支持期限、技术支持方式和技术支持内容。

    二、协议规定的约束和限制
    1. 未获商业授权之前，必须清晰地保留系统底部的版权链接信息(Powered by PageAdmin CMS)，不能清除、修改或采用其他技术手段隐藏。
    2. 未经我司书面许可，不得对本软件或与之关联的商业授权进行出租、出售、抵押或发放授权号。
    3. 未经我司书面许可，禁止在PageAdmin的整体或任何部分基础上以发展任何派生版本、修改版权或第三方版本用于重新分发。
    4. 如果您未能遵守本协议的条款，我司有随时勒令用户终止使用的权利，并保留进一步追究相关法律责任的权力。

    三、有限担保和免责声明 
    1. 本软件及所附带的文件是作为不提供任何明确的或隐含的赔偿或担保的形式提供的。
    2. 用户出于自愿而使用本系统，您必须了解使用本系统的风险，在未获取商业授权之前，我们不承诺提供任何形式的技术支持、使用担保，也不承担任何因使用本系统而产生问题的相关责任。
    3. 电子文本形式的授权协议如同双方书面签署的协议一样，具有完全的和等同的法律效力。您一旦开始安装PageAdmin，即被视为完全理解并接受本协议的各项条款，在享有上述条款授予的权力的同时，受到相关条款的约束和限制。
 </textarea>

</td>
</tr>

<tr>
<td colspan=2 align=center height=40px>
<asp:Button Text="安装pageadmin网站管理系统"  runat="server" onclick="Next_1" CssClass="button"/>&nbsp;&nbsp;
<asp:Button Text="运行SQL" runat="server" CssClass="button" onclick="Show_Sql"/>
</td>
</tr>
</table>
</asp:PlaceHolder>


<asp:PlaceHolder id="P_Sql" runat="server" Visible="false">
<table border=0 cellpadding=0 cellspacing=0 width=100%>
 <tr>
   <td height=20  bgcolor="#98A9CF" align=center>运行SQL<td>
 </tr>
</table>
<table border=0 cellpadding=0 cellspacing=0 width=100%>
 <tr>
   <td height=25  align=center style="font-size:13px">说明：创建表或者升级数据库版本时候可能需要要先运行SQL语句。<td>
 </tr>
<tr>
<td align=center><asp:TextBox Text="" runat="server" id="Tb_sql" TextMode="multiline" Columns="80"  rows="15"/></td>
</tr>

<tr>
<td align=center height=40px>
<asp:Button Text="运行SQL"      runat="server" onclick="Update_Sql" CssClass="button"/>&nbsp;&nbsp;
<input type="button" value="返回上一步"   Class="button" onclick="location.href='index.aspx'">
</td>
</tr>
</table>

</asp:PlaceHolder>


<asp:PlaceHolder id="Panel2" runat="server" Visible="false">
<table border=0 cellpadding=0 cellspacing=0 width=100%>
 <tr>
   <td height=20 align=center bgcolor="#98A9CF">步骤2：基础设置<td>
 </tr>
</table>
<br>

<table border=0 cellpadding=5 cellspacing=0 align=center>
 <tr><td align=right width=30% valign=top>数据库类型：</td>
  <td align=left valign=top><asp:RadioButton id="Radio_1" GroupName="sqlType" runat="server" AutoPostBack="false" />ACCESS数据库&nbsp;&nbsp;
  <asp:RadioButton id="Radio_2" GroupName="sqlType" runat="server" AutoPostBack="false" />Sql Server数据库<br><span style="color:#666666">注：使用Sql数据库前请先在web.config文件中SqlConnection处设置好sql连接字符串。</span>
  </td>
 </tr>
 <tr><td align=right>后台管理目录：</td>
    <td align=left><asp:TextBox Text="" runat="server" id="TbMasterDir" size="20" MaxLength="20"/>
<br><span style="color:#666666">默认后台为:http://您的域名/master/login.aspx，建议请更改为其他名称</span>
</td>
</tr>

<tr><td colspan=2 align=center height=40px>
<input type="button" value="上一步"  Class="button"  onclick="location.href='?setup=1'" />&nbsp;&nbsp;
<asp:Button Text="下一步" runat="server" CssClass="button"  onclick="Next_2"/>
</td>
</tr>
</table>
</asp:PlaceHolder>



<asp:PlaceHolder id="Panel3" runat="server" Visible="false">
<table border=0 cellpadding=0 cellspacing=0 width=100%>
 <tr>
   <td height=20 align=center bgcolor="#98A9CF">步骤3：管理密码设置<td>
 </tr>
</table>
<br>
<div align=center>
系统管理员：<asp:TextBox Text="admin" runat="server" Enabled="false" size="25" /><br>
管理员密码：<asp:TextBox Id="Login_Pass"   runat="server"  size="25" Maxlength="20"/>
<asp:RequiredFieldValidator  ControlToValidate="Login_Pass" display="Dynamic"   type="integer"  runat="server">
<br>请输入管理员密码&nbsp;&nbsp;&nbsp;&nbsp;</asp:RequiredFieldValidator><br>
&nbsp;&nbsp;&nbsp;密码确认：<asp:TextBox Id="Login_Pass1"   runat="server"   size="25" Maxlength="20" /><br>
<asp:RequiredFieldValidator  ControlToValidate="Login_Pass1" display="Dynamic"  type="integer"  runat="server">
请再次输入管理员密码</asp:RequiredFieldValidator>
<br>

<input type="button" value="上一步"  Class="button" onclick="location.href='?setup=2'" />&nbsp;&nbsp;
<asp:Button Text="进入管理后台" runat="server" CssClass="button"  onclick="Next_3"/>
</div>
</asp:PlaceHolder>


<asp:PlaceHolder id="Panel4" runat="server" Visible="false">
<table border=0 cellpadding=0 cellspacing=0 width=100%>
 <tr>
   <td height=20 align=center bgcolor="#98A9CF">步骤4：初始化完毕<td>
 </tr>
 <tr>
   <td height=20 align=center><td>
 </tr>
 <tr>
   <td height=20 align=center>
   初始化完毕!
  <td>
 </tr>
</table>
<br>
</asp:PlaceHolder>
<div align=left style="padding-left:100px"><asp:Label id="Lbl_error" runat="server" style="color:#ff0000;font-size:13px" /></div>
<table border=0 cellpadding=0 cellspacing=0 width=100%>
  <tr>
   <td height=20 background="images/bg_1.gif" align="center"></td>
 </tr>
 <tr>
   <td align=left height=25>&nbsp;Pageadmin主站:<a href=http://www.pageadmin.net target="Pageadmin">www.pageadmin.net</a>&nbsp;&nbsp;Pageadmin论坛:<a href=http://bbs.pageadmin.net target="Pageadmin">bbs.pageadmin.net</a></td>
 </tr>
</table>
</form>
</body>
</html>