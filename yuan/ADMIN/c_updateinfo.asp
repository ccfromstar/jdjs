<%@ CODEPAGE=65001 %>
<%
'///////////////////////////////////////////////////////////////////////////////
'//              Z-Blog
'// 作    者:    朱煊(zx.asd)&(sipo)
'// 版权所有:    RainbowSoft Studio
'// 技术支持:    rainbowsoft@163.com
'// 程序名称:    
'// 程序版本:    
'// 单元名称:    c_updateinfo.asp
'// 开始时间:    2007-1-26
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
	If IsEmpty(Request.QueryString("reload"))=False Then
		Application.Lock
		Application(ZC_BLOG_CLSID & "PING_TIME")=Empty
		Application(ZC_BLOG_CLSID & "PING_CONTENT")=Empty
		Application.UnLock
	End If

	If Len(ZC_UPDATE_INFO_URL)>0 Then
		Dim strPingTime
		Dim strPingContent

		Application.Lock
		strPingTime=Application(ZC_BLOG_CLSID & "PING_TIME")
		strPingContent=Application(ZC_BLOG_CLSID & "PING_CONTENT")
		Application.UnLock

		If IsDate(strPingTime)=True Then
			strPingTime=DateDiff("h", strPingTime,Now)
		End If

		If (IsEmpty(strPingContent)=True) Or (strPingTime>12) Then
			Dim strSendTB
			strSendTB = "inpHost=" & Server.URLEncode(ZC_BLOG_HOST) & "&inpTimezone=" & Server.URLEncode(ZC_TIME_ZONE) & "&inpVersion=" & Server.URLEncode(ZC_BLOG_VERSION) & "&inpLanguage=" & Server.URLEncode(ZC_BLOG_LANGUAGE) & "&inpIP=" & Server.URLEncode(Request.ServerVariables("LOCAL_ADDR"))

			Dim objPing
			Set objPing = Server.CreateObject("MSXML2.ServerXMLHTTP")

			objPing.open "POST",ZC_UPDATE_INFO_URL,False

			objPing.setRequestHeader "Content-Type", "application/x-www-form-urlencoded"
			objPing.send strSendTB

			strPingContent=objPing.responseText
			Dim objRegExp
			Set objRegExp=New RegExp
			objRegExp.IgnoreCase =True
			objRegExp.Global=True
			objRegExp.Pattern="<script.*/*>|</script>|<[a-zA-Z][^>]*=['""]+javascript:\w+.*['""]+>|<\w+[^>]*\son\w+=.*[ /]*>"
			strPingContent= objRegExp.Replace(strPingContent,"")

			Set objPing = Nothing

			Application.Lock
			Application(ZC_BLOG_CLSID & "PING_TIME")=Now
			Application(ZC_BLOG_CLSID & "PING_CONTENT")=strPingContent
			Application.UnLock
		End If

		Response.Write strPingContent

	End If
%>