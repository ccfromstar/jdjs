<%
'///////////////////////////////////////////////////////////////////////////////
'//              Z-Blog
'// 作    者:    朱煊(zx.asd)2008-5-30
'// 版权所有:    RainbowSoft Studio
'// 技术支持:    rainbowsoft@163.com
'// 程序名称:    
'// 程序版本:    
'// 单元名称:    c_system_manage.asp
'// 开始时间:    2005.02.11
'// 最后修改:    
'// 备    注:    
'///////////////////////////////////////////////////////////////////////////////

'*********************************************************
' 目的：    
'*********************************************************
Function ExportPageBar(PageNow,PageAll,PageLength,Url)

If PageAll=0 Then
	Exit Function
End if

Dim s
Dim i

'Dim PageNow
'Dim PageAll
'Dim PageLength
Dim PageFrist
Dim PageLast
Dim PagePrevious
Dim PageNext
Dim PageBegin
Dim PageEnd

PageFrist = 1
PageLast = PageAll

PageBegin = PageNow
PageEnd = PageBegin + PageLength - 1

If PageEnd > PageAll Then
	PageEnd = PageAll
	PageBegin = PageAll - PageLength + 1
	If PageBegin < 1 Then
		PageBegin = 1
	End If
End If

s=s &"<a href='"&Url & PageFrist &"'>["& "&lt;&lt;" &"]</a> "

For i=PageBegin To PageEnd
	If i=PageNow Then
		s=s &"["& Replace(ZC_MSG036,"%s",i) &"] "
	Else
		s=s &"<a href='"&Url & i  &"'>["& Replace(ZC_MSG036,"%s",i) &"]</a> "
	End If
Next

s=s &"<a href='"&Url & PageLast  &"'>["& "&gt;&gt;" &"]</a> "

ExportPageBar=s

End Function



'*********************************************************
' 目的：    Manager Articles
'*********************************************************
Function ExportArticleList(intPage,intCate,intLevel,intTitle)

Call Add_Response_Plugin("Response_Plugin_ArticleMng_SubMenu",MakeSubMenu(ZC_MSG168 & "(" & ZC_MSG100 & ")","../cmd.asp?act=ArticleEdt&type=" & ZC_BLOG_WEBEDIT,"m-left",False))

Call Add_Response_Plugin("Response_Plugin_ArticleMng_SubMenu",MakeSubMenu(ZC_MSG168 & "(" & ZC_MSG101 & ")","../cmd.asp?act=ArticleEdt","m-left",False))

	Dim i
	Dim objRS
	Dim strSQL
	Dim strPage
	Dim intPageAll

	Call CheckParameter(intPage,"int",1)
	Call CheckParameter(intCate,"int",-1)
	Call CheckParameter(intLevel,"int",-1)
	Call CheckParameter(intTitle,"sql",-1)
	intTitle=vbsunescape(intTitle)
	intTitle=FilterSQL(intTitle)

	Response.Write "<div class=""Header"">" & ZC_MSG067 & "</div>"
	Response.Write "<div class=""SubMenu"">" & Response_Plugin_ArticleMng_SubMenu & "</div>"
	Response.Write "<div id=""divMain2"">"

	Call GetBlogHint()

	Response.Write "<form id=""edit"" method=""post"" enctype=""application/x-www-form-urlencoded"" action=""../admin/admin.asp?act=ArticleMng"">"

	Response.Write "<p>"&ZC_MSG158&":</p><p>"

	Response.Write ZC_MSG012&" <select class=""edit"" size=""1"" id=""cate"" name=""cate"" style=""width:100px;"" ><option value=""-1"">"&ZC_MSG157&"</option> "
	Dim Category
	For Each Category in Categorys
		If IsObject(Category) Then
			Response.Write "<option value="""&Category.ID&""" "
			Response.Write ">"&TransferHTML(Category.Name,"[html-format]")&"</option>"
		End If
	Next
	Response.Write "</select> "

	Response.Write ZC_MSG061&" <select class=""edit"" size=""1"" id=""level"" name=""level"" style=""width:80px;"" ><option value=""-1"">"&ZC_MSG157&"</option> "

	For i=LBound(ZVA_Article_Level_Name)+1 to Ubound(ZVA_Article_Level_Name)
			Response.Write "<option value="""&i&""" "
			Response.Write ">"&ZVA_Article_Level_Name(i)&"</option>"
	Next
	Response.Write "</select>"

	Response.Write " "&ZC_MSG224&" <input id=""title"" name=""title"" style=""width:150px;"" type=""text"" value="""" /> "
	Response.Write "<input type=""submit"" class=""button"" value="""&ZC_MSG087&""">"
	
	Response.Write "</p></form>"



	Set objRS=Server.CreateObject("ADODB.Recordset")
	objRS.CursorType = adOpenKeyset
	objRS.LockType = adLockReadOnly
	objRS.ActiveConnection=objConn
	objRS.Source=""

	strSQL="WHERE ([log_Level]>0) AND (true=true) "

	If CheckRights("Root")=False Then strSQL= strSQL & "AND [log_AuthorID] = " & BlogUser.ID

	If intCate<>-1 Then
		strSQL= strSQL & " AND [log_CateID] = " & intCate
	End If

	If intLevel<>-1 Then
		strSQL= strSQL & " AND [log_Level] = " & intLevel
	End If

	If intTitle<>"-1" Then
		strSQL = strSQL & "AND ( (InStr(1,LCase([log_Title]),LCase('" & intTitle &"'),0)<>0) OR (InStr(1,LCase([log_Intro]),LCase('" & intTitle &"'),0)<>0) OR (InStr(1,LCase([log_Content]),LCase('" & intTitle &"'),0)<>0) )"
	End If

	Response.Write "<table border=""1"" width=""100%"" cellspacing=""1"" cellpadding=""1"">"
	Response.Write "<tr><td>"& ZC_MSG076 &"</td><td>"& ZC_MSG012 &"</td><td>"& ZC_MSG003 &"</td><td>"& ZC_MSG075 &"</td><td>"& ZC_MSG060 &"</td><td></td><td></td><td></td></tr>"

	objRS.Open("SELECT * FROM [blog_Article] "& strSQL &" ORDER BY [log_PostTime] DESC")
	objRS.PageSize=ZC_MANAGE_COUNT
	If objRS.PageCount>0 Then objRS.AbsolutePage = intPage
	intPageAll=objRS.PageCount

	If (Not objRS.bof) And (Not objRS.eof) Then

		For i=1 to objRS.PageSize

			Response.Write "<tr>"

			Response.Write "<td>" & objRS("log_ID") & "</td>"

			Dim Cate
			For Each Cate in Categorys
				If IsObject(Cate) Then
					If Cate.ID=objRS("log_CateID") Then
						Response.Write "<td>" & Left(Cate.Name,6) & "</td>"
					End If
				End If
			Next

			Dim User
			For Each User in Users
				If IsObject(User) Then
					If User.ID=objRS("log_AuthorID") Then
						Response.Write "<td>" & User.Name & "</td>"
					End If
				End If
			Next

			'Response.Write "<td>" & ZVA_Article_Level_Name(objRS("log_Level")) & "</td>"
			Response.Write "<td>" & FormatDateTime(objRS("log_PostTime"),vbShortDate) & "</td>"
			If Len(objRS("log_Title"))>14 Then
				Response.Write "<td><a href=""../view.asp?id=" & objRS("log_ID") & """ title="""& Replace(objRS("log_Title"),"""","") &""" target=""_blank"">" & Left(objRS("log_Title"),14) & "..." & "</a></td>"
			Else
				Response.Write "<td><a href=""../view.asp?id=" & objRS("log_ID") & """ title="""& Replace(objRS("log_Title"),"""","") &""" target=""_blank"">" & objRS("log_Title") & "</a></td>"
			End If
			Response.Write "<td align=""center""><a href=""../cmd.asp?act=ArticleEdt&type="& ZC_BLOG_WEBEDIT &"&id=" & objRS("log_ID") & """>[" & ZC_MSG100 & "]</a></td>"
			Response.Write "<td align=""center""><a href=""../cmd.asp?act=ArticleEdt&id=" & objRS("log_ID") & """>[" & ZC_MSG101 & "]</a></td>"
			Response.Write "<td align=""center""><a onclick='return window.confirm("""& ZC_MSG058 &""");' href=""../cmd.asp?act=ArticleDel&id=" & objRS("log_ID") & """>[" & ZC_MSG063 & "]</a></td>"
			Response.Write "</tr>"

			objRS.MoveNext
			If objRS.eof Then Exit For

		Next

	End If

	Response.Write "</table>"

	'For i=1 to objRS.PageCount
	'	strPage=strPage &"<a href='../admin/admin.asp?act=ArticleMng&amp;page="& i &"&cate="&ReQuest("cate")&"&level="&ReQuest("level")&"&title="&Escape(ReQuest("title"))&"'>["& Replace(ZC_MSG036,"%s",i) &"]</a> "
	'Next

	strPage=ExportPageBar(intPage,intPageAll,ZC_PAGEBAR_COUNT,"../admin/admin.asp?act=ArticleMng&amp;cate="&ReQuest("cate")&"&amp;level="&ReQuest("level")&"&amp;title="&Escape(ReQuest("title")) & "&amp;page=")

	Response.Write "<hr/>" & ZC_MSG042 & ": " & strPage
	Response.Write "</div>"

	objRS.Close
	Set objRS=Nothing

	ExportArticleList=True

End Function
'*********************************************************




'*********************************************************
' 目的：    Manager Categorys
'*********************************************************
Function ExportCategoryList(intPage)

	Dim i
	Dim objRS
	Dim strPage
	Dim intPageAll

	Response.Write "<div class=""Header"">" & ZC_MSG066 & "</div>"
	Response.Write "<div class=""SubMenu"">" & Response_Plugin_CategoryMng_SubMenu & "</div>"
	Response.Write "<div id=""divMain2"">"

	Call GetBlogHint()

	Response.Write "<form id=""edit"" method=""post"" action="""">"
	Response.Write "<p>"& ZC_MSG122 &": </p>"
	Response.Write "<p><a href=""../cmd.asp?act=CategoryEdt"">["& ZC_MSG077 &"]</a></p>"
	Response.Write "</form>"

	Call CheckParameter(intPage,"int",1)

	Set objRS=Server.CreateObject("ADODB.Recordset")
	objRS.CursorType = adOpenKeyset
	objRS.LockType = adLockReadOnly
	objRS.ActiveConnection=objConn
	objRS.Source=""

	objRS.Open("SELECT * FROM [blog_Category] ORDER BY [cate_Order] ASC,[cate_ID] ASC")

	objRS.PageSize=ZC_MANAGE_COUNT
	If objRS.PageCount>0 Then objRS.AbsolutePage = intPage
	intPageAll=objRS.PageCount

	Response.Write "<table border=""1"" width=""100%"" cellspacing=""1"" cellpadding=""1"">"
	Response.Write "<tr><td>"& ZC_MSG076 &"</td><td>"& ZC_MSG079 &"</td><td>"& ZC_MSG001 &"</td><td>"& ZC_MSG147 &"</td><td></td><td></td></tr>"

	If (Not objRS.bof) And (Not objRS.eof) Then

		For i=1 to objRS.PageSize

			Response.Write "<tr>"
			Response.Write "<td>" & objRS("cate_ID") & "</td>"
			Response.Write "<td>" & objRS("cate_Order") & "</td>"
			Response.Write "<td><a href=""../catalog.asp?cate="& objRS("cate_ID") &"""  target=""_blank"">" & objRS("cate_Name") & "</a></td>"
			Response.Write "<td>" & objRS("cate_Intro") & "</td>"
			Response.Write "<td align=""center""><a href=""../cmd.asp?act=CategoryEdt&id="& objRS("cate_ID") &""">["& ZC_MSG078 &"]</a></td>"
			Response.Write "<td align=""center""><a onclick='return window.confirm("""& ZC_MSG058 &""");' href=""../cmd.asp?act=CategoryDel&amp;id="& objRS("cate_ID") &""">["& ZC_MSG063 &"]</a></td>"
			Response.Write "</tr>"

			objRS.MoveNext
			If objRS.eof Then Exit For

		Next

	End If

	Response.Write "</table>"

	'For i=1 to objRS.PageCount
	'	strPage=strPage &"<a href='admin.asp?act=CategoryMng&amp;page="& i &"'>["& Replace(ZC_MSG036,"%s",i) &"]</a> "
	'Next

	strPage=ExportPageBar(intPage,intPageAll,ZC_PAGEBAR_COUNT,"admin.asp?act=CategoryMng&amp;page=")

	Response.Write "<hr/>" & ZC_MSG042 & ": " & strPage
	Response.Write "</div>"

	objRS.Close
	Set objRS=Nothing

	ExportCategoryList=True

End Function
'*********************************************************




'*********************************************************
' 目的：    Manager Comments
'*********************************************************
Function ExportCommentList(intPage,intContent)

	Dim i
	Dim objRS
	Dim strSQL
	Dim strPage
	Dim intPageAll

	Call CheckParameter(intPage,"int",1)
	intContent=FilterSQL(intContent)

	Set objRS=Server.CreateObject("ADODB.Recordset")
	objRS.CursorType = adOpenKeyset
	objRS.LockType = adLockReadOnly
	objRS.ActiveConnection=objConn
	objRS.Source=""

	
	If CheckRights("GuestBookMng")=True Then 
	strSQL=strSQL & " WHERE ( ([log_ID]>0) OR ([log_ID] = 0 ) ) "
	Else
	strSQL=strSQL&" WHERE  ([log_ID]>0) "
	End If
	
	If CheckRights("Root")=False Then strSQL=strSQL & "AND( ([comm_AuthorID] = " & BlogUser.ID & " ) OR ((SELECT [log_AuthorID] FROM [blog_Article] WHERE [blog_Article].[log_ID]=[blog_Comment].[log_ID])=" & BlogUser.ID & " )) "

	If Trim(intContent)<>"" Then strSQL=strSQL & " AND ( ([comm_Author] LIKE '%" & intContent & "%') OR ([comm_Content] LIKE '%" & intContent & "%') OR ([comm_HomePage] LIKE '%" & intContent & "%') ) "

	Response.Write "<div class=""Header"">" & ZC_MSG068 & "</div>"
	Response.Write "<div class=""SubMenu"">" & Response_Plugin_CommentMng_SubMenu & "</div>"
	Response.Write "<div id=""divMain2"">"

	Call GetBlogHint()

	Response.Write "<form id=""edit"" method=""post"" enctype=""application/x-www-form-urlencoded"" action=""../admin/admin.asp?act=CommentMng"">"
	Response.Write "<p>"&ZC_MSG287&":</p><p>"

	Response.Write " "&ZC_MSG224&" <input id=""intContent"" name=""intContent"" style=""width:150px;"" type=""text"" value="""" /> "
	Response.Write "<input type=""submit"" class=""button"" value="""&ZC_MSG087&""">"
	
	Response.Write "</p></form>"

	Response.Write "<table border=""1"" width=""100%"" cellspacing=""1"" cellpadding=""1"">"
	Response.Write "<tr><td width='5%'>"& ZC_MSG076 &"</td><td width='14%'>"& ZC_MSG001 &"</td><td>"& ZC_MSG055 &"</td><td width='12%'>"& ZC_MSG080 &"</td><td width='15%'>"& ZC_MSG075 &"</td><td width='6%'></td><td width='6%'></td><td width='5%'  align='center'><a href='' onclick='BatchSelectAll();return false'>"& ZC_MSG229 &"</a></td></tr>"'

	objRS.Open("SELECT * FROM [blog_Comment] "& strSQL &" ORDER BY [comm_ID] DESC")


	objRS.PageSize=ZC_MANAGE_COUNT
	If objRS.PageCount>0 Then objRS.AbsolutePage = intPage
	intPageAll=objRS.PageCount

	If (Not objRS.bof) And (Not objRS.eof) Then

		For i=1 to objRS.PageSize

			Response.Write "<tr>"
			Response.Write "<td>" & objRS("comm_ID") & "</td>"
			If Trim(objRS("comm_Email"))="" Then
			Response.Write "<td>"& objRS("comm_Author") & "</td>"
			Else
			Response.Write "<td><a href=""mailto:"& objRS("comm_Email") &""">" & objRS("comm_Author") & "</a></td>"
			End If

			'If objRS("log_ID")=0 Then
			'	Response.Write "<td><a href=""../guestbook.asp#cmt" & objRS("comm_ID") & """ target=""_blank"">" & Left(objRS("comm_Content"),20) & "...</a></td>"
			'Else
			'	Response.Write "<td><a href=""../view.asp?id=" & objRS("log_ID") & "#cmt" & objRS("comm_ID") & """ target=""_blank"" title="""&TransferHTML(TransferHTML(UBBCode(objRS("comm_Content"),"[face][link][autolink][font][code][image][typeset][media][flash][key][upload]"),"[html-japan][upload]"),"[nohtml]")&""">" & Left(objRS("comm_Content"),20) & "...</a></td>"
			'End If

			Response.Write "<td><a id=""mylink"&objRS("comm_ID")&""" href=""$div"&objRS("comm_ID")&"tip?width=320"" class=""betterTip"" title=""正文"">" & Left(objRS("comm_Content"),20) & "...</a><div id=""div"&objRS("comm_ID")&"tip"" style=""display:none;"">"& objRS("comm_Content") &"</div></td>"

			Response.Write "<td>" & objRS("comm_IP") & "</td>"
			Response.Write "<td>" & objRS("comm_PostTime") & "</td>"
			Response.Write "<td align=""center""><a href=""../cmd.asp?act=CommentEdt&id=" & objRS("comm_ID") & "&log_id="& objRS("log_ID") &""">["& ZC_MSG078 &"]</a></td>"
			Response.Write "<td align=""center""><a href=""../cmd.asp?act=CommentDel&id=" & objRS("comm_ID") & "&log_id="& objRS("log_ID") &""" onclick='return window.confirm("""& ZC_MSG058 &""");'>["& ZC_MSG063 &"]</a></td>"
			Response.Write "<td align=""center"" ><input type=""checkbox"" name=""edtDel"" id=""edtDel"" value="""&objRS("comm_ID")&"""/></td>"
			Response.Write "</tr>"

			objRS.MoveNext
			If objRS.eof Then Exit For

		Next

	End If

	Response.Write "</table>"

	'For i=1 to objRS.PageCount
	'	strPage=strPage &"<a href='admin.asp?act=CommentMng&amp;page="& i &"'>["& Replace(ZC_MSG036,"%s",i) &"]</a> "
	'Next
	strPage=ExportPageBar(intPage,intPageAll,ZC_PAGEBAR_COUNT,"admin.asp?act=CommentMng&amp;page=")

	Response.Write "<br/><form id=""frmBatch"" method=""post"" action=""../cmd.asp?act=CommentDelBatch""><input type=""hidden"" id=""edtBatch"" name=""edtBatch"" value=""""/><input class=""button"" type=""submit"" onclick='BatchDeleteAll(""edtBatch"");if(document.getElementById(""edtBatch"").value){return window.confirm("""& ZC_MSG058 &""");}else{return false}' value="""&ZC_MSG228&""" id=""btnPost""/><form>" & vbCrlf

	Response.Write "<hr/>" & ZC_MSG042 & ": " & strPage
	Response.Write "</div>"
	
	objRS.Close
	Set objRS=Nothing

	ExportCommentList=True

End Function
'*********************************************************




'*********************************************************
' 目的：    Manager TrackBacks
'*********************************************************
Function ExportTrackBackList(intPage)

	Dim i
	Dim objRS
	Dim strSQL
	Dim strPage
	Dim intPageAll

	Call CheckParameter(intPage,"int",1)

	Set objRS=Server.CreateObject("ADODB.Recordset")
	objRS.CursorType = adOpenKeyset
	objRS.LockType = adLockReadOnly
	objRS.ActiveConnection=objConn
	objRS.Source=""

	strSQL="WHERE ([log_ID]>0) "
	If CheckRights("Root")=False Then strSQL=strSQL & "AND( (SELECT [log_AuthorID] FROM [blog_Article] WHERE [blog_Article].[log_ID] =[blog_TrackBack].[log_ID] ) =" & BlogUser.ID & ")"

	Response.Write "<div class=""Header"">" & ZC_MSG069 & "</div>"
	Response.Write "<div class=""SubMenu"">" & Response_Plugin_TrackBackMng_SubMenu & "</div>"
	Response.Write "<div id=""divMain2"">"

	Call GetBlogHint()

	Response.Write "<table border=""1"" width=""100%"" cellspacing=""1"" cellpadding=""1"">"
	Response.Write "<tr><td>"& ZC_MSG048 & ZC_MSG076 &"</td><td>"& ZC_MSG014 &"</td><td>"& ZC_MSG060 &"</td><td>"& ZC_MSG055 &"</td><td></td><td width='5%'  align='center'><a href='' onclick='BatchSelectAll();return false'>"& ZC_MSG229 &"</a></td></tr>"


	objRS.Open("SELECT * FROM [blog_TrackBack] "& strSQL &" ORDER BY [tb_ID] DESC")
	objRS.PageSize=ZC_MANAGE_COUNT
	If objRS.PageCount>0 Then objRS.AbsolutePage = intPage
	intPageAll=objRS.PageCount

	If (Not objRS.bof) And (Not objRS.eof) Then

		For i=1 to objRS.PageSize

			Response.Write "<tr>"
			Response.Write "<td>" & objRS("log_ID") & "</td>"
			Response.Write "<td><a target=""_blank"" href="""&objRS("tb_Url")&""">" & Left(objRS("tb_Blog"),14) & "</a></td>"
			Response.Write "<td><a href=""../view.asp?id=" & objRS("log_ID") & "#tb" & objRS("tb_ID") & """ target=""_blank"">" & Left(objRS("tb_Title"),12) & "</a></td>"

			Response.Write "<td><a id=""mylink"&objRS("tb_ID")&""" href=""$div"&objRS("tb_ID")&"tip?width=320"" class=""betterTip"" title=""正文"">" & Left(objRS("tb_Excerpt"),18) & "...</a><div id=""div"&objRS("tb_ID")&"tip"" style=""display:none;"">"& objRS("tb_Excerpt") &"</div></td>"

			Response.Write "<td align=""center""><a href=""../cmd.asp?act=TrackBackDel&id=" & objRS("tb_ID") & "&log_id="& objRS("log_ID") &""" onclick='return window.confirm(""" & ZC_MSG058 & """);'>["& ZC_MSG063 &"]</a></td>"
			Response.Write "<td align=""center"" ><input type=""checkbox"" name=""edtDel"" id=""edtDel"" value="""&objRS("tb_ID")&"""/></td>"
			Response.Write "</tr>"

			objRS.MoveNext
			If objRS.eof Then Exit For

		Next

	End If

	Response.Write "</table>"

	'For i=1 to objRS.PageCount
	'	strPage=strPage &"<a href='admin.asp?act=TrackBackMng&amp;page="& i &"'>["& Replace(ZC_MSG036,"%s",i) &"]</a> "
	'Next
	strPage=ExportPageBar(intPage,intPageAll,ZC_PAGEBAR_COUNT,"admin.asp?act=TrackBackMng&amp;page=")

	Response.Write "<br/><form id=""frmBatch"" method=""post"" action=""../cmd.asp?act=TrackBackDelBatch""><input type=""hidden"" id=""edtBatch"" name=""edtBatch"" value=""""/><input class=""button"" type=""submit"" onclick='BatchDeleteAll(""edtBatch"");if(document.getElementById(""edtBatch"").value){return window.confirm("""& ZC_MSG058 &""");}else{return false}' value="""&ZC_MSG228&""" id=""btnPost""/><form>" & vbCrlf


	Response.Write "<hr/>" & ZC_MSG042 & ": " & strPage
	Response.Write "</div>"

	objRS.Close
	Set objRS=Nothing

	ExportTrackBackList=True

End Function
'*********************************************************




'*********************************************************
' 目的：    Manager Users
'*********************************************************
Function ExportUserList(intPage)

	Dim i
	Dim objRS
	Dim strSQL
	Dim strPage
	Dim intPageAll

	Call CheckParameter(intPage,"int",1)

	Response.Write "<div class=""Header"">" & ZC_MSG070 & "</div>"
	Response.Write "<div class=""SubMenu"">" & Response_Plugin_UserMng_SubMenu & "</div>"
	Response.Write "<div id=""divMain2"">"

	Call GetBlogHint()

	If CheckRights("UserCrt")=True Then
		Response.Write "<form id=""edit"" method=""post"" action="""">"
		Response.Write "<p>"& ZC_MSG123 &": </p>"
		Response.Write "<p><a href=""edit_user.asp"">["& ZC_MSG127 &"]</a></p>"
		Response.Write "</form>"
	End If

	Set objRS=Server.CreateObject("ADODB.Recordset")
	objRS.CursorType = adOpenKeyset
	objRS.LockType = adLockReadOnly
	objRS.ActiveConnection=objConn
	objRS.Source=""

	If CheckRights("Root")=False Then strSQL="WHERE [mem_ID] = " & BlogUser.ID

	objRS.Open("SELECT * FROM [blog_Member] " & strSQL & " ORDER BY [mem_ID] ASC")

	objRS.PageSize=ZC_MANAGE_COUNT
	If objRS.PageCount>0 Then objRS.AbsolutePage = intPage
	intPageAll=objRS.PageCount

	If (Not objRS.bof) And (Not objRS.eof) Then

		Response.Write "<table border=""1"" width=""100%"" cellspacing=""1"" cellpadding=""1"">"
		Response.Write "<tr><td>"& ZC_MSG076 &"</td><td>"&"</td><td>"& ZC_MSG001 &"</td><td>"& ZC_MSG082 &"</td><td>"& ZC_MSG124 &"</td><td></td><td></td></tr>"

		For i=1 to objRS.PageSize

			Response.Write "<tr>"
			Response.Write "<td>" & objRS("mem_ID") & "</td>"
			Response.Write "<td>" & ZVA_User_Level_Name(objRS("mem_Level")) & "</td>"
			Response.Write "<td><a href=""../catalog.asp?auth="& objRS("mem_ID") &"""  target=""_blank"">" & objRS("mem_Name") & "</a></td>"

			Response.Write "<td>" & objRS("mem_PostLogs") & "</td>"
			Response.Write "<td>" & objRS("mem_PostComms") & "</td>"

			Response.Write "<td align=""center""><a href=""edit_user.asp?id="& objRS("mem_ID") &""">["& ZC_MSG078 &"]</a></td>"
			Response.Write "<td align=""center""><a onclick='return window.confirm("""& ZC_MSG058 &""");' href=""../cmd.asp?act=UserDel&amp;id="& objRS("mem_ID") &""">["& ZC_MSG063 &"]</a></td>"

			Response.Write "</tr>"

			objRS.MoveNext
			If objRS.eof Then Exit For

		Next

		Response.Write "</table>"

	End If

	'For i=1 to objRS.PageCount
	'	strPage=strPage &"<a href='admin.asp?act=UserMng&amp;page="& i &"'>["& Replace(ZC_MSG036,"%s",i) &"]</a> "
	'Next
	strPage=ExportPageBar(intPage,intPageAll,ZC_PAGEBAR_COUNT,"admin.asp?act=UserMng&amp;page=")

	Response.Write "<hr/>" & ZC_MSG042 & ": " & strPage
	Response.Write "</div>"

	objRS.Close
	Set objRS=Nothing

	ExportUserList=True

End Function
'*********************************************************




'*********************************************************
' 目的：    Manager Files
'*********************************************************
Function ExportFileList(intPage)

	Dim i
	Dim objRS
	Dim strSQL
	Dim strPage
	Dim intPageAll

	Call CheckParameter(intPage,"int",1)

	Response.Write "<div class=""Header"">" & ZC_MSG071 & "</div>"
	Response.Write "<div class=""SubMenu"">" & Response_Plugin_FileMng_SubMenu & "</div>"
	Response.Write "<div id=""divMain2"">"

	Call GetBlogHint()

	Response.Write "<form border=""1"" name=""edit"" id=""edit"" method=""post"" enctype=""multipart/form-data"" action=""../cmd.asp?act=FileUpload"">"
	Response.Write "<p>"& ZC_MSG108 &": </p>"
	Response.Write "<p><input type=""file"" id=""edtFileLoad"" name=""edtFileLoad"" size=""20"">  <input type=""submit"" class=""button"" value="""& ZC_MSG087 &""" name=""B1"" onclick='document.getElementById(""edit"").action=document.getElementById(""edit"").action+""&filename=""+escape(edtFileLoad.value)' /> <input class=""button"" type=""reset"" value="""& ZC_MSG088 &""" name=""B2"" />"
	Response.Write "&nbsp;<input type=""checkbox"" onclick='if(this.checked==true){document.getElementById(""edit"").action=document.getElementById(""edit"").action+""&autoname=1"";}else{document.getElementById(""edit"").action=""../cmd.asp?act=FileUpload"";};SetCookie(""chkAutoFileName"",this.checked,365);' id=""chkAutoName"" id=""chkAutoName""/><label for=""chkAutoName"">"& ZC_MSG131 &"</label></p></form>"

	Set objRS=Server.CreateObject("ADODB.Recordset")
	objRS.CursorType = adOpenKeyset
	objRS.LockType = adLockReadOnly
	objRS.ActiveConnection=objConn
	objRS.Source=""

	If CheckRights("Root")=False Then strSQL="WHERE [ul_AuthorID] = " & BlogUser.ID

	Response.Write "<table border='1' width='100%' cellspacing=""1"" cellpadding=""1"">"
	Response.Write "<tr><td width='10%'>"& ZC_MSG076 &"</td><td width='10%'>"& ZC_MSG003 &"</td><td width='30%'>"& ZC_MSG001 &"</td><td width='15%'>"& ZC_MSG041 &"</td><td width='15%'>"& ZC_MSG075 &"</td><td width='7%'></td><td width='5%'  align='center'><a href='' onclick='BatchSelectAll();return false'>"& ZC_MSG229 &"</a></td></tr>"

	objRS.Open("SELECT * FROM [blog_UpLoad] " & strSQL & " ORDER BY [ul_PostTime] DESC")
	objRS.PageSize=ZC_MANAGE_COUNT
	If objRS.PageCount>0 Then objRS.AbsolutePage = intPage
	intPageAll=objRS.PageCount

	If (Not objRS.bof) And (Not objRS.eof) Then

		For i=1 to objRS.PageSize

			Response.Write "<tr><td>"&objRS("ul_ID")&"</td>"

			Dim User:For Each User in Users:If IsObject(User) Then:If User.ID=objRS("ul_AuthorID") Then:Response.Write "<td>" & User.Name & "</td>":End If:End If:Next
			If IsNull(objRS("ul_Quote"))=False And objRS("ul_Quote")<>"" Then
				If CBool(objRS("ul_Quote"))=True Then
					Response.Write "<td><a href='../"& ZC_UPLOAD_DIRECTORY &"/"&Year(objRS("ul_PostTime")) & "/" & Month(objRS("ul_PostTime")) & "/"&objRS("ul_FileName")&"' target='_blank'>"&Year(objRS("ul_PostTime")) & "/" & Month(objRS("ul_PostTime")) & "/" &objRS("ul_FileName")&"</a></td>"
				Else
					Response.Write "<td><a href='../"& ZC_UPLOAD_DIRECTORY &"/"&objRS("ul_FileName")&"' target='_blank'>"&objRS("ul_FileName")&"</a></td>"
				End If
			Else
				Response.Write "<td><a href='../"& ZC_UPLOAD_DIRECTORY &"/"&objRS("ul_FileName")&"' target='_blank'>"&objRS("ul_FileName")&"</a></td>"
			End If

			Response.Write "<td>"&objRS("ul_FileSize")&"</td><td>"&objRS("ul_PostTime")&"</td>"
			Response.Write "<td align=""center""><a href='../cmd.asp?act=FileDel&amp;id="&Server.URLEncode(objRS("ul_ID"))&"' onclick='return window.confirm("""& ZC_MSG058 &""");'>["& ZC_MSG063 &"]</a></td>"
			Response.Write "<td align=""center"" ><input type=""checkbox"" name=""edtDel"" id=""edtDel"" value="""&objRS("ul_ID")&"""/></td>"
			Response.Write "</tr>"

			objRS.MoveNext
			If objRS.eof Then Exit For

		Next

	End If

	Response.Write "</table>"

	Response.Write "<br/><form id=""frmBatch"" method=""post"" action=""../cmd.asp?act=FileDelBatch""><input type=""hidden"" id=""edtBatch"" name=""edtBatch"" value=""""/><input class=""button"" type=""submit"" onclick='BatchDeleteAll(""edtBatch"");if(document.getElementById(""edtBatch"").value){return window.confirm("""& ZC_MSG058 &""");}else{return false}' value="""&ZC_MSG228&""" id=""btnPost""/><form>" & vbCrlf

	'For i=1 to objRS.PageCount
	'	strPage=strPage &"<a href='admin.asp?act=FileMng&amp;page="& i &"'>["& Replace(ZC_MSG036,"%s",i) &"]</a> "
	'Next
	strPage=ExportPageBar(intPage,intPageAll,ZC_PAGEBAR_COUNT,"admin.asp?act=FileMng&amp;page=")

	Response.Write "<hr/>" & ZC_MSG042 & ": " & strPage
	Response.Write "</div><script type=""text/javascript"">if(GetCookie(""chkAutoFileName"")==""true""){document.getElementById(""chkAutoName"").checked=true};</script>"

	objRS.Close
	Set objRS=Nothing

	ExportFileList=True

End Function
'*********************************************************




'*********************************************************
' 目的：    Manage Setting
'*********************************************************
Function ExportManageList()

	ExportManageList=True

End Function
'*********************************************************




'*********************************************************
' 目的：    Manager KeyWord
'*********************************************************
Function ExportKeyWordList(intPage)

	ExportKeyWordList=True

End Function
'*********************************************************




'*********************************************************
' 目的：    Manager Tag
'*********************************************************
Function ExportTagList(intPage)

	Dim i
	Dim objRS
	Dim strPage
	Dim intPageAll

	Response.Write "<div class=""Header"">" & ZC_MSG141 & "</div>"
	Response.Write "<div class=""SubMenu"">" & Response_Plugin_TagMng_SubMenu & "</div>"
	Response.Write "<div id=""divMain2"">"

	Call GetBlogHint()

	Response.Write "<form id=""edit"" method=""post"" action="""">"
	Response.Write "<p>"& ZC_MSG134 &": </p>"
	Response.Write "<p><a href=""../cmd.asp?act=TagEdt"">["& ZC_MSG136 &"]</a></p>"
	Response.Write "</form>"

	Call CheckParameter(intPage,"int",1)

	Set objRS=Server.CreateObject("ADODB.Recordset")
	objRS.CursorType = adOpenKeyset
	objRS.LockType = adLockReadOnly
	objRS.ActiveConnection=objConn
	objRS.Source=""

	objRS.Open("SELECT * FROM [blog_Tag] ORDER BY [tag_Name] ASC")

	objRS.PageSize=ZC_MANAGE_COUNT
	If objRS.PageCount>0 Then objRS.AbsolutePage = intPage
	intPageAll=objRS.PageCount

	Response.Write "<table border=""1"" width=""100%"" cellspacing=""1"" cellpadding=""1"">"
	Response.Write "<tr><td width=""5%"">"& ZC_MSG076 &"</td><td width=""25%"">"& ZC_MSG001 &"</td><td width=""40%"">"& ZC_MSG016 &"</td><td width=""15%""></td><td width=""15%""></td></tr>"

	If (Not objRS.bof) And (Not objRS.eof) Then

		For i=1 to objRS.PageSize

			Response.Write "<tr>"
			Response.Write "<td>" & objRS("tag_ID") & "</td>"
			Response.Write "<td>" & objRS("tag_Name") & "</td>"
			If IsNull(objRS("tag_Intro"))=True Then
				Response.Write "<td></td>"
			Else
				Response.Write "<td>" & TransferHTML(objRS("tag_Intro"),"[html-format]") & "</td>"
			End If
			Response.Write "<td align=""center""><a href=""../cmd.asp?act=TagEdt&id="& objRS("tag_ID") &""">["& ZC_MSG078 &"]</a></td>"
			Response.Write "<td align=""center""><a onclick='return window.confirm("""& ZC_MSG058 &""");' href=""../cmd.asp?act=TagDel&amp;id="& objRS("tag_ID") &""">["& ZC_MSG063 &"]</a></td>"
			Response.Write "</tr>"

			objRS.MoveNext
			If objRS.eof Then Exit For

		Next

	End If

	Response.Write "</table>"

	'For i=1 to objRS.PageCount
	'	strPage=strPage &"<a href='admin.asp?act=TagMng&amp;page="& i &"'>["& Replace(ZC_MSG036,"%s",i) &"]</a> "
	'Next
	strPage=ExportPageBar(intPage,intPageAll,ZC_PAGEBAR_COUNT,"admin.asp?act=TagMng&amp;page=")

	Response.Write "<hr/>" & ZC_MSG042 & ": " & strPage
	Response.Write "</div>"

	objRS.Close
	Set objRS=Nothing

	ExportTagList=True

End Function
'*********************************************************




'*********************************************************
' 目的：    Manager Plugin
'*********************************************************
Function ExportPluginList()

	On Error Resume Next

	Dim aryPL_Enable()
	Dim aryPL_Disable()

	ReDim aryPL_Enable(0)
	ReDim aryPL_Disable(0)

	Dim aryPL
	aryPL=Split(ZC_USING_PLUGIN_LIST,"|")

	Dim i,j,s,t,m,n

	If ZC_USING_PLUGIN_LIST<>"" Then
		i=UBound(aryPL)
	Else
		i=0
	End If

	ReDim aryPL_Enable(i)


	If Request.QueryString("installed")<>"" Then

		Call InstallPlugin(Request.QueryString("installed"))

	End If

	Dim fso, f, f1, fc
	Set fso = CreateObject("Scripting.FileSystemObject")

	Response.Write "<div class=""Header"">" & ZC_MSG107 & "</div>"
	Response.Write "<div class=""SubMenu"">" & Response_Plugin_PlugInMng_SubMenu & "</div>"
	Response.Write "<div id=""divMain2"">"

	Call GetBlogHint()


	Response.Write "<table border=""1"" width=""100%"" cellspacing=""1"" cellpadding=""1"">"
	Response.Write "<tr><td width=""5%"">"& ZC_MSG079 &"</td><td width=""20%"">"& ZC_MSG001 &"</td><td width=""15%"">"& ZC_MSG128 &"</td><td width=""15%"">"& ZC_MSG150 &"</td><td width=""15%"">"& ZC_MSG151 &"</td><td width=""10%"">"& ZC_MSG309 &"</td><td width=""10%""></td><td width=""10%""></td></tr>"

	Dim objXmlFile,strXmlFile



	strXmlFile =BlogPath & "/themes/" & ZC_BLOG_THEME & "/" & "theme.xml"

	Set objXmlFile=Server.CreateObject("Microsoft.XMLDOM")
	objXmlFile.async = False
	objXmlFile.ValidateOnParse=False
	objXmlFile.load(strXmlFile)
	If objXmlFile.readyState=4 Then
		If objXmlFile.parseError.errorCode <> 0 Then
		Else

			If CInt(objXmlFile.documentElement.selectSingleNode("plugin/level").text)>0 Then

				If Err.Number=0 Then

					Response.Write "<tr>"
					Response.Write "<td>"& "0" &"</td>"
					Response.Write "<td><a id=""mylink"&Left(md5(objXmlFile.documentElement.selectSingleNode("id").text),6)&""" href=""$div"&Left(md5(objXmlFile.documentElement.selectSingleNode("id").text),6)&"tip?width=300"" class=""betterTip"" title=""$content"">" & "" & objXmlFile.documentElement.selectSingleNode("plugin/name").text & "" & "</a><div id=""div"&Left(md5(objXmlFile.documentElement.selectSingleNode("id").text),6)&"tip"" style=""display:none;"">"&objXmlFile.documentElement.selectSingleNode("plugin/note").text&"</div></td>"
					Response.Write "<td>" & "<a target=""_blank"" href=""" & objXmlFile.documentElement.selectSingleNode("author/url").text & """>"& objXmlFile.documentElement.selectSingleNode("author/name").text & "</td>"
					Response.Write "<td>" & objXmlFile.documentElement.selectSingleNode("version").text & "</td>"
					Response.Write "<td>"& objXmlFile.documentElement.selectSingleNode("modified").text &"</td>"
					Response.Write "<td align=center><img title='"&ZC_MSG308&"' alt='"&ZC_MSG308&"' src='../IMAGE/EDIT/0101.gif'/></td>"
					Response.Write "<td align=center>"& ZC_MSG311 &"</td>"
					Response.Write "<td align=center>"
					If BlogUser.Level<=CInt(objXmlFile.documentElement.selectSingleNode("plugin/level").text) Then
						If fso.FileExists(BlogPath & "/themes/" & ZC_BLOG_THEME & "/plugin/" & objXmlFile.documentElement.selectSingleNode("plugin/path").text) Then
							Response.Write "<a href=""../themes/" & ZC_BLOG_THEME & "/plugin/" & objXmlFile.documentElement.selectSingleNode("plugin/path").text &""">[" & ZC_MSG022 & "]</a>"
						End If
					End If
					Response.Write "</td>"
					Response.Write "</tr>"

				End If

			End If

		End If
	End If
	Set objXmlFile=Nothing

	Set f = fso.GetFolder(BlogPath & "/plugin/")
	Set fc = f.SubFolders
	For Each f1 in fc

		s=""

		If fso.FileExists(BlogPath & "/plugin/" & f1.name & "/" & "plugin.xml") Then

			strXmlFile =BlogPath & "/plugin/" & f1.name & "/" & "plugin.xml"

			Set objXmlFile=Server.CreateObject("Microsoft.XMLDOM")
			objXmlFile.async = False
			objXmlFile.ValidateOnParse=False
			objXmlFile.load(strXmlFile)
			If objXmlFile.readyState=4 Then
				If objXmlFile.parseError.errorCode <> 0 Then
				Else
					'If BlogUser.Level<=CInt(objXmlFile.documentElement.selectSingleNode("level").text) Then

			If CheckPluginState(objXmlFile.documentElement.selectSingleNode("id").text) Then 
				For j=0 To UBound(aryPL)
					If UCase(aryPL(j))=UCase(objXmlFile.documentElement.selectSingleNode("id").text) Then
						n=j
						Exit For
					End If
				Next
				m=n+1
			Else
				m=""
			End If


			s=s & "<tr>"
			s=s & "<td>"& m &"</td>"
			s=s & "<td><a id=""mylink"&Left(md5(objXmlFile.documentElement.selectSingleNode("id").text),6)&""" href=""$div"&objXmlFile.documentElement.selectSingleNode("id").text&"tip?width=300"" class=""betterTip"" title=""$content"">" & "" & objXmlFile.documentElement.selectSingleNode("name").text & "" & "</a><div id=""div"&objXmlFile.documentElement.selectSingleNode("id").text&"tip"" style=""display:none;"">"&objXmlFile.documentElement.selectSingleNode("note").text&"</div></td>"
			s=s & "<td>" & "<a target=""_blank"" href=""" & objXmlFile.documentElement.selectSingleNode("author/url").text & """>"& objXmlFile.documentElement.selectSingleNode("author/name").text & "</td>"
			s=s & "<td>" & objXmlFile.documentElement.selectSingleNode("version").text & "</td>"
			s=s & "<td>"& objXmlFile.documentElement.selectSingleNode("modified").text &"</td>"

			If CheckPluginState(objXmlFile.documentElement.selectSingleNode("id").text) Then 
				s=s & "<td align=center><img title='"&ZC_MSG308&"' alt='"&ZC_MSG308&"' src='../IMAGE/EDIT/0101.gif'/></td>"
			Else
				s=s & "<td align=center><img title='"&ZC_MSG307&"' alt='"&ZC_MSG307&"' src='../IMAGE/EDIT/0020.gif'/></td>"
			End If

				s=s & "<td align=center>"
			If CheckPluginState(objXmlFile.documentElement.selectSingleNode("id").text) Then
				If CheckRights("PlugInDisable")=True Then
					s=s & "<a href=""../cmd.asp?act=PlugInDisable&name="& Server.URLEncode(objXmlFile.documentElement.selectSingleNode("id").text) &""">[" & ZC_MSG307 & "]</a>"
				Else

				End If
			Else
				If CheckRights("PlugInActive")=True Then
					s=s & "<a href=""../cmd.asp?act=PlugInActive&name="& Server.URLEncode(objXmlFile.documentElement.selectSingleNode("id").text) &""">[" & ZC_MSG308 & "]</a>"
				Else
				End If
			End If
			s=s & "</td>"


			s=s & "<td align=center>"
			If CheckPluginState(objXmlFile.documentElement.selectSingleNode("id").text) Then
				If BlogUser.Level<=CInt(objXmlFile.documentElement.selectSingleNode("level").text) Then
					If fso.FileExists(BlogPath & "/plugin/" & f1.name & "/" & objXmlFile.documentElement.selectSingleNode("path").text) Then
						s=s & "<a href=""../plugin/" & f1.name & "/" & objXmlFile.documentElement.selectSingleNode("path").text &""">[" & ZC_MSG022 & "]</a>"
					End If
				End If
			Else
			End If
			s=s & "</td>"

			s=s & "</tr>"


			If CheckPluginState(objXmlFile.documentElement.selectSingleNode("id").text) Then 

				'j=UBound(aryPL_Enable)
				'ReDim Preserve aryPL_Enable(j+1)
				aryPL_Enable(n)=s
			Else
				j=UBound(aryPL_Disable)
				ReDim Preserve aryPL_Disable(j+1)
				aryPL_Disable(j)=s
			End If

				End If
			End If
			Set objXmlFile=Nothing
		End If
	Next

	Response.Write Join(aryPL_Enable)

	Response.Write Join(aryPL_Disable)

	Response.Write "</div>"

%>

<%

	Err.Clear

	ExportPluginList=True

End Function
'*********************************************************




'*********************************************************
' 目的：    
'*********************************************************
Function ExportSiteInfo()

	On Error Resume Next

	Dim FoundFso
	FoundFso = False
	FoundFso = IsObjInstalled("Scripting.FileSystemObject")


	Dim objRS
	Set objRS=Server.CreateObject("ADODB.Recordset")
	objRS.CursorType = adOpenKeyset
	objRS.LockType = adLockReadOnly
	objRS.ActiveConnection=objConn
	objRS.Source=""

	Dim allArticle,allCommNums,allTrackBackNums,allViewNums,allUserNums,allCateNums,allTagsNums

	Dim User,i
	For Each User in Users
		If IsObject(User) Then
			Set objRS=objConn.Execute("SELECT COUNT([log_ID]) FROM [blog_Article] WHERE [log_Level]>1 AND [log_AuthorID]=" & User.ID )
			i=objRS(0)
			objConn.Execute("UPDATE [blog_Member] SET [mem_PostLogs]="&i&" WHERE [mem_ID] =" & User.ID)
			Set objRS=Nothing
	
			Set objRS=objConn.Execute("SELECT COUNT([comm_ID]) FROM [blog_Comment] WHERE [comm_AuthorID]=" & User.ID )
			i=objRS(0)
			objConn.Execute("UPDATE [blog_Member] SET [mem_PostComms]="&i&" WHERE [mem_ID] =" & User.ID)
			Set objRS=Nothing
		End If
	Next

	Set objRS=Server.CreateObject("ADODB.Recordset")
	objRS.CursorType = adOpenKeyset
	objRS.LockType = adLockReadOnly
	objRS.ActiveConnection=objConn
	objRS.Source=""
	objRS.Open("SELECT COUNT([log_ID])AS allArticle,SUM([log_CommNums]) AS allCommNums,SUM([log_ViewNums]) AS allViewNums,SUM([log_TrackBackNums]) AS allTrackBackNums FROM [blog_Article]")
	If (Not objRS.bof) And (Not objRS.eof) Then
		allArticle=objRS("allArticle")
		allCommNums=objRS("allCommNums")
		allTrackBackNums=objRS("allTrackBackNums")
		allViewNums=objRS("allViewNums")
	End If
	objRS.Close

	objRS.Open("SELECT COUNT([tag_ID])AS allTagsNums FROM [blog_Tag]")
	If (Not objRS.bof) And (Not objRS.eof) Then
		allTagsNums=objRS("allTagsNums")
	End If
	objRS.Close

	objRS.Open("SELECT COUNT([mem_ID])AS allUserNums FROM [blog_Member]")
	If (Not objRS.bof) And (Not objRS.eof) Then
		allUserNums=objRS("allUserNums")
	End If
	objRS.Close

	objRS.Open("SELECT COUNT([cate_ID])AS allCateNums FROM [blog_Category]")
	If (Not objRS.bof) And (Not objRS.eof) Then
		allCateNums=objRS("allCateNums")
	End If
	objRS.Close

	Call CheckParameter(allArticle,"int",0)
	Call CheckParameter(allCommNums,"int",0)
	Call CheckParameter(allTrackBackNums,"int",0)
	Call CheckParameter(allViewNums,"int",0)
	Call CheckParameter(allUserNums,"int",0)
	Call CheckParameter(allCateNums,"int",0)
	Call CheckParameter(allTagsNums,"int",0)

	Response.Write "<div class=""Header"">" & ZC_MSG159 & "</div>"
	Response.Write "<div class=""SubMenu"">" & Response_Plugin_SiteInfo_SubMenu & "</div>"
	Response.Write "<div id=""divMain2"">"

	Call GetBlogHint()
	%>

	<table border="0" cellspacing="0" cellpadding="0" align="center" width="100%" class="tableBorder">
	<tr><th height=25 colspan=4  align="center">&nbsp;<%=ZC_MSG167%></th></tr>
	<tr>
	<td width="20%"><%=ZC_MSG160%></td>
	<td width="30%"><%=BlogUser.Name%> (<%=ZVA_User_Level_Name(BlogUser.Level)%>)</td>
	<td width="20%"><%=ZC_MSG150%></td>
	<td width="30%"><%=ZC_BLOG_VERSION%></td>
	</tr>
	<tr>
	<td width="20%"><%=ZC_MSG082%></td>
	<td width="30%"><%=allArticle%></td>
	<td width="20%"><%=ZC_MSG124%></td>
	<td width="30%"><%=allCommNums%></td>
	</tr>
	<tr>
	<td width="20%"><%=ZC_MSG125%></td>
	<td width="30%"><%=allTrackBackNums%></td>
	<td width="20%"><%=ZC_MSG129%></td>
	<td width="30%"><%=allViewNums%></td>
	</tr>
	<tr>
	<td width="20%"><%=ZC_MSG163%></td>
	<td width="30%"><%=allTagsNums%></td>
	<td width="20%"><%=ZC_MSG162%></td>
	<td width="30%"><%=allCateNums%></td>
	</tr>
	<tr>
	<td width="20%"><%=ZC_MSG306%>/<%=ZC_MSG083%></td>
	<td width="30%"><%=GetNameFormTheme(ZC_BLOG_THEME)%> / <%=ZC_BLOG_CSS%></td>
	<td width="20%"><%=ZC_MSG166%></td>
	<td width="30%"><%=allUserNums%></td>
	</tr>
	<tr>
	<td width="20%">MetaWeblog API</td>
	<td colspan="3" width="80%"><%=ZC_BLOG_HOST%>xml-rpc/index.asp</td>
	</tr>
<!-- 	<tr>
	<td colspan="4">
	<marquee onmouseover="this.stop()" onmouseout="this.start()"></marquee>
	</td>
	</tr> -->
	</table>
<!-- 
	<table border="0" cellspacing="0" cellpadding="0" align=center width="100%" class="tableBorder">
	<tr><th height=25 colspan=4>&nbsp;<%=ZC_MSG164%></th></tr>
	<tr>
	<td width="22%" ><%=ZC_MSG150%></td>
	<td width="27%"><%=ZC_BLOG_VERSION%></td>
	<td width="27%"></td>
	<td width="24%"></td>
	</tr>
	<tr>
	<td width="22%" >FSO </td>
	<td width="27%">
	<%
	If FoundFso Then
		Response.Write "<font color=green><b>ok</b></font>"
	Else
		Response.Write "<font color=red><b>fail</b></font>"
	End If
	%>
	</td>
	<td> Adodb.Stream </td>
	<td><%
	If IsObjInstalled("Adodb.Stream") Then
		Response.Write "<font color=green><b>ok</b></font>"
	Else
		Response.Write "<font color=red><b>fail</b></font>"
	End If
	%>
	</td>
	</tr>
	<tr>
	<td width="22%" >ADODB.Connection</td>
	<td width="27%">
	<%
	If IsObjInstalled("ADODB.Connection") Then
		Response.Write "<font color=green><b>ok</b></font>"
	Else
		Response.Write "<font color=red><b>fail</b></font>"
	End If
	%></td>
	<td> Microsoft.XMLDOM</td>
	<td><%
	If IsObjInstalled("Microsoft.XMLDOM") Then
		Response.Write "<font color=green><b>ok</b></font>"
	Else
		Response.Write "<font color=red><b>fail</b></font>"
	End If
	%>
	</td>
	</tr>
	<tr>
	<td width="22%" >
	MSXML2.ServerXMLHTTP</td>
	<td width="27%">
	<%
	If IsObjInstalled("MSXML2.ServerXMLHTTP") Then
		Response.Write "<font color=green><b>ok</b></font>"
	Else
		Response.Write "<font color=red><b>fail</b></font>"
	End If
	%>
	</td>
	<td > Scripting.Dictionary</td>
	<td><%
	If IsObjInstalled("Scripting.Dictionary") Then
		Response.Write "<font color=green><b>ok</b></font>"
	Else
		Response.Write "<font color=red><b>fail</b></font>"
	End If
	%>
	</td>
	</tr>
	</table>
-->
<%
If Len(ZC_UPDATE_INFO_URL)>0 Then
%>
	<table border="0" cellspacing="0" cellpadding="0" align="center" width="100%" class="tableBorder">
	<tr><th height=25 colspan=4 align="center">&nbsp;<%=ZC_MSG164%>&nbsp;<a href="javascript:updateinfo('?reload');">[<%=ZC_MSG289%>]</a></th></tr>
	<tr><td height=25 colspan=4 id="tdUpdateInfo">
<script language="JavaScript" type="text/javascript">
function updateinfo(s){
	$.post("c_updateinfo.asp"+s,{},
		function(data){
			$("#tdUpdateInfo").html(data);
		}
	)
};

$(document).ready(function(){updateinfo("");});

</script>
	</td></tr>
	</table>
<%
End If
%>
	<br />
<%
	Response.Write "</div>"

	ExportSiteInfo=True

	Err.Clear

End Function
'*********************************************************




'*********************************************************
' 目的：    目录下文件列表
'*********************************************************
Function ExportSiteFileList(path,opath)

	On Error Resume Next

	Response.Write "<div class=""Header"">" & ZC_MSG210 & "</div>"
	Response.Write "<div class=""SubMenu"">" & Response_Plugin_SiteFileMng_SubMenu & "</div>"
	Response.Write "<div id=""divMain2"">"

	Call GetBlogHint()

	Response.Write "<!-- <form id=""edit"" method=""post"" action="""">"
%>
<p><%=ZC_MSG246%>:</p>
<p><a href="admin.asp?act=SiteFileEdt&path=<%=Escape("./INCLUDE/link.asp")%>" target="main">[<%=ZC_MSG031%>]</a>
<a href="admin.asp?act=SiteFileEdt&path=<%=Escape("./INCLUDE/favorite.asp")%>" target="main">[<%=ZC_MSG030%>]</a>
<a href="admin.asp?act=SiteFileEdt&path=<%=Escape("./INCLUDE/misc.asp")%>" target="main">[<%=ZC_MSG039%>]</a>
<a href="admin.asp?act=SiteFileEdt&path=<%=Escape("./INCLUDE/navbar.asp")%>" target="main">[<%=ZC_MSG233%>]</a>
</p>
<%
	Response.Write "</form> -->"

	dim f,fold,item,fpath,jpath
	set f=server.createobject("scripting.filesystemobject")

	If opath<>"" Then path=opath

	  if path<>"" then
		 if instr(path,":")>0 then
		 path=path
		 else
		 path=server.mappath(path)
		 end if
	  else
	  path=blogpath
	  end if
	response.write "<p>"&ZC_MSG240&":"&path&"</p>"
	set fold=f.getfolder(path)

	response.write"<table width=""100%"" border=""0"">"
	response.write "<tr><td><a href='../cmd.asp?act=SiteFileMng&path="&Server.URLEncode(path&"\..\")&"'>"&ZC_MSG239&"</a></td></tr>"
	for each item in fold.subfolders
	jpath=replace(path,"\","\\")
	response.write "<tr height=18><td><img src='../image/edit/page_peppermint.png' height='11' width='11' />&nbsp;<a href='../cmd.asp?act=SiteFileMng&path="&Server.URLEncode(path&"\"&item.name)&"&opath='>"&item.name&"</a>"
	response.write"</td></tr>"
	next
	for each item in fold.files
	fpath=replace(path&"/"&item.name,blogpath,"")
	fpath=replace(fpath,"\","/")
	response.write "<tr><td><img src='../image/edit/page_spearmint.png' height='11' width='11' />&nbsp;<a href=""javascript:;"" title='"&ZC_MSG261&":"&item.datelastmodified&";"&ZC_MSG238&":"&clng(item.size/1024)&"k'>"&item.name&"</a>&nbsp;&nbsp;"
	response.write"<a href=""../cmd.asp?act=SiteFileEdt&path=."&Server.URLEncode(fpath)&"&opath="& Server.URLEncode(path) &""">["&ZC_MSG078&"]</a>&nbsp;&nbsp;<a href=""../cmd.asp?act=SiteFileDel&path=."&Server.URLEncode(fpath)&"&opath="& Server.URLEncode(path) &""" onclick='return window.confirm("""&ZC_MSG058&""");'>["&ZC_MSG063&"]</a>"

	next
	response.write"</table>"
	set fold=nothing

	set f=Nothing

	Response.Write "</div>"

	ExportSiteFileList=True

	Err.Clear

End Function
'*********************************************************




'*********************************************************
' 目的：    编辑文件
'*********************************************************
Function ExportSiteFileEdit(tpath,opath)

	Dim Del,txaContent

	Response.Write "<div class=""Header"">" & ZC_MSG246 & "</div>"
	Response.Write "<div class=""SubMenu"">" & Response_Plugin_SiteFileEdt_SubMenu & "</div>"
	Response.Write "<div id=""divMain2"">"

	Call GetBlogHint()

	If IsEmpty(txaContent) Then txaContent=Null


	If Not IsNull(tpath) Then

		Response.Write "<form id=""edit"" name=""edit"" method=""post"" action=""../cmd.asp?act=SiteFilePst&path="&Server.URLEncode(tpath)&"&opath="&Server.URLEncode(opath)&""">" & vbCrlf
		Response.Write "<p><br/>" & ZC_MSG170 & ": <br/><INPUT TYPE=""text"" Value="""&unEscape(tpath)&""" style=""width:100%"" name=""path"" id=""path"" readonly></p>"
		Response.Write "<p><textarea class=""resizable"" style=""height:300px;width:100%"" name=""txaContent"" id=""txaContent"">"&TransferHTML(LoadFromFile(BlogPath & unEscape(tpath),"utf-8"),"[textarea]")&"</textarea></p>" & vbCrlf
		Response.Write "<hr/>"
		Response.Write "<p><input class=""button"" type=""submit"" value="""&ZC_MSG087&""" id=""btnPost""/></p>" & vbCrlf
		Response.Write "</form>" & vbCrlf

	End If

	Response.Write "</div>"

	ExportSiteFileEdit=True

End Function
'*********************************************************




'*********************************************************
' 目的：    
'*********************************************************
Function ExportFileReBuildAsk()

'Call Add_Response_Plugin("Response_Plugin_AskFileReBuild_SubMenu",MakeSubMenu(ZC_MSG072,"../cmd.asp?act=BlogReBuild","m-left",False))

	Response.Write "<div class=""Header"">" & ZC_MSG073 & "</div>"
	Response.Write "<div class=""SubMenu"">" & Response_Plugin_AskFileReBuild_SubMenu & "</div>"
	Response.Write "<div id=""divMain2"">"

	Call GetBlogHint()

	Response.Write "<form id=""edit"" name=""edit"" method=""post"" action=""../cmd.asp?act=FileReBuild"">" & vbCrlf
	Response.Write "<p>"& ZC_MSG112 &"</p>" & vbCrlf
	Response.Write "<p><input class=""button"" type=""submit"" value="""&ZC_MSG087&""" id=""btnPost""/></p>" & vbCrlf
	Response.Write "</form>" & vbCrlf

	Response.Write "</div>"

	ExportFileReBuildAsk=True

End Function
'*********************************************************




'*********************************************************
' 目的：    
'*********************************************************
Function ExportThemesMng()

	On Error Resume Next

	Dim CurrentTheme
	Dim CurrentStyle

	CurrentTheme=ZC_BLOG_THEME
	CurrentStyle=ZC_BLOG_CSS

	Dim Theme_Id
	Dim Theme_Name
	Dim Theme_Url
	Dim Theme_Note
	Dim Theme_Description
	Dim Theme_Pubdate
	Dim Theme_Source_Name
	Dim Theme_Source_Url
	Dim Theme_Author_Name
	Dim Theme_Author_Url
	Dim Theme_ScreenShot
	Dim Theme_Style_Name
	Dim i,j
	Dim aryFileList

	If Request.QueryString("installed")<>"" Then

		Call InstallPlugin(Request.QueryString("installed"))

	End If


	Response.Write "<div class=""Header"">" & ZC_MSG291 & "</div>"
	Response.Write "<div class=""SubMenu"">" & Response_Plugin_ThemesMng_SubMenu & "</div>"
	Response.Write "<div id=""divMain2"">"

	Call GetBlogHint()

	Response.Write "<form id=""frmTheme"" method=""post"" action=""../cmd.asp?act=ThemesSav"">"

	Dim objXmlFile,strXmlFile
	Dim fso, f, f1, fc, s
	Set fso = CreateObject("Scripting.FileSystemObject")
	Set f = fso.GetFolder(BlogPath & "themes" & "/")
	Set fc = f.SubFolders
	For Each f1 in fc

		If fso.FileExists(BlogPath & "themes" & "/" & f1.name & "/" & "theme.xml") Then

			strXmlFile =BlogPath & "themes" & "/" & f1.name & "/" & "theme.xml"

			Set objXmlFile=Server.CreateObject("Microsoft.XMLDOM")
			objXmlFile.async = False
			objXmlFile.ValidateOnParse=False
			objXmlFile.load(strXmlFile)
			If objXmlFile.readyState=4 Then
				If objXmlFile.parseError.errorCode <> 0 Then
				Else

					Theme_Id=""
					Theme_Name=""
					Theme_Url=""
					Theme_Note=""
					Theme_Description=""
					Theme_Pubdate=""
					Theme_Source_Name=""
					Theme_Source_Url=""
					Theme_Author_Name=""
					Theme_Author_Url=""
					Theme_ScreenShot=""
					Theme_Style_Name=""

					Theme_Source_Name=objXmlFile.documentElement.selectSingleNode("source/name").text
					Theme_Source_Url=objXmlFile.documentElement.selectSingleNode("source/url").text

					Theme_Author_Name=objXmlFile.documentElement.selectSingleNode("author/name").text
					Theme_Author_Url=objXmlFile.documentElement.selectSingleNode("author/url").text

					If Theme_Author_Name="" Then
						Theme_Author_Name=Theme_Source_Name
						Theme_Author_Url=Theme_Source_Url
					End If


					'Theme_Id=f1.name
					Theme_Id=objXmlFile.documentElement.selectSingleNode("id").text
					Theme_Name=objXmlFile.documentElement.selectSingleNode("name").text
					Theme_Url=objXmlFile.documentElement.selectSingleNode("url").text
					Theme_Note=objXmlFile.documentElement.selectSingleNode("note").text
					Theme_Pubdate=objXmlFile.documentElement.selectSingleNode("pubdate").text
					Theme_Description=objXmlFile.documentElement.selectSingleNode("description").text

					Theme_ScreenShot=ZC_BLOG_HOST & "themes" &"/" & Theme_Id & "/" & "screenshot.png"




		If UCase(Theme_Id)=UCase(CurrentTheme) Then
			Response.Write "<div class=""theme-now"" style="""">"
		Else
			Response.Write "<div class=""theme-other"" style="""">"
		End If

		If UCase(Theme_Id) <> UCase(f1.name) Then
			Response.Write "<p style=""color:red;"">ID Error! Should be """& f1.name &"""!!</p>"
		Else
			Response.Write "<p>ID: <a id=""mylink1"&Left(md5(Theme_Id),6)&""" href=""$div"&Left(md5(Theme_Id),6)&"tip?width=300"" class=""betterTip"" title="""&Theme_Id&""">" & "" & Theme_Id & "" & "</a></p>"
		End If
		Response.Write "<p><a id=""mylink"&Left(md5(Theme_Id),6)&""" href=""$div"&Left(md5(Theme_Id),6)&"tip?width=300"" class=""betterTip"" title="""&Theme_Id&"""><img src=""" & Theme_ScreenShot & """ title=""" & Theme_Name & """ alt=""ScreenShot"" width=""200"" height=""150"" /></a></p>"

		Response.Write "<div id=""div"&Left(md5(Theme_Id),6)&"tip"" style=""display:none;"">"
		Response.Write "<p>"&ZC_MSG001&":" & Theme_Name & "</p>"
		Response.Write "<p>"&ZC_MSG128&":" & Theme_Author_Name & "</p>"
		'Response.Write "<p>"&ZC_MSG054&":" & Theme_Author_Url & "</p>"
		Response.Write "<p>"&ZC_MSG313&":" & Theme_Source_Name & "</p>"
		'Response.Write "<p>"&ZC_MSG054&":" & Theme_Source_Url & "</p>"
		Response.Write "<p>"&ZC_MSG011&":" & Theme_Pubdate & "</p>"
		Response.Write "<p>"&ZC_MSG261&":" & Theme_Modified & "</p>"
		Response.Write "<p>"&ZC_MSG312&":<br />" & TransferHTML(Theme_Description,"[enter]") & "</p>"
		Response.Write "</div>"

		If Theme_Url="" Then
			Response.Write "<p>"&ZC_MSG001&":" & Theme_Name & "</p>"
		Else
			Response.Write "<p>"&ZC_MSG001&":<a target=""_blank"" href=""" & Theme_Url & """>" & Theme_Name & "</a></p>"
		End If

		If Theme_Author_Url="" Then
			Response.Write "<p>"&ZC_MSG128&":" & Theme_Author_Name & "</p>"
		Else
			Response.Write "<p>"&ZC_MSG128&":<a target=""_blank"" href=""" & Theme_Author_Url & """>" & Theme_Author_Name & "</a></p>"
		End If


		Response.Write "<p>"&ZC_MSG011&":" & Theme_Pubdate & "</p>"
		Response.Write "<p>"&ZC_MSG016&":" & Theme_Note & "</p>"
		Response.Write "<p>"&ZC_MSG314&":" & "<select class=""edit"" size=""1"" id=""cate"&Left(md5(Theme_Id),6)&""" name=""cate"&Left(md5(Theme_Id),6)&""" style=""width:100px;"" onchange=""document.getElementById('edtZC_BLOG_THEME').value='"&Theme_Id&"';document.getElementById('edtZC_BLOG_CSS').value=this.options[this.selectedIndex].value""> ><option value=""""></option>"


		aryFileList=LoadIncludeFiles("themes" & "/" & Theme_Id & "/style")

		If IsArray(aryFileList) Then
			j=UBound(aryFileList)
			For i=1 to j
				If (InStr(aryFileList(i),".css")>0) Or (InStr(aryFileList(i),".asp")) Then
					Theme_Style_Name=Replace(aryFileList(i),".css","")
					Theme_Style_Name=Replace(Theme_Style_Name,".asp","")
					If Theme_Id=CurrentTheme And Theme_Style_Name=CurrentStyle Then
						Response.Write " <option selected=""selected"" value="""& Theme_Style_Name &""">"&aryFileList(i)&"</option> "
					Else
						If j=1 Then
							Response.Write " <option selected=""selected"" value="""& Theme_Style_Name &""">"&aryFileList(i)&"</option> "
						ElseIf LCase(Theme_Style_Name)="style" Then
							Response.Write " <option selected=""selected"" value="""& Theme_Style_Name &""">"&aryFileList(i)&"</option> "
						ElseIf LCase(Theme_Style_Name)=LCase(Theme_Id) Then
							Response.Write " <option selected=""selected"" value="""& Theme_Style_Name &""">"&aryFileList(i)&"</option> "
						Else
							If i=1 Then
								Response.Write " <option selected=""selected"" value="""& Theme_Style_Name &""">"&aryFileList(i)&"</option> "
							Else
								Response.Write " <option value="""& Theme_Style_Name &""">"&aryFileList(i)&"</option> "
							End If
						End If
					End If
				End If
			Next
		End If

		Response.Write "</select>"
		'Response.Write "&nbsp;&nbsp;<a href='' onclick='if(document.getElementById(""cate"&Left(md5(Theme_Id),6)&""").value){document.getElementById(""frmTheme"").submit();return false;}'>["&ZC_MSG308&"]</a>"
		Response.Write "&nbsp;&nbsp;<input type=""submit"" class=""button"" value="""& ZC_MSG308 &""" id=""btnPost"" onclick='if(!document.getElementById(""cate"&Left(md5(Theme_Id),6)&""").value){return false;}else{document.getElementById(""edtZC_BLOG_THEME"").value="""&Theme_Id&""";document.getElementById(""edtZC_BLOG_CSS"").value=document.getElementById(""cate"&Left(md5(Theme_Id),6)&""").value};' />"

		'Response.Write "&nbsp;&nbsp;<input type=""submit"" class=""button"" value="""& ZC_MSG308 &""" id=""btnPost"" onclick='if(document.getElementById(""edtZC_BLOG_CSS"").value&&document.getElementById(""edtZC_BLOG_THEME"").value){return window.confirm("""& ZC_MSG058 &""");}else{return false}' />"
		Response.Write "</p>"


		Response.Write "</div>"



				End If
			Set objXmlFile=Nothing
			End If

		End If

	Next
	Set fso = nothing

		Response.Write "<input type=""hidden"" name=""edtZC_BLOG_CSS"" id=""edtZC_BLOG_CSS"" value="""" />"
		Response.Write "<input type=""hidden"" name=""edtZC_BLOG_THEME"" id=""edtZC_BLOG_THEME"" value="""" />"


	Response.Write "</form>"
	Response.Write "</div>"
	Err.Clear

	ExportThemesMng=True

End Function
'*********************************************************
%>