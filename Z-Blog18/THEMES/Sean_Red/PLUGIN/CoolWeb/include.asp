<%
'///////////////////////////////////////////////////////////////////////////////
'// 插件应用:    Z-Blog 1.8 Spirit Build 80722 其它版本未知
'// 插件制作:    心诺空间(http://www.seanloo.cn)
'// 备   注:     River_PicPlay
'// 最后修改：   2009.4.13
'// 最后版本:    2.0.0
'///////////////////////////////////////////////////////////////////////////////

On Error Resume Next

Const River_PicPlay_Focus_Width = 240
Const River_PicPlay_Focus_Height = 200
Const River_PicPlay_Text_Height = 20
Const River_PicPlay_Count = 4

Const River_PicPlay_Pics = "http://www.seanloo.cn/upload/2009/4/200904271603441852.jpg|http://www.seanloo.cn/upload/2009/4/200904291101140741.jpg"
Const River_PicPlay_Links = "http://www.seanloo.cn/post/100.html|http://www.seanloo.cn/post/102.html"
Const River_PicPlay_Texts = "刷子桌和刷子凳|我们的生活，我们做主，挑战传统.."

'注册插件
Call RegisterPlugin("Sean_Simple_T","ActivePlugin_Sean_Simple_T")


'具体的接口挂接
Function ActivePlugin_Sean_Simple_T() 

End Function

'安装插件
Function InstallPlugin_Sean_Simple_T()
	On Error Resume Next
	Call SetBlogHint_Custom("! 提示信息：插件已经成功安装。")
	'Call MakeBlogReBuild
	Err.Clear
End Function

'卸载插件
Function UnInstallPlugin_Sean_Simple_T()
	On Error Resume Next
	Call DelSiteFile(BlogPath & "/include/PicPlay.asp")
	Call SetBlogHint_Custom("! 提示信息：插件已经卸载，同时删除了本插件所生成的文件。")
	Err.Clear
End Function
%>