<%@ CODEPAGE=65001 %>
<%
'///////////////////////////////////////////////////////////////////////////////
'// 插件应用:    Z-Blog 1.8 Spirit Build 80722 其它版本未知
'// 插件制作:    心诺空间(http://www.seanloo.cn)
'// 备   注:     River_PicPlay
'// 最后修改：   2009.4.13
'// 最后版本:    2.0.0
'///////////////////////////////////////////////////////////////////////////////

%>
<% Option Explicit %>
<% 'On Error Resume Next %>
<% Response.Charset="UTF-8" %>
<% Response.Buffer=True %>
<!-- #include file="../../../c_option.asp" -->
<!-- #include file="../../../function/c_function.asp" -->
<!-- #include file="../../../function/c_system_lib.asp" -->
<!-- #include file="../../../function/c_system_base.asp" -->
<!-- #include file="../../../function/c_system_event.asp" -->
<!-- #include file="../../../function/c_system_plugin.asp" -->
<%

Call System_Initialize()

'检查非法链接
Call CheckReference("")

'检查权限
If BlogUser.Level>2 Then Call ShowError(6) 

If CheckPluginState("Sean_Simple_T")=False Then Call ShowError(48)

BlogTitle="博文幻灯片"
%>
<!-- #include file="function.asp" -->
<%
Dim tmpSng, tmpRiver_PicPlay_Count, tmpRiver_PicPlay_Pics, tmpRiver_PicPlay_Links, tmpRiver_PicPlay_Texts
Dim tmpRiver_PicPlay_Focus_Width, tmpRiver_PicPlay_Focus_Height, tmpRiver_PicPlay_Text_Height
Dim i
Dim arrRiver_PicPlay_Pics, arrRiver_PicPlay_Links, arrRiver_PicPlay_Texts

tmpSng=LoadFromFile(BlogPath & "/THEMES/Sean_Simple_T/PLUGIN/include.asp","utf-8")

Call LoadValueForSetting(tmpSng,True,"Numeric","River_PicPlay_Focus_Width",tmpRiver_PicPlay_Focus_Width)
Call LoadValueForSetting(tmpSng,True,"Numeric","River_PicPlay_Focus_Height",tmpRiver_PicPlay_Focus_Height)
Call LoadValueForSetting(tmpSng,True,"Numeric","River_PicPlay_Text_Height",tmpRiver_PicPlay_Text_Height)
Call LoadValueForSetting(tmpSng,True,"Numeric","River_PicPlay_Count",tmpRiver_PicPlay_Count)

Call LoadValueForSetting(tmpSng,True,"String","River_PicPlay_Pics",tmpRiver_PicPlay_Pics)
Call LoadValueForSetting(tmpSng,True,"String","River_PicPlay_Links",tmpRiver_PicPlay_Links)
Call LoadValueForSetting(tmpSng,True,"String","River_PicPlay_Texts",tmpRiver_PicPlay_Texts)

arrRiver_PicPlay_Pics = Split(tmpRiver_PicPlay_Pics, "|")
arrRiver_PicPlay_Links = Split(tmpRiver_PicPlay_Links, "|")
arrRiver_PicPlay_Texts = Split(tmpRiver_PicPlay_Texts, "|")

%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<%=ZC_BLOG_LANGUAGE%>" lang="<%=ZC_BLOG_LANGUAGE%>">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Language" content="<%=ZC_BLOG_LANGUAGE%>" />
	<link rel="stylesheet" rev="stylesheet" href="../../../CSS/admin.css" type="text/css" media="screen" />
	<script language="JavaScript" src="../../../script/common.js" type="text/javascript"></script>
	<link rel="stylesheet" href="../../../CSS/jquery.bettertip.css" type="text/css" media="screen">
	<script language="JavaScript" src="../../../script/jquery.bettertip.pack.js" type="text/javascript"></script>

	<title><%=BlogTitle%></title>
</head>
<body>

			<div id="divMain">
<div class="Header">博文幻灯片工具</div>
<div id="divMain2">
<%
Call GetBlogHint()
%>
	<table border="1" cellspacing="0" cellpadding="0" align="center" width="100%">
	<tr>
	<th height=25 align="center">标题</th>
	<th height=25 align="center">图片</th>
	<th height=25 align="center">地址</th>
	<th height=25 align="center">操作</th>
	</tr>
<%
	For i = 0 To UBound(arrRiver_PicPlay_Pics)
		Response.Write "<tr>"
		Response.Write "<td>" & arrRiver_PicPlay_Texts(i) & "</td>"
		Response.Write "<td>" & arrRiver_PicPlay_Pics(i) & "</td>"
		Response.Write "<td>" & arrRiver_PicPlay_Links(i) & "</td>"
		Response.Write "<td><a href=""?Action=del&id=" & i + 1 & """>删除</a></td>"
		Response.Write "</tr>"
	Next 'i
%>
	</table>

<form id="edit" name="add" method="post" action="?Action=post">
<p><b>添加幻灯</b>　　<!--<a href="?Action=build"><font color=red>生成幻灯</font></a>　　-->模板标签：<#CACHE_INCLUDE_SEAN_SIMPLE_T#><br />
图片地址：<input type="text" name="Pics" size="20"><br />
网页地址：<input type="text" name="Links" size="20"><br />
文章标题：<input type="text" name="Texts" size="20"><br />
</p>
<input type="submit" class="button" value=提交 id="btnPost" /> <input type="reset" class="button" value="重置" id="btnPost" /></p>
</form>
</div>
<script>


</script>
</body>
</html>
<%
Call System_Terminate()

If Err.Number<>0 then
  Call ShowError(0)
End If
%>

