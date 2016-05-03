<%
'///////////////////////////////////////////////////////////////////////////////
'// 插件应用:    Z-Blog 1.8 Spirit Build 80722 其它版本未知
'// 插件制作:    心诺空间(http://www.seanloo.cn)
'// 备   注:     River_PicPlay
'// 最后修改：   2009.4.13
'// 最后版本:    2.0.0
'///////////////////////////////////////////////////////////////////////////////


Select Case Request("Action")
	Case "post"
		Call River_PicPlay_Post(Request("Pics"), Request("Links"), Request("Texts"))
	Case "del"
		Call River_PicPlay_Del(Request("id"))
	Case "build"
		Call River_PicPlay_Build
	Case "set"
		Call River_PicPlay_Set(Request("FWidth"), Request("FHeight"), Request("THeight"), Request("Count"))
End Select

Function River_PicPlay_Post(Pics, Links, Texts)
	Dim tmpSng, tmpRiver_PicPlay_Count, tmpRiver_PicPlay_Pics, tmpRiver_PicPlay_Links, tmpRiver_PicPlay_Texts
	Dim arrRiver_PicPlay_Pics, arrRiver_PicPlay_Links, arrRiver_PicPlay_Texts
	Dim i

	If Pics = "" Then
		Call SetBlogHint(False,Empty,Empty)
		Call SetBlogHint_Custom("? 提示:图片地址不可为空.")
		Exit Function
	End If

	tmpSng=LoadFromFile(BlogPath & "/THEMES/Sean_Simple_T/PLUGIN/CoolWeb/include.asp","utf-8")
	Call LoadValueForSetting(tmpSng,True,"Numeric","River_PicPlay_Count",tmpRiver_PicPlay_Count)
	Call LoadValueForSetting(tmpSng,True,"String","River_PicPlay_Pics",tmpRiver_PicPlay_Pics)
	Call LoadValueForSetting(tmpSng,True,"String","River_PicPlay_Links",tmpRiver_PicPlay_Links)
	Call LoadValueForSetting(tmpSng,True,"String","River_PicPlay_Texts",tmpRiver_PicPlay_Texts)

	arrRiver_PicPlay_Pics = Split(tmpRiver_PicPlay_Pics, "|")
	arrRiver_PicPlay_Links = Split(tmpRiver_PicPlay_Links, "|")
	arrRiver_PicPlay_Texts = Split(tmpRiver_PicPlay_Texts, "|")

	tmpRiver_PicPlay_Pics = Pics
	tmpRiver_PicPlay_Links = Links
	tmpRiver_PicPlay_Texts = Texts

	For i = 0 To UBound(arrRiver_PicPlay_Pics)
		If i >= tmpRiver_PicPlay_Count - 1 Then Exit For
		tmpRiver_PicPlay_Pics = tmpRiver_PicPlay_Pics & "|" & arrRiver_PicPlay_Pics(i)
		tmpRiver_PicPlay_Links = tmpRiver_PicPlay_Links & "|" & arrRiver_PicPlay_Links(i)
		tmpRiver_PicPlay_Texts = tmpRiver_PicPlay_Texts & "|" & arrRiver_PicPlay_Texts(i)
	Next 'i

	Call SaveValueForSetting(tmpSng,True,"String","River_PicPlay_Pics",tmpRiver_PicPlay_Pics)
	Call SaveValueForSetting(tmpSng,True,"String","River_PicPlay_Links",tmpRiver_PicPlay_Links)
	Call SaveValueForSetting(tmpSng,True,"String","River_PicPlay_Texts",tmpRiver_PicPlay_Texts)
	Call SaveToFile(BlogPath & "/THEMES/Sean_Simple_T/PLUGIN/CoolWeb/include.asp",tmpSng,"utf-8",False)

	Call SetBlogHint(True,Empty,Empty)
	Call SetBlogHint_Custom("? 提示:已成功添加内容.")
	Call River_PicPlay_Build()
End Function

Function River_PicPlay_Del(id)
	Dim tmpSng, tmpRiver_PicPlay_Pics, tmpRiver_PicPlay_Links, tmpRiver_PicPlay_Texts

	tmpSng=LoadFromFile(BlogPath & "/THEMES/Sean_Simple_T/PLUGIN/CoolWeb/include.asp","utf-8")
	Call LoadValueForSetting(tmpSng,True,"String","River_PicPlay_Pics",tmpRiver_PicPlay_Pics)
	Call LoadValueForSetting(tmpSng,True,"String","River_PicPlay_Links",tmpRiver_PicPlay_Links)
	Call LoadValueForSetting(tmpSng,True,"String","River_PicPlay_Texts",tmpRiver_PicPlay_Texts)

	id = Int(id)
	Select Case id
		Case 1
			tmpRiver_PicPlay_Pics = Right(tmpRiver_PicPlay_Pics, Len(tmpRiver_PicPlay_Pics) - InStrC(tmpRiver_PicPlay_Pics, "|", id))
			tmpRiver_PicPlay_Links = Right(tmpRiver_PicPlay_Links, Len(tmpRiver_PicPlay_Links) - InStrC(tmpRiver_PicPlay_Links, "|", id))
			tmpRiver_PicPlay_Texts = Right(tmpRiver_PicPlay_Texts, Len(tmpRiver_PicPlay_Texts) - InStrC(tmpRiver_PicPlay_Texts, "|", id))

		Case InStrT(tmpRiver_PicPlay_Pics, "|") + 1
			tmpRiver_PicPlay_Pics = Left(tmpRiver_PicPlay_Pics, InStrC(tmpRiver_PicPlay_Pics, "|", id - 1) - 1)
			tmpRiver_PicPlay_Links = Left(tmpRiver_PicPlay_Links, InStrC(tmpRiver_PicPlay_Links, "|", id - 1) - 1)
			tmpRiver_PicPlay_Texts = Left(tmpRiver_PicPlay_Texts, InStrC(tmpRiver_PicPlay_Texts, "|", id - 1) - 1)

		Case Else
			tmpRiver_PicPlay_Pics = Left(tmpRiver_PicPlay_Pics, InStrC(tmpRiver_PicPlay_Pics, "|", id - 1)) & Right(tmpRiver_PicPlay_Pics, Len(tmpRiver_PicPlay_Pics) - InStrC(tmpRiver_PicPlay_Pics, "|", id))
			tmpRiver_PicPlay_Links = Left(tmpRiver_PicPlay_Links, InStrC(tmpRiver_PicPlay_Links, "|", id - 1)) & Right(tmpRiver_PicPlay_Links, Len(tmpRiver_PicPlay_Links) - InStrC(tmpRiver_PicPlay_Links, "|", id))
			tmpRiver_PicPlay_Texts = Left(tmpRiver_PicPlay_Texts, InStrC(tmpRiver_PicPlay_Texts, "|", id - 1)) & Right(tmpRiver_PicPlay_Texts, Len(tmpRiver_PicPlay_Texts) - InStrC(tmpRiver_PicPlay_Texts, "|", id))
	End Select

	Call SaveValueForSetting(tmpSng,True,"String","River_PicPlay_Pics",tmpRiver_PicPlay_Pics)
	Call SaveValueForSetting(tmpSng,True,"String","River_PicPlay_Links",tmpRiver_PicPlay_Links)
	Call SaveValueForSetting(tmpSng,True,"String","River_PicPlay_Texts",tmpRiver_PicPlay_Texts)
	Call SaveToFile(BlogPath & "/THEMES/Sean_Simple_T/PLUGIN/CoolWeb/include.asp",tmpSng,"utf-8",False)

	Call SetBlogHint(True,Empty,Empty)
	Call SetBlogHint_Custom("? 提示:已成功删除内容.")
	Call River_PicPlay_Build()
End Function

Function River_PicPlay_Build()
	Dim strOut
	Dim tmpSng, tmpRiver_PicPlay_Pics, tmpRiver_PicPlay_Links, tmpRiver_PicPlay_Texts
	Dim tmpRiver_PicPlay_Focus_Width, tmpRiver_PicPlay_Focus_Height, tmpRiver_PicPlay_Text_Height

	tmpSng=LoadFromFile(BlogPath & "/THEMES/Sean_Simple_T/PLUGIN/CoolWeb/include.asp","utf-8")
	Call LoadValueForSetting(tmpSng,True,"Numeric","River_PicPlay_Focus_Width",tmpRiver_PicPlay_Focus_Width)
	Call LoadValueForSetting(tmpSng,True,"Numeric","River_PicPlay_Focus_Height",tmpRiver_PicPlay_Focus_Height)
	Call LoadValueForSetting(tmpSng,True,"Numeric","River_PicPlay_Text_Height",tmpRiver_PicPlay_Text_Height)

	Call LoadValueForSetting(tmpSng,True,"String","River_PicPlay_Pics",tmpRiver_PicPlay_Pics)
	Call LoadValueForSetting(tmpSng,True,"String","River_PicPlay_Links",tmpRiver_PicPlay_Links)
	Call LoadValueForSetting(tmpSng,True,"String","River_PicPlay_Texts",tmpRiver_PicPlay_Texts)

	strOut = strOut & vbCrLf & "<script type=text/javascript>"
	strOut = strOut & vbCrLf & "        <!--"

	strOut = strOut & vbCrLf & "        var focus_width=" & tmpRiver_PicPlay_Focus_Width &";//图片宽"
	strOut = strOut & vbCrLf & "        var focus_height=" & tmpRiver_PicPlay_Focus_Height &";//图片高"
	strOut = strOut & vbCrLf & "        var text_height=" & tmpRiver_PicPlay_Text_Height &";//设置显示文字标题高度,最佳为20（如果不显示标题值设为0即可）"
	strOut = strOut & vbCrLf & "        var swf_height=focus_height+text_height;"

	strOut = strOut & vbCrLf
	strOut = strOut & vbCrLf & "        var pics=""" & tmpRiver_PicPlay_Pics & """;"
	strOut = strOut & vbCrLf & "        var links=""" & tmpRiver_PicPlay_Links & """;"
	strOut = strOut & vbCrLf & "        var texts=""" & tmpRiver_PicPlay_Texts & """;"
	strOut = strOut & vbCrLf
	strOut = strOut & vbCrLf & "        document.write('<object ID=""focus_flash"" classid=""clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"" codebase=""http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"" width=""'+ focus_width +'"" height=""'+ swf_height +'"">');"
	strOut = strOut & vbCrLf & "        document.write('<param name=""allowScriptAccess"" value=""sameDomain""><param name=""movie"" value=""" & ZC_BLOG_HOST & "THEMES/Sean_Simple_T/PLUGIN/CoolWeb/PicPlay.swf""><param name=""quality"" value=""high""><param name=""bgcolor"" value=""#FFFFFF"">');"
	strOut = strOut & vbCrLf & "        document.write('<param name=""menu"" value=""false""><param name=wmode value=""opaque"">');"
	strOut = strOut & vbCrLf & "        document.write('<param name=""FlashVars"" value=""pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'"">');"
	strOut = strOut & vbCrLf & "        document.write('<embed ID=""focus_flash"" src=""" & ZC_BLOG_HOST & "THEMES/Sean_Simple_T/PLUGIN/PicPlay.swf"" wmode=""opaque"" FlashVars=""pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'"" menu=""false"" bgcolor=""#C5C5C5"" quality=""high"" width=""'+ focus_width +'"" height=""'+ swf_height +'"" allowScriptAccess=""sameDomain"" type=""application/x-shockwave-flash"" pluginspage=""http://www.macromedia.com/go/getflashplayer"" />');document.write('</object>');"
	strOut = strOut & vbCrLf & "        //-->"
	strOut = strOut & vbCrLf & "</script>"

	strOut = TransferHTML(strOut,"[no-asp]")
	Call SaveToFile(BlogPath & "/include/Sean_Simple_T.asp", strOut, "utf-8", True)

	Call SetBlogHint(True,Empty,Empty)
	Call SetBlogHint_Custom("? 提示:已成功生成内容.")
	Call MakeBlogReBuild_Core()
End Function

Function River_PicPlay_Set(FWidth, FHeight, THeight, Count)
	Dim tmpSng
	tmpSng=LoadFromFile(BlogPath & "/THEMES/Sean_Simple_T/PLUGIN/include.asp","utf-8")
	Call SaveValueForSetting(tmpSng,True,"Numeric","River_PicPlay_Focus_Width",FWidth)
	Call SaveValueForSetting(tmpSng,True,"Numeric","River_PicPlay_Focus_Height",FHeight)
	Call SaveValueForSetting(tmpSng,True,"Numeric","River_PicPlay_Text_Height",THeight)
	Call SaveValueForSetting(tmpSng,True,"Numeric","River_PicPlay_Count",Count)
	Call SaveToFile(BlogPath & "/THEMES/Sean_Simple_T/PLUGIN/include.asp",tmpSng,"utf-8",False)

	Call SetBlogHint(True,Empty,Empty)
	Call SetBlogHint_Custom("? 提示:已成功设置幻灯.")
	Call River_PicPlay_Build()
End Function

Function InStrC(ByVal string1, ByVal string2, ByVal string2_count)
	Dim i, count:count = 0

	For i = 1 To Len(string1)
		If Mid(string1, i, Len(string2)) = string2 Then count = count + 1
		InStrC = i
		If count = string2_count Then Exit For
	Next 'i
End Function

Function InStrT(ByVal string1, ByVal string2)
	Dim i, count:count = 0

	For i = 1 To Len(string1)
		If Mid(string1, i, Len(string2)) = string2 Then count = count + 1
		InStrT = count
	Next 'i
End Function
%>