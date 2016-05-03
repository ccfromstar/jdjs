<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#BlogTitle#><#ZC_MSG044#><#ZC_BLOG_TITLE#><#ZC_MSG044#><#ZC_BLOG_SUBTITLE#></title>
<meta name="Description" content="<#BlogTitle#><#ZC_MSG044#><#ZC_BLOG_TITLE#><#ZC_MSG044#><#ZC_BLOG_SUBTITLE#>" />
<meta name="keywords" content="<#article/tagtoname#>"/>
    <link rel="shortcut icon" href="<#ZC_BLOG_HOST#>favicon.ico" >
    <link rel="stylesheet" rev="stylesheet" href="<#ZC_BLOG_HOST#>themes/<#ZC_BLOG_THEME#>/STYLE/Seanloo_Red.css" type="text/css" media="screen" />
    <link rel="alternate" type="application/rss+xml" href="<#ZC_BLOG_HOST#>rss.xml" title="<#ZC_BLOG_TITLE#>" />
    <script language="JavaScript" src="<#ZC_BLOG_HOST#>script/common.js" type="text/javascript"></script>
	<script language="JavaScript" type="text/javascript">
		var str00="<#ZC_BLOG_HOST#>";
		var str01="<#ZC_MSG033#>";
		var str02="<#ZC_MSG034#>";
		var str03="<#ZC_MSG035#>";
		var str06="<#ZC_MSG057#>";
		var intMaxLen="<#ZC_CONTENT_MAX#>";
		var strFaceName="<#ZC_EMOTICONS_FILENAME#>";
		var strFaceSize="<#ZC_EMOTICONS_FILESIZE#>";
		var strBatchView="";
		var strBatchInculde="";
		var strBatchCount="";
	</script>
</head>
<body>
<div id="header">
<div class="web_width">
<div class="logo"><a href="<#ZC_BLOG_HOST#>"><IMG src="<#ZC_BLOG_HOST#>themes/<#ZC_BLOG_THEME#>/style/Seanloo/logo.gif"></a></div>
<div id="search">
    <form method='Post' name='SearchForm' action='<#ZC_BLOG_HOST#>cmd.asp?act=Search'>
        <div id="s_1">
	    <input type="text" name="edtSearch" id="edtSearch" size="23" value="请输入关键词" onblur="if(this.value=='') this.value='请输入关键词';" onfocus="if(this.value=='请输入关键词') this.value='';" class="article_search"/>
            <input type='hidden' name='Field'  value="ArticleName">
        </div>
        <div id="s_2">
            <input type='image' src="<#ZC_BLOG_HOST#>themes/<#ZC_BLOG_THEME#>/style/seanloo/search_2.gif" name='Submit'  value=' 搜索 '>
        </div>
    </form>
</div>
<DIV id=tab_new></DIV>
</div>

<div id="menu">
<div id="menu_left"></div>
<div id="menu_right">
   <UL>
     <#CACHE_INCLUDE_NAVBAR#>
   </UL>
</div>
</div>
</div>

<div id="bbs_menu">
<div id="bbs_menu_list">
<UL>
 <#CACHE_INCLUDE_CATALOG#>
</UL>
</div>
</div>