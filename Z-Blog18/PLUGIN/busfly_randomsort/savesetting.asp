﻿<%@ CODEPAGE=65001 %>
<%
'///////////////////////////////////////////////////////////////////////////////
'// 插件应用:    Z-Blog 1.8及以上的版本
'// 插件制作:   巴士飞扬(www.busfly.cn)
'// 备    注:    文章排行的插件代码
'// 最后修改：   2007-12-21
'// 最后版本:    
'///////////////////////////////////////////////////////////////////////////////
%>
<% Option Explicit %>
<% On Error Resume Next %>
<% Response.Charset="UTF-8" %>
<% Response.Buffer=True %>
<!-- #include file="../../c_option.asp" -->
<!-- #include file="../../function/c_function.asp" -->
<!-- #include file="../../function/c_function_md5.asp" -->
<!-- #include file="../../function/c_system_lib.asp" -->
<!-- #include file="../../function/c_system_base.asp" -->
<!-- #include file="../../function/c_system_event.asp" -->
<!-- #include file="../../function/c_system_plugin.asp" -->
<%

Call System_Initialize()

'检查非法链接
Call CheckReference("")

'检查权限
If BlogUser.Level>1 Then Call ShowError(6) 

	Dim strContent
	strContent=LoadFromFile(BlogPath & "/PLUGIN/busfly_randomsort/include.asp","utf-8")

	Dim intCutLen '每条记录的标题字数
	intCutLen=Request.Form("intCutLen")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_INTCUTLEN",intCutLen)
	
	
	Dim busfly_randomsort_NUM_CategoryComments		'分类最新回复- 设置显示多少条记录	
	busfly_randomsort_NUM_CategoryComments=Request.Form("busfly_randomsort_NUM_CategoryComments")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_NUM_CategoryComments",busfly_randomsort_NUM_CategoryComments)
    Dim busfly_randomsort_NUM_CategoryTophot		'分类热门文章 - 设置显示多少条记录
	busfly_randomsort_NUM_CategoryTophot=Request.Form("busfly_randomsort_NUM_CategoryTophot")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_NUM_CategoryTophot",busfly_randomsort_NUM_CategoryTophot)

	Dim busfly_randomsort_isBuildCategoryComments
	busfly_randomsort_isBuildCategoryComments=Request.Form("busfly_randomsort_isBuildCategoryComments")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_isBuildCategoryComments",busfly_randomsort_isBuildCategoryComments)
         <!--分类最新回复--> 300	是否使用
	Dim busfly_randomsort_isBuildCategoryTophot
	busfly_randomsort_isBuildCategoryTophot=Request.Form("busfly_randomsort_isBuildCategoryTophot")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_isBuildCategoryTophot",busfly_randomsort_isBuildCategoryTophot)
         '<!--分类热门文章--> 320	是否使用
	
	
    Dim num_strnew 		'最新文章 -设置显示多少条记录
	num_strnew=Request.Form("num_strnew")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_NUM_STRNEW",num_strnew)
	
    Dim num_strtemp 		'随机文章 -设置显示多少条记录
	num_strtemp=Request.Form("num_strtemp")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_NUM_STRTEMP",num_strtemp)
	
    Dim num_busfly_strtemp 	'完全随机文章 -设置显示多少条记录
	num_busfly_strtemp=Request.Form("num_busfly_strtemp")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_NUM_BUSFLY_STRTEMP",num_busfly_strtemp)
	
    Dim num_strcommonth 	'本月评论排行 -设置显示多少条记录
	num_strcommonth=Request.Form("num_strcommonth")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_NUM_STRCOMMONTH",num_strcommonth)
	
    Dim num_strcomyear 	'本年评论排行 -设置显示多少条记录
	num_strcomyear=Request.Form("num_strcomyear")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_NUM_STRCOMYEAR",num_strcomyear)
	
    Dim num_strtopmonth 	'本月排行 -设置显示多少条记录
	num_strtopmonth=Request.Form("num_strtopmonth")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_NUM_STRTOPMONTH",num_strtopmonth)
	
    Dim num_strtopyear 	'本年排行 -设置显示多少条记录
	num_strtopyear=Request.Form("num_strtopyear")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_NUM_STRTOPYEAR",num_strtopyear)

    Dim num_busfly_tophot '热文排行 -设置显示多少条记录
	num_busfly_tophot=Request.Form("num_busfly_tophot")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_NUM_BUSFLY_TOPHOT",num_busfly_tophot)

    Dim busfly_randomsort_NUM_Category '分类文章 - 设置显示多少条记录
	busfly_randomsort_NUM_Category=Request.Form("busfly_randomsort_NUM_Category")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_NUM_Category",busfly_randomsort_NUM_Category)
	
    Dim busfly_randomsort_isBuildnew '最新文章 >是否使用
	busfly_randomsort_isBuildnew=Request.Form("busfly_randomsort_isBuildnew")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_isBuildnew",busfly_randomsort_isBuildnew)

    Dim busfly_randomsort_isBuildrand '随机文章>是否使用
	busfly_randomsort_isBuildrand=Request.Form("busfly_randomsort_isBuildrand")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_isBuildrand",busfly_randomsort_isBuildrand)

    Dim busfly_randomsort_isBuildallrand '完全随机文章>是否使用
	busfly_randomsort_isBuildallrand=Request.Form("busfly_randomsort_isBuildallrand")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_isBuildallrand",busfly_randomsort_isBuildallrand)

    Dim busfly_randomsort_isBuildcommonth '本月评论排行>是否使用
	busfly_randomsort_isBuildcommonth=Request.Form("busfly_randomsort_isBuildcommonth")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_isBuildcommonth",busfly_randomsort_isBuildcommonth)

    Dim busfly_randomsort_isBuildcomyear '本年评论排行>是否使用
	busfly_randomsort_isBuildcomyear=Request.Form("busfly_randomsort_isBuildcomyear")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_isBuildcomyear",busfly_randomsort_isBuildcomyear)

    Dim busfly_randomsort_isBuildtopmonth '本月排行>是否使用
	busfly_randomsort_isBuildtopmonth=Request.Form("busfly_randomsort_isBuildtopmonth")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_isBuildtopmonth",busfly_randomsort_isBuildtopmonth)

    Dim busfly_randomsort_isBuildtopyear '本年排行>是否使用
	busfly_randomsort_isBuildtopyear=Request.Form("busfly_randomsort_isBuildtopyear")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_isBuildtopyear",busfly_randomsort_isBuildtopyear)

    Dim busfly_randomsort_isBuildtophot '热文排行>是否使用
	busfly_randomsort_isBuildtophot=Request.Form("busfly_randomsort_isBuildtophot")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_isBuildtophot",busfly_randomsort_isBuildtophot)

    Dim busfly_randomsort_isBuildCategory '<!--分类文章-->	是否使用
	busfly_randomsort_isBuildCategory=Request.Form("busfly_randomsort_isBuildCategory")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_isBuildCategory",busfly_randomsort_isBuildCategory)

    Dim busfly_randomsort_isBuildTags '是否启用生成TAGS
	busfly_randomsort_isBuildTags=Request.Form("busfly_randomsort_isBuildTags")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_isBuildTags",busfly_randomsort_isBuildTags)

    Dim busfly_randomsort_isStatistics '是否启用网站统计
	busfly_randomsort_isStatistics=Request.Form("busfly_randomsort_isStatistics")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_isStatistics",busfly_randomsort_isStatistics)

    Dim busfly_randomsort_isArchives '是否启用归档
	busfly_randomsort_isArchives=Request.Form("busfly_randomsort_isArchives")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_isArchives",busfly_randomsort_isArchives)

    Dim busfly_randomsort_isComments '是否启用评论回复
	busfly_randomsort_isComments=Request.Form("busfly_randomsort_isComments")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_isComments",busfly_randomsort_isComments)

    Dim busfly_randomsort_isGuestComments '是否启用留言
	busfly_randomsort_isGuestComments=Request.Form("busfly_randomsort_isGuestComments")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_isGuestComments",busfly_randomsort_isGuestComments)

    Dim busfly_randomsort_isTrackBacks '是否启用引用列表
	busfly_randomsort_isTrackBacks=Request.Form("busfly_randomsort_isTrackBacks")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_isTrackBacks",busfly_randomsort_isTrackBacks)

    Dim busfly_randomsort_isCatalogs '是否启用分类目录
	busfly_randomsort_isCatalogs=Request.Form("busfly_randomsort_isCatalogs")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_isCatalogs",busfly_randomsort_isCatalogs)

    Dim busfly_randomsort_isAuthors '是否启用用户列表
	busfly_randomsort_isAuthors=Request.Form("busfly_randomsort_isAuthors")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_isAuthors",busfly_randomsort_isAuthors)

    Dim busfly_randomsort_NUM_Tags 'Tag的记录条数
	busfly_randomsort_NUM_Tags=Request.Form("busfly_randomsort_NUM_Tags")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_NUM_Tags",busfly_randomsort_NUM_Tags)

    Dim busfly_randomsort_NUM_Archives '归档条数
	busfly_randomsort_NUM_Archives=Request.Form("busfly_randomsort_NUM_Archives")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_NUM_Archives",busfly_randomsort_NUM_Archives)

    Dim busfly_randomsort_NUM_Comments '评论及回复条数
	busfly_randomsort_NUM_Comments=Request.Form("busfly_randomsort_NUM_Comments")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_NUM_Comments",busfly_randomsort_NUM_Comments)

    Dim busfly_randomsort_NUM_GuestComments '留言条数
	busfly_randomsort_NUM_GuestComments=Request.Form("busfly_randomsort_NUM_GuestComments")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_NUM_GuestComments",busfly_randomsort_NUM_GuestComments)

    Dim busfly_randomsort_NUM_TrackBacks '引用条数
	busfly_randomsort_NUM_TrackBacks=Request.Form("busfly_randomsort_NUM_TrackBacks")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_NUM_TrackBacks",busfly_randomsort_NUM_TrackBacks)

    Dim busfly_randomsort_NUM_Catalogs '分类条数
	busfly_randomsort_NUM_Catalogs=Request.Form("busfly_randomsort_NUM_Catalogs")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_NUM_Catalogs",busfly_randomsort_NUM_Catalogs)

    Dim busfly_randomsort_NUM_Authors '用户条数
	busfly_randomsort_NUM_Authors=Request.Form("busfly_randomsort_NUM_Authors")
	Call SaveValueForSetting(strContent,True,"Numeric","busfly_randomsort_NUM_Authors",busfly_randomsort_NUM_Authors)

    Dim busfly_randomsort_chReplace '设置单引号和双引号的替换字符
	busfly_randomsort_chReplace=Request.Form("busfly_randomsort_chReplace")
	Call SaveValueForSetting(strContent,True,"String","busfly_randomsort_chReplace",busfly_randomsort_chReplace)

	Call SaveToFile(BlogPath & "/PLUGIN/busfly_randomsort/include.asp",strContent,"utf-8",False)

Call SetBlogHint(Empty,True,Empty)

Call System_Terminate()


If Err.Number<>0 then
  Call ShowError(0)
End If
%>
<script type="text/javascript">window.location="setting.asp"</script>
