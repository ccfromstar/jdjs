<%@ CODEPAGE=65001 %>
<%
'///////////////////////////////////////////////////////////////////////////////
'//              Z-Blog
'// 作    者:    朱煊(zx.asd)&(sipo)
'// 版权所有:    RainbowSoft Studio
'// 技术支持:    rainbowsoft@163.com
'// 程序名称:    
'// 程序版本:    
'// 单元名称:    c_urlredirect.asp
'// 开始时间:    2007-1-24
'// 最后修改:    
'// 备    注:    
'///////////////////////////////////////////////////////////////////////////////
%>
<% Option Explicit %>
<% On Error Resume Next %>
<% Response.Charset="UTF-8" %>
<% Response.Buffer=True %>
<!-- #include file="../c_option.asp" -->
<!-- #include file="../function/c_function.asp" -->
<%
Dim strUrl
strUrl=URLDecodeForAntiSpam(Request.QueryString("url"))
If strUrl="" Then strUrl="http://www.rainbowsoft.org/"

Response.Redirect strUrl

%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<%=ZC_BLOG_LANGUAGE%>" lang="<%=ZC_BLOG_LANGUAGE%>">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Language" content="<%=ZC_BLOG_LANGUAGE%>" />
	<meta name="robots" content="noindex,nofollow"/>
	<link rel="stylesheet" rev="stylesheet" href="../CSS/admin.css" type="text/css" media="screen" />
	<meta http-equiv="refresh" content="0;URL=<%Response.Write strUrl%>"/>
	<title><%=ZC_BLOG_TITLE & ZC_MSG044 & ZC_MSG288%></title>
</head>
<body>
<div id="divMain">
<div class="Header"><%=ZC_MSG288%></div>
<div id="divMain2">
<form id="edit" name="edit" method="post">
<p><%=ZC_MSG054%></p>
<p><a href="<%Response.Write URLDecodeForAntiSpam(Request.QueryString("url"))%>" rel="nofollow"><%Response.Write URLDecodeForAntiSpam(Request.QueryString("url"))%></a></p>
</form>
</div>
</div>
</body>
</html> -->