<%@ Page language="c#" AutoEventWireup="false" EnableViewState="false" Inherits="Discuz.Mall.Pages.usercpmygoods" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="Discuz.Common" %>
<%@ Import namespace="Discuz.Forum" %>
<%@ Import namespace="Discuz.Entity" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by Discuz!NT Template Engine at 2009/9/29 9:13:07.
		本页面代码由Discuz!NT模板引擎生成于 2009/9/29 9:13:07. 
	*/

	base.OnInit(e);

	templateBuilder.Capacity = 220000;



	if (infloat!=1)
	{

	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
	templateBuilder.Append("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
	templateBuilder.Append("<head>\r\n");
	templateBuilder.Append("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");

	if (pagetitle=="首页")
	{

	templateBuilder.Append("<title>");
	templateBuilder.Append(config.Forumtitle.ToString().Trim());
	templateBuilder.Append(" ");
	templateBuilder.Append(config.Seotitle.ToString().Trim());
	templateBuilder.Append(" - Powered by Discuz!NT</title>\r\n");

	}
	else
	{

	templateBuilder.Append("<title>");
	templateBuilder.Append(pagetitle.ToString());
	templateBuilder.Append(" - ");
	templateBuilder.Append(config.Forumtitle.ToString().Trim());
	templateBuilder.Append(" ");
	templateBuilder.Append(config.Seotitle.ToString().Trim());
	templateBuilder.Append(" - Powered by Discuz!NT</title>\r\n");

	}	//end if
	templateBuilder.Append(meta.ToString());
	templateBuilder.Append("\r\n");
	templateBuilder.Append("<meta name=\"generator\" content=\"Discuz!NT 3.0.0\" />\r\n");
	templateBuilder.Append("<meta name=\"author\" content=\"Discuz!NT Team and Comsenz UI Team\" />\r\n");
	templateBuilder.Append("<meta name=\"copyright\" content=\"2001-2009 Comsenz Inc.\" />\r\n");
	templateBuilder.Append("<meta http-equiv=\"x-ua-compatible\" content=\"ie=7\" />\r\n");
	templateBuilder.Append("<link rel=\"icon\" href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("favicon.ico\" type=\"image/x-icon\" />\r\n");
	templateBuilder.Append("<link rel=\"shortcut icon\" href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("favicon.ico\" type=\"image/x-icon\" />\r\n");
	templateBuilder.Append("<link rel=\"stylesheet\" href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/dnt.css\" type=\"text/css\" media=\"all\" />\r\n");
	templateBuilder.Append("<link rel=\"stylesheet\" href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/float.css\" type=\"text/css\" />\r\n");
	templateBuilder.Append(link.ToString());
	templateBuilder.Append("\r\n");
	templateBuilder.Append("<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("javascript/common.js\"></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("javascript/template_report.js\"></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("javascript/template_utils.js\"></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("javascript/ajax.js\"></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\">\r\n");
	templateBuilder.Append("	var aspxrewrite = ");
	templateBuilder.Append(config.Aspxrewrite.ToString().Trim());
	templateBuilder.Append(";\r\n");
	templateBuilder.Append("	var IMGDIR = '");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images'\r\n");
	templateBuilder.Append("    var allowfloatwin = ");
	templateBuilder.Append(config.Allowfloatwin.ToString().Trim());
	templateBuilder.Append("\r\n");
	templateBuilder.Append("	var rooturl=\"");
	templateBuilder.Append(rooturl.ToString());
	templateBuilder.Append("\";\r\n");
	templateBuilder.Append("</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append(script.ToString());
	templateBuilder.Append("\r\n");
	templateBuilder.Append("</head>\r\n");


	templateBuilder.Append("<body onkeydown=\"if(event.keyCode==27) return false;\">\r\n");
	templateBuilder.Append("<div id=\"append_parent\"></div><div id=\"ajaxwaitid\"></div>\r\n");
	templateBuilder.Append("<div id=\"submenu\">\r\n");
	templateBuilder.Append("	<div class=\"wrap s_clear\">\r\n");

	if (usergroupinfo.Allowsearch>0)
	{


	templateBuilder.Append("	<form method=\"post\" action=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("search.aspx\" target=\"_blank\" onsubmit=\"bind_keyword(this);\" class=\"right\">\r\n");
	templateBuilder.Append("		<input type=\"hidden\" name=\"poster\" />\r\n");
	templateBuilder.Append("		<input type=\"hidden\" name=\"keyword\" />\r\n");
	templateBuilder.Append("		<input type=\"hidden\" name=\"type\" value=\"\" />\r\n");
	templateBuilder.Append("		<input id=\"keywordtype\" type=\"hidden\" name=\"keywordtype\" value=\"0\" />\r\n");
	templateBuilder.Append("		<a href=\"javascript:void(0);\" class=\"drop\" id=\"quicksearch\" onclick=\"showMenu(this.id, false);\" onmouseover=\"MouseCursor(this);\">快速搜索</a>\r\n");
	templateBuilder.Append("		<input type=\"text\" name=\"keywordf\" value=\"输入搜索关键字\" onblur=\"if(this.value=='')this.value=defaultValue\" onclick=\"if(this.value==this.defaultValue)this.value = ''\" onkeydown=\"if(this.value==this.defaultValue)this.value = ''\" class=\"txt\"/>\r\n");
	templateBuilder.Append("		<input name=\"searchsubmit\" type=\"submit\" value=\"\" class=\"btnsearch\"/>\r\n");
	templateBuilder.Append("	</form>\r\n");
	templateBuilder.Append("	<script type=\"text/javascript\">\r\n");
	templateBuilder.Append("	    function bind_keyword(form)\r\n");
	templateBuilder.Append("	    {\r\n");
	templateBuilder.Append("	        if (form.keywordtype.value == '8')\r\n");
	templateBuilder.Append("	        {\r\n");
	templateBuilder.Append("	            form.keyword.value = '';\r\n");
	templateBuilder.Append("	            form.poster.value = form.keywordf.value;\r\n");
	templateBuilder.Append("	        }\r\n");
	templateBuilder.Append("	        else\r\n");
	templateBuilder.Append("	        {\r\n");
	templateBuilder.Append("	            form.poster.value = '';\r\n");
	templateBuilder.Append("	            form.keyword.value = form.keywordf.value;\r\n");
	templateBuilder.Append("	            if (form.keywordtype.value == '2')\r\n");
	templateBuilder.Append("	                form.type.value = 'spacepost';\r\n");
	templateBuilder.Append("	            if (form.keywordtype.value == '3')\r\n");
	templateBuilder.Append("	                form.type.value = 'album';\r\n");
	templateBuilder.Append("	        }\r\n");
	templateBuilder.Append("	    }\r\n");
	templateBuilder.Append("	</");
	templateBuilder.Append("script>\r\n");



	}	//end if

	templateBuilder.Append("	<span class=\"avataonline right\">\r\n");

	if (userid==-1)
	{

	templateBuilder.Append("		<a href=\"");
	templateBuilder.Append(forumpath.ToString());
	templateBuilder.Append("login.aspx\" onClick=\"floatwin('open_login', '");
	templateBuilder.Append(rooturl.ToString());
	templateBuilder.Append("login.aspx', 600, 410);return false;\">[登录]</a>\r\n");
	templateBuilder.Append("		<a href=\"");
	templateBuilder.Append(forumpath.ToString());
	templateBuilder.Append("register.aspx\" onClick=\"floatwin('open_register', '");
	templateBuilder.Append(rooturl.ToString());
	templateBuilder.Append("register.aspx', 600, 410);return false;\">[注册]</a\r\n");
	templateBuilder.Append("		>\r\n");

	}
	else
	{

	templateBuilder.Append("		欢迎<a class=\"drop\" id=\"viewpro\" onMouseOver=\"showMenu(this.id)\">");
	templateBuilder.Append(username.ToString());
	templateBuilder.Append("</a>\r\n");
	templateBuilder.Append("		<span class=\"pipe\">|</span>\r\n");
	templateBuilder.Append("		<a href=\"");
	templateBuilder.Append(forumpath.ToString());
	templateBuilder.Append("logout.aspx?userkey=");
	templateBuilder.Append(userkey.ToString());
	templateBuilder.Append("\">退出</a>\r\n");
	templateBuilder.Append("		<span class=\"pipe\">|</span>\r\n");

	}	//end if

	templateBuilder.Append("	</span>\r\n");

	if (userid!=-1)
	{

	templateBuilder.Append("	<a href=\"");
	templateBuilder.Append(forumpath.ToString());
	templateBuilder.Append("usercpinbox.aspx\" class=\"inbox\" title=\"");
	templateBuilder.Append(oluserinfo.Newpms.ToString().Trim());
	templateBuilder.Append("条新短消息\">收件箱</a>\r\n");

	if (oluserinfo.Newpms>0)
	{

	templateBuilder.Append("<cite>");
	templateBuilder.Append(oluserinfo.Newpms.ToString().Trim());
	templateBuilder.Append("</cite>\r\n");

	}	//end if

	templateBuilder.Append("	<span class=\"pipe\">|</span>\r\n");
	templateBuilder.Append("	<a href=\"");
	templateBuilder.Append(forumpath.ToString());
	templateBuilder.Append("usercpnotice.aspx?filter=all\" class=\"notice\">通知</a>\r\n");

	if (oluserinfo.Newnotices>0)
	{

	templateBuilder.Append("<cite>");
	templateBuilder.Append(oluserinfo.Newnotices.ToString().Trim());
	templateBuilder.Append("</cite>\r\n");

	}	//end if

	templateBuilder.Append("	<span class=\"pipe\">|</span>\r\n");
	templateBuilder.Append("	<a href=\"");
	templateBuilder.Append(forumpath.ToString());
	templateBuilder.Append("usercp.aspx\" class=\"usercp\">用户中心</a>\r\n");
	templateBuilder.Append("	<span class=\"pipe\">|</span>\r\n");

	if (useradminid==1)
	{

	templateBuilder.Append("	<a href=\"");
	templateBuilder.Append(forumpath.ToString());
	templateBuilder.Append("admin/index.aspx\" target=\"_blank\" class=\"systemmanage\">系统设置</a>\r\n");
	templateBuilder.Append("	<span class=\"pipe\">|</span>\r\n");

	}	//end if

	templateBuilder.Append("	<a href=\"javascript:void(0);\" class=\"drop\" id=\"mymenu\" onMouseOver=\"showMenu(this.id, false);\" >我的</a>\r\n");
	templateBuilder.Append("	<ul class=\"popupmenu_popup headermenu_popup\" id=\"mymenu_menu\" style=\"display: none\">\r\n");
	templateBuilder.Append("		<li><a href=\"");
	templateBuilder.Append(forumpath.ToString());
	templateBuilder.Append("mytopics.aspx\">我的主题</a></li>\r\n");
	templateBuilder.Append("		<li><a href=\"");
	templateBuilder.Append(forumpath.ToString());
	templateBuilder.Append("myposts.aspx\">我的帖子</a></li>\r\n");
	templateBuilder.Append("		<li><a href=\"");
	templateBuilder.Append(forumpath.ToString());
	templateBuilder.Append("search.aspx?posterid=current&type=digest\">我的精华</a></li>\r\n");
	templateBuilder.Append("		<li><a href=\"");
	templateBuilder.Append(forumpath.ToString());
	templateBuilder.Append("myattachment.aspx\">我的附件</a></li>\r\n");
	templateBuilder.Append("		<li><a href=\"");
	templateBuilder.Append(forumpath.ToString());
	templateBuilder.Append("usercpsubscribe.aspx\">我的收藏</a></li>\r\n");

	if (config.Enablespace==1)
	{

	templateBuilder.Append("		<li><a href=\"");
	templateBuilder.Append(forumpath.ToString());
	templateBuilder.Append("space/\">我的空间</a></li>\r\n");

	}	//end if


	if (config.Enablealbum==1)
	{

	templateBuilder.Append("		<li><a href=\"");
	templateBuilder.Append(forumpath.ToString());
	templateBuilder.Append("showalbumlist.aspx?uid=");
	templateBuilder.Append(userid.ToString());
	templateBuilder.Append("\">我的相册</a></li>\r\n");

	}	//end if


	if (config.Enablemall==1)
	{

	templateBuilder.Append("		<li><a href=\"");
	templateBuilder.Append(forumpath.ToString());
	templateBuilder.Append("usercpmygoods.aspx\">我的商品</a></li>\r\n");

	}	//end if

	templateBuilder.Append("    </ul>\r\n");

	}	//end if

	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("<div id=\"header\">\r\n");
	templateBuilder.Append("	<div class=\"wrap s_clear\">\r\n");
	templateBuilder.Append("		<h2><a href=\"");
	templateBuilder.Append(forumpath.ToString());
	templateBuilder.Append("index.aspx\" title=\"Discuz!NT|BBS|论坛\"><img src=\"");
	templateBuilder.Append(forumpath.ToString());
	templateBuilder.Append("templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/logo.gif\" alt=\"Discuz!NT|BBS|论坛\"/></a></h2>\r\n");

	if (headerad!="")
	{

	templateBuilder.Append("		<div id=\"ad_headerbanner\">");
	templateBuilder.Append(headerad.ToString());
	templateBuilder.Append("</div>\r\n");

	}	//end if

	templateBuilder.Append("		<ul id=\"menu\">\r\n");
	templateBuilder.Append("			");
	templateBuilder.Append(mainnavigation.ToString());
	templateBuilder.Append("\r\n");
	templateBuilder.Append("		</ul>\r\n");
	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("</div>\r\n");

	}
	else
	{


	Response.Clear();
	Response.ContentType = "Text/XML";
	Response.Expires = 0;
	Response.Cache.SetNoStore();
	
	templateBuilder.Append("<?xml version=\"1.0\" encoding=\"utf-8\"?><root><![CDATA[\r\n");

	}	//end if



	templateBuilder.Append("<!--header end-->\r\n");

	if (page_err==0)
	{

	templateBuilder.Append("<div id=\"foruminfo\">\r\n");
	templateBuilder.Append("	<div id=\"nav\">\r\n");
	templateBuilder.Append("		<a href=\"");
	templateBuilder.Append(config.Forumurl.ToString().Trim());
	templateBuilder.Append("\" class=\"home\">");
	templateBuilder.Append(config.Forumtitle.ToString().Trim());
	templateBuilder.Append("</a>  &raquo; <a href=\"usercp.aspx\">用户中心</a>  &raquo; <strong>我的商品</strong>\r\n");
	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("	<div id=\"headsearch\">\r\n");
	templateBuilder.Append("		<div id=\"search\">\r\n");

	templateBuilder.Append("	<form method=\"post\" action=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("search.aspx\" target=\"_blank\" onsubmit=\"bind_keyword(this);\" class=\"right\">\r\n");
	templateBuilder.Append("		<input type=\"hidden\" name=\"poster\" />\r\n");
	templateBuilder.Append("		<input type=\"hidden\" name=\"keyword\" />\r\n");
	templateBuilder.Append("		<input type=\"hidden\" name=\"type\" value=\"\" />\r\n");
	templateBuilder.Append("		<input id=\"keywordtype\" type=\"hidden\" name=\"keywordtype\" value=\"0\" />\r\n");
	templateBuilder.Append("		<a href=\"javascript:void(0);\" class=\"drop\" id=\"quicksearch\" onclick=\"showMenu(this.id, false);\" onmouseover=\"MouseCursor(this);\">快速搜索</a>\r\n");
	templateBuilder.Append("		<input type=\"text\" name=\"keywordf\" value=\"输入搜索关键字\" onblur=\"if(this.value=='')this.value=defaultValue\" onclick=\"if(this.value==this.defaultValue)this.value = ''\" onkeydown=\"if(this.value==this.defaultValue)this.value = ''\" class=\"txt\"/>\r\n");
	templateBuilder.Append("		<input name=\"searchsubmit\" type=\"submit\" value=\"\" class=\"btnsearch\"/>\r\n");
	templateBuilder.Append("	</form>\r\n");
	templateBuilder.Append("	<script type=\"text/javascript\">\r\n");
	templateBuilder.Append("	    function bind_keyword(form)\r\n");
	templateBuilder.Append("	    {\r\n");
	templateBuilder.Append("	        if (form.keywordtype.value == '8')\r\n");
	templateBuilder.Append("	        {\r\n");
	templateBuilder.Append("	            form.keyword.value = '';\r\n");
	templateBuilder.Append("	            form.poster.value = form.keywordf.value;\r\n");
	templateBuilder.Append("	        }\r\n");
	templateBuilder.Append("	        else\r\n");
	templateBuilder.Append("	        {\r\n");
	templateBuilder.Append("	            form.poster.value = '';\r\n");
	templateBuilder.Append("	            form.keyword.value = form.keywordf.value;\r\n");
	templateBuilder.Append("	            if (form.keywordtype.value == '2')\r\n");
	templateBuilder.Append("	                form.type.value = 'spacepost';\r\n");
	templateBuilder.Append("	            if (form.keywordtype.value == '3')\r\n");
	templateBuilder.Append("	                form.type.value = 'album';\r\n");
	templateBuilder.Append("	        }\r\n");
	templateBuilder.Append("	    }\r\n");
	templateBuilder.Append("	</");
	templateBuilder.Append("script>\r\n");


	templateBuilder.Append("		</div>\r\n");
	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("<!--主体-->\r\n");
	templateBuilder.Append("<div class=\"controlpannel\">\r\n");

	templateBuilder.Append("<div class=\"side\">\r\n");

	if (userid>0)
	{

	templateBuilder.Append("	<h2>个人中心</h2>\r\n");
	templateBuilder.Append("	<div class=\"sideinner\">\r\n");
	templateBuilder.Append("		<ul class=\"tabs\">\r\n");

	if (pagename=="usercptopic.aspx"||pagename=="usercppost.aspx"||pagename=="usercpdigest.aspx"||pagename=="usercpprofile.aspx"||pagename=="usercpnewpassword.aspx"||pagename=="usercppreference.aspx")
	{

	templateBuilder.Append("			<li><a href=\"usercpprofile.aspx\" class=\"current\"><span>个人设置</span></a></li>\r\n");

	}
	else
	{

	templateBuilder.Append("			<li><a href=\"usercpprofile.aspx\">个人设置</a></li>\r\n");

	}	//end if


	if (pagename=="usercpinbox.aspx"||pagename=="usercpsentbox.aspx"||pagename=="usercpdraftbox.aspx"||pagename=="usercppostpm.aspx"||pagename=="usercpshowpm.aspx"||pagename=="usercppmset.aspx")
	{

	templateBuilder.Append("		<li><a href=\"usercpinbox.aspx\" class=\"current\"><span>短消息</span></a></li>\r\n");

	}
	else
	{

	templateBuilder.Append("		<li><a href=\"usercpinbox.aspx\">短消息</a></li>\r\n");

	}	//end if


	if (config.Enablespace==1 && user.Spaceid>0)
	{


	if (pagename=="usercpspacepostblog.aspx"||pagename=="usercpspacemanageblog.aspx"||pagename=="usercpspaceeditblog.aspx"||pagename=="usercpspacelinklist.aspx"||pagename=="usercpspacelinkedit.aspx"||pagename=="usercpspacelinkadd.aspx"||pagename=="usercpspacecomment.aspx"||pagename=="usercpspacemanagecategory.aspx"||pagename=="usercpspacecategoryadd.aspx"||pagename=="usercpspacecategoryedit.aspx"||pagename=="usercpspacemanageattachment.aspx"||pagename=="usercpspaceset.aspx")
	{

	templateBuilder.Append("			<li><a href=\"usercpspacemanageblog.aspx\" class=\"current\"><span>");
	templateBuilder.Append(config.Spacename.ToString().Trim());
	templateBuilder.Append("管理</span></a></li>\r\n");

	}
	else
	{

	templateBuilder.Append("			<li><a href=\"usercpspacemanageblog.aspx\">");
	templateBuilder.Append(config.Spacename.ToString().Trim());
	templateBuilder.Append("管理</a></li>\r\n");

	}	//end if


	}	//end if


	if (config.Enablealbum==1)
	{


	if (pagename=="usercpspacemanagealbum.aspx"||pagename=="usercpspacemanagephoto.aspx"||pagename=="usercpspacephotoadd.aspx"||pagename=="usercpeditphoto.aspx")
	{

	templateBuilder.Append("			<li><a href=\"usercpspacemanagealbum.aspx\" class=\"current\"><span>");
	templateBuilder.Append(config.Albumname.ToString().Trim());
	templateBuilder.Append("管理</span></a></li>\r\n");

	}
	else
	{

	templateBuilder.Append("			<li><a href=\"usercpspacemanagealbum.aspx\">");
	templateBuilder.Append(config.Albumname.ToString().Trim());
	templateBuilder.Append("管理</a></li>\r\n");

	}	//end if


	}	//end if


	if (config.Enablemall>=1)
	{


	if (pagename=="usercpmygoods.aspx")
	{

	templateBuilder.Append("			<li><a href=\"usercpmygoods.aspx\" class=\"current\"><span>交易管理</span></a></li>\r\n");

	}
	else
	{

	templateBuilder.Append("			<li><a href=\"usercpmygoods.aspx\">交易管理</a></li>\r\n");

	}	//end if


	}	//end if


	if (config.Enablemall==2)
	{


	if (pagename=="usercpshopcategory.aspx")
	{

	templateBuilder.Append("			<li><a href=\"usercpshopcategory.aspx?item=shopcategory\" class=\"current\"><span>店铺管理</span></a></li>\r\n");

	}
	else
	{

	templateBuilder.Append("			<li><a href=\"usercpshopcategory.aspx?item=shopcategory\">店铺管理</a></li>\r\n");

	}	//end if


	}	//end if

	templateBuilder.Append("		</ul>\r\n");
	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("	<hr class=\"shadowline\"/>\r\n");
	templateBuilder.Append("	<div class=\"sideinner\">\r\n");
	templateBuilder.Append("		<ul class=\"tabs\">\r\n");

	if (pagename=="mytopics.aspx")
	{

	templateBuilder.Append("			<li><a href=\"mytopics.aspx\" class=\"current\"><span>我的主题</span></a></li>\r\n");

	}
	else
	{

	templateBuilder.Append("			<li><a href=\"mytopics.aspx\">我的主题</a></li>\r\n");

	}	//end if


	if (pagename=="myposts.aspx")
	{

	templateBuilder.Append("			<li><a href=\"myposts.aspx\" class=\"current\"><span>我的帖子</span></a></li>\r\n");

	}
	else
	{

	templateBuilder.Append("			<li><a href=\"myposts.aspx\">我的帖子</a></li>\r\n");

	}	//end if

	templateBuilder.Append("			<li><a href=\"search.aspx?posterid=current&type=digest\">我的精华</a></li>\r\n");

	if (pagename=="myattachment.aspx")
	{

	templateBuilder.Append("			<li><a href=\"myattachment.aspx\" class=\"current\"><span>我的附件</span></a></li>\r\n");

	}
	else
	{

	templateBuilder.Append("			<li><a href=\"myattachment.aspx\">我的附件</a></li>\r\n");

	}	//end if


	if (pagename=="usercpsubscribe.aspx")
	{

	templateBuilder.Append("			<li><a href=\"usercpsubscribe.aspx\" class=\"current\"><span>收藏夹</span></a></li>\r\n");

	}
	else
	{

	templateBuilder.Append("			<li><a href=\"usercpsubscribe.aspx\">收藏夹</a></li>\r\n");

	}	//end if

	templateBuilder.Append("		</ul>\r\n");
	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("	<hr class=\"shadowline\"/>\r\n");
	templateBuilder.Append("	<div class=\"sideinner\">\r\n");
	templateBuilder.Append("		<ul class=\"tabs\">\r\n");

	if (pagename=="usercpcreditspay.aspx"||pagename=="usercpcreditstransfer.aspx"||pagename=="usercpcreditspayoutlog.aspx"||pagename=="usercpcreditspayinlog.aspx"	   ||pagename=="usercpcreaditstransferlog.aspx")
	{

	templateBuilder.Append("			<li><a href=\"usercpcreditspay.aspx\" class=\"current\"><span>积分交易</span></a></li>\r\n");

	}
	else
	{

	templateBuilder.Append("			<li><a href=\"usercpcreditspay.aspx\">积分交易</a></li>\r\n");

	}	//end if


	if (pagename=="usercp.aspx")
	{

	templateBuilder.Append("			<li><a href=\"usercp.aspx\" class=\"current\"><span>用户组&权限</span></a></li>\r\n");

	}
	else
	{

	templateBuilder.Append("			<li><a href=\"usercp.aspx\">用户组&权限</a></li>\r\n");

	}	//end if

	templateBuilder.Append("		</ul>\r\n");
	templateBuilder.Append("	</div>\r\n");

	}	//end if

	templateBuilder.Append("</div>\r\n");


	templateBuilder.Append("	<div class=\"pannelcontent\">\r\n");
	templateBuilder.Append("		<div class=\"pcontent\">\r\n");
	templateBuilder.Append("			<div class=\"panneldetail\">\r\n");
	templateBuilder.Append("				<div class=\"panneltabs\">\r\n");
	templateBuilder.Append("				   <a href=\"usercpmygoods.aspx?item=tradestats\" \r\n");

	if (item=="tradestats")
	{

	templateBuilder.Append("class=\"current\"\r\n");

	}	//end if

	templateBuilder.Append(">交易统计</a>\r\n");
	templateBuilder.Append("				   <a id=\"buyergoods\" onMouseOver=\"showMenu(this.id);\" onMouseOut=\"showMenu(this.id);\" href=\"usercpmygoods.aspx?item=buytrade\" onclick=\"javascript:window.location.href=this.href;\"  class=\"\r\n");

	if (item=="buytrade")
	{

	templateBuilder.Append("current\r\n");

	}	//end if

	templateBuilder.Append(" dropmenu\">我是买家</a>\r\n");
	templateBuilder.Append("                   <a id=\"sellergoods\" onMouseOver=\"showMenu(this.id);\" onMouseOut=\"showMenu(this.id);\" href=\"usercpmygoods.aspx?item=selltrade\" onclick=\"javascript:window.location.href=this.href;\" class=\"\r\n");

	if (item=="selltrade")
	{

	templateBuilder.Append("current\r\n");

	}	//end if

	templateBuilder.Append(" dropmenu\">我是卖家</a>\r\n");
	templateBuilder.Append("                   <a href=\"eccredit.aspx?uid=");
	templateBuilder.Append(userid.ToString());
	templateBuilder.Append("\" target=\"_blank\">信用评价</a>\r\n");
	templateBuilder.Append("				</div>	\r\n");
	templateBuilder.Append("				<ul class=\"popupmenu_popup headermenu_popup\" id=\"buyergoods_menu\" style=\"display: none\">\r\n");
	templateBuilder.Append("		           <li><a href=\"usercpmygoods.aspx?item=buytrade\r\n");

	if (goodsidlist!="")
	{

	templateBuilder.Append("&goodsid=");
	templateBuilder.Append(goodsidlist.ToString());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("\">进行中的交易</a></li>\r\n");
	templateBuilder.Append("		           <li><a href=\"usercpmygoods.aspx?item=buytrade&filter=attention\r\n");

	if (goodsidlist!="")
	{

	templateBuilder.Append("&goodsid=");
	templateBuilder.Append(goodsidlist.ToString());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("\">关注的交易</a></li>\r\n");
	templateBuilder.Append("		           <li><a href=\"usercpmygoods.aspx?item=buytrade&filter=eccredit\r\n");

	if (goodsidlist!="")
	{

	templateBuilder.Append("&goodsid=");
	templateBuilder.Append(goodsidlist.ToString());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("\">评价的交易</a></li>\r\n");
	templateBuilder.Append("                   <li><a href=\"usercpmygoods.aspx?item=buytrade&filter=success\r\n");

	if (goodsidlist!="")
	{

	templateBuilder.Append("&goodsid=");
	templateBuilder.Append(goodsidlist.ToString());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("\">成功的交易</a></li>\r\n");
	templateBuilder.Append("		           <li><a href=\"usercpmygoods.aspx?item=buytrade&filter=refund\r\n");

	if (goodsidlist!="")
	{

	templateBuilder.Append("&goodsid=");
	templateBuilder.Append(goodsidlist.ToString());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("\">退款的交易</a></li>\r\n");
	templateBuilder.Append("		           <li><a href=\"usercpmygoods.aspx?item=buytrade&filter=closed\r\n");

	if (goodsidlist!="")
	{

	templateBuilder.Append("&goodsid=");
	templateBuilder.Append(goodsidlist.ToString());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("\">失败的交易</a></li>\r\n");
	templateBuilder.Append("		           <li><a href=\"usercpmygoods.aspx?item=buytrade&filter=unstart\r\n");

	if (goodsidlist!="")
	{

	templateBuilder.Append("&goodsid=");
	templateBuilder.Append(goodsidlist.ToString());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("\">未生效的交易</a></li>\r\n");
	templateBuilder.Append("		           <li><a href=\"usercpmygoods.aspx?item=buytrade&filter=all\r\n");

	if (goodsidlist!="")
	{

	templateBuilder.Append("&goodsid=");
	templateBuilder.Append(goodsidlist.ToString());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("\">全部交易</a></li>\r\n");
	templateBuilder.Append("                </ul>\r\n");
	templateBuilder.Append("              	<ul class=\"popupmenu_popup headermenu_popup\" id=\"sellergoods_menu\" style=\"display: none\">\r\n");
	templateBuilder.Append("		           <li><a href=\"usercpmygoods.aspx?item=selltrade\r\n");

	if (goodsidlist!="")
	{

	templateBuilder.Append("&goodsid=");
	templateBuilder.Append(goodsidlist.ToString());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("\">进行中的交易</a></li>\r\n");
	templateBuilder.Append("		           <li><a href=\"usercpmygoods.aspx?item=selltrade&filter=attention\r\n");

	if (goodsidlist!="")
	{

	templateBuilder.Append("&goodsid=");
	templateBuilder.Append(goodsidlist.ToString());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("\">关注的交易</a></li>\r\n");
	templateBuilder.Append("		           <li><a href=\"usercpmygoods.aspx?item=selltrade&filter=eccredit\r\n");

	if (goodsidlist!="")
	{

	templateBuilder.Append("&goodsid=");
	templateBuilder.Append(goodsidlist.ToString());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("\">评价的交易</a></li>\r\n");
	templateBuilder.Append("                   <li><a href=\"usercpmygoods.aspx?item=selltrade&filter=success\r\n");

	if (goodsidlist!="")
	{

	templateBuilder.Append("&goodsid=");
	templateBuilder.Append(goodsidlist.ToString());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("\">成功的交易</a></li>\r\n");
	templateBuilder.Append("		           <li><a href=\"usercpmygoods.aspx?item=selltrade&filter=refund\r\n");

	if (goodsidlist!="")
	{

	templateBuilder.Append("&goodsid=");
	templateBuilder.Append(goodsidlist.ToString());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("\">退款的交易</a></li>\r\n");
	templateBuilder.Append("		           <li><a href=\"usercpmygoods.aspx?item=selltrade&filter=closed\r\n");

	if (goodsidlist!="")
	{

	templateBuilder.Append("&goodsid=");
	templateBuilder.Append(goodsidlist.ToString());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("\">失败的交易</a></li>\r\n");
	templateBuilder.Append("		           <li><a href=\"usercpmygoods.aspx?item=selltrade&filter=unstart\r\n");

	if (goodsidlist!="")
	{

	templateBuilder.Append("&goodsid=");
	templateBuilder.Append(goodsidlist.ToString());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("\">未生效的交易</a></li>\r\n");
	templateBuilder.Append("		           <li><a href=\"usercpmygoods.aspx?item=selltrade&filter=all\r\n");

	if (goodsidlist!="")
	{

	templateBuilder.Append("&goodsid=");
	templateBuilder.Append(goodsidlist.ToString());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("\">全部交易</a></li>\r\n");
	templateBuilder.Append("		           <li><a href=\"usercpmygoods.aspx?item=selltrade&filter=onsell\r\n");

	if (goodsidlist!="")
	{

	templateBuilder.Append("&goodsid=");
	templateBuilder.Append(goodsidlist.ToString());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("\">出售中的商品</a></li>\r\n");
	templateBuilder.Append("		           <li><a href=\"usercpmygoods.aspx?item=selltrade&filter=allgoods\r\n");

	if (goodsidlist!="")
	{

	templateBuilder.Append("&goodsid=");
	templateBuilder.Append(goodsidlist.ToString());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("\">全部商品</a></li>\r\n");

	if (config.Enablemall==2)
	{

	templateBuilder.Append("                   <li><a href=\"postgoods.aspx\" target=\"_blank\">我要卖</a></li>\r\n");

	}	//end if

	templateBuilder.Append("                </ul>\r\n");
	templateBuilder.Append("                <div class=\"pannelbody\">\r\n");
	templateBuilder.Append("					<div class=\"pannellist mallcount\">\r\n");

	if (page_err==0)
	{


	if (ispost)
	{


	templateBuilder.Append("<div class=\"wrap s_clear\" id=\"wrap\">\r\n");
	templateBuilder.Append("<div class=\"main\">\r\n");
	templateBuilder.Append("	<div class=\"msgbox\">\r\n");
	templateBuilder.Append("		<h1>Discuz!NT Board 提示信息</h1>\r\n");
	templateBuilder.Append("		<p>");
	templateBuilder.Append(msgbox_text.ToString());
	templateBuilder.Append("</p>\r\n");

	if (msgbox_url!="")
	{

	templateBuilder.Append("		<p><a href=\"");
	templateBuilder.Append(msgbox_url.ToString());
	templateBuilder.Append("\">如果浏览器没有转向, 请点击这里.</a></p>\r\n");

	}	//end if

	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("</div>\r\n");



	}
	else
	{


	if (item=="tradestats")
	{

	templateBuilder.Append("	            <div class=\"tradestats\">\r\n");
	templateBuilder.Append("					<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\r\n");
	templateBuilder.Append("					<thead>\r\n");
	templateBuilder.Append("						<tr>\r\n");
	templateBuilder.Append("							<td colspan=\"2\">买家提醒区</td>\r\n");
	templateBuilder.Append("						</tr>\r\n");
	templateBuilder.Append("					</thead>\r\n");
	templateBuilder.Append("					<tbody>\r\n");
	templateBuilder.Append("						<tr>\r\n");
	templateBuilder.Append("							<th><a href=\"usercpmygoods.aspx?item=buytrade\">我买入的商品</a></th>\r\n");
	templateBuilder.Append("							<td>\r\n");

	if (tradestatisticinfo.Buyertrading>0)
	{

	templateBuilder.Append("								    <a href=\"usercpmygoods.aspx?item=buytrade\">您有 ");
	templateBuilder.Append(tradestatisticinfo.Buyertrading.ToString().Trim());
	templateBuilder.Append(" 个正在进行中的交易</a>\r\n");

	}	//end if


	if (tradestatisticinfo.Buyerattention>0)
	{

	templateBuilder.Append("								    <a href=\"usercpmygoods.aspx?item=buytrade&filter=attention\">您有 ");
	templateBuilder.Append(tradestatisticinfo.Buyerattention.ToString().Trim());
	templateBuilder.Append(" 个交易需要关注</a>\r\n");

	}	//end if


	if (tradestatisticinfo.Buyerrate>0)
	{

	templateBuilder.Append("								    <a href=\"usercpmygoods.aspx?item=buytrade&filter=eccredit\">您有 ");
	templateBuilder.Append(tradestatisticinfo.Buyerrate.ToString().Trim());
	templateBuilder.Append(" 个需要评价的交易</a> \r\n");

	}	//end if

	templateBuilder.Append("								<!--<br />\r\n");
	templateBuilder.Append("								<div class=\"lighttxt\" style=\"padding-left: 1em\">包括如下内容:<div style=\"padding-left: 2em\">2 个交易，等待您付款<br /></div></div>-->\r\n");
	templateBuilder.Append("							</td>\r\n");
	templateBuilder.Append("						</tr>\r\n");
	templateBuilder.Append("						<tr>\r\n");
	templateBuilder.Append("							<th><a href=\"usercpmygoods.aspx?item=buytrade&filter=unstart\" title=\"(您)买家确认但卖家未确认的交易\">未生效的交易</a></th>	\r\n");
	templateBuilder.Append("							<td></td>						\r\n");
	templateBuilder.Append("						</tr>\r\n");
	templateBuilder.Append("					</tbody>\r\n");
	templateBuilder.Append("					<thead>\r\n");
	templateBuilder.Append("						<tr>\r\n");
	templateBuilder.Append("							<td colspan=\"2\">卖家提醒区</td>\r\n");
	templateBuilder.Append("						</tr>\r\n");
	templateBuilder.Append("					</thead>\r\n");
	templateBuilder.Append("					<tbody>\r\n");
	templateBuilder.Append("						<tr>\r\n");
	templateBuilder.Append("							<th><a href=\"usercpmygoods.aspx?item=selltrade&filter=onsell\">出售中的商品</a></th>\r\n");
	templateBuilder.Append("							<td>\r\n");

	if (reccount>0)
	{

	templateBuilder.Append("							       <a href=\"usercpmygoods.aspx?item=selltrade&filter=onsell\">您有 ");
	templateBuilder.Append(reccount.ToString());
	templateBuilder.Append(" 个正在出售中的商品</a>\r\n");

	}
	else
	{

	templateBuilder.Append("							        您目前没有正在出售中的商品\r\n");

	}	//end if

	templateBuilder.Append("							</td>\r\n");
	templateBuilder.Append("						</tr>\r\n");
	templateBuilder.Append("						<tr>\r\n");
	templateBuilder.Append("							<th><a href=\"usercpmygoods.aspx?item=selltrade\">交易中的商品</a></th>\r\n");
	templateBuilder.Append("							<td>\r\n");

	if (tradestatisticinfo.Sellertrading>0)
	{

	templateBuilder.Append("								    <a href=\"usercpmygoods.aspx?item=selltrade\">您有 ");
	templateBuilder.Append(tradestatisticinfo.Sellertrading.ToString().Trim());
	templateBuilder.Append(" 个正在进行中的交易</a><br />\r\n");

	}	//end if


	if (tradestatisticinfo.Sellerattention>0)
	{

	templateBuilder.Append("								    <a href=\"usercpmygoods.aspx?item=selltrade&filter=attention\">您有 ");
	templateBuilder.Append(tradestatisticinfo.Sellerattention.ToString().Trim());
	templateBuilder.Append(" 个交易需要关注</a>\r\n");

	}	//end if


	if (tradestatisticinfo.Sellerrate>0)
	{

	templateBuilder.Append("								    <br /><a href=\"usercpmygoods.aspx?item=selltrade&filter=eccredit\">您有 ");
	templateBuilder.Append(tradestatisticinfo.Sellerrate.ToString().Trim());
	templateBuilder.Append(" 个需要评价的交易</a> \r\n");

	}	//end if

	templateBuilder.Append("						</td>\r\n");
	templateBuilder.Append("						</tr>\r\n");
	templateBuilder.Append("						<tr>\r\n");
	templateBuilder.Append("							<th><a href=\"usercpmygoods.aspx?item=selltrade&filter=unstart\" title=\"(您)卖家未确认的交易\">未生效的交易</a></th>	\r\n");
	templateBuilder.Append("							<td></td>				\r\n");
	templateBuilder.Append("						</tr>\r\n");
	templateBuilder.Append("					</tbody>\r\n");
	templateBuilder.Append("					<thead>\r\n");
	templateBuilder.Append("						<tr>\r\n");
	templateBuilder.Append("							<td colspan=\"2\">交易统计</td>\r\n");
	templateBuilder.Append("						</tr>\r\n");
	templateBuilder.Append("					</thead>\r\n");
	templateBuilder.Append("					<tbody>\r\n");
	templateBuilder.Append("						<tr>\r\n");
	templateBuilder.Append("							<td colspan=\"2\">售出商品总数: ");
	templateBuilder.Append(tradestatisticinfo.Sellnumbersum.ToString().Trim());
	templateBuilder.Append("<br />销售成交总额: ");
	templateBuilder.Append(tradestatisticinfo.Selltradesum.ToString().Trim());
	templateBuilder.Append(" 元 </td>\r\n");
	templateBuilder.Append("						</tr>\r\n");
	templateBuilder.Append("						<tr>\r\n");
	templateBuilder.Append("							<td colspan=\"2\">买入商品总数: ");
	templateBuilder.Append(tradestatisticinfo.Buynumbersum.ToString().Trim());
	templateBuilder.Append("<br />买入成交总额: ");
	templateBuilder.Append(tradestatisticinfo.Buytradesum.ToString().Trim());
	templateBuilder.Append(" 元 </td>\r\n");
	templateBuilder.Append("						</tr>\r\n");
	templateBuilder.Append("					</tbody>\r\n");
	templateBuilder.Append("					</table>\r\n");
	templateBuilder.Append("		    </div>\r\n");

	}
	else
	{

	templateBuilder.Append("                        <div class=\"shopsearch\">\r\n");
	templateBuilder.Append("                            <!--\r\n");
	templateBuilder.Append("                            <div class=\"mysearch\">\r\n");
	templateBuilder.Append("                                <input type=\"hidden\" id=\"item\" name=\"item\" value=\"");
	templateBuilder.Append(item.ToString());
	templateBuilder.Append("\">\r\n");
	templateBuilder.Append("                                <input type=\"hidden\" id=\"filter\" name=\"filter\" value=\"");
	templateBuilder.Append(filter.ToString());
	templateBuilder.Append("\">\r\n");
	templateBuilder.Append("                                商品名称<input class=\"colorblue\" value=\"\" name=\"srchkey\" size=\"27\" /><button class=\"lightbutton\" value=\"true\" type=\"submit\" name=\"submit\">搜索</button>\r\n");
	templateBuilder.Append("                            </div>\r\n");
	templateBuilder.Append("                            -->\r\n");
	templateBuilder.Append("                            <strong>我是\r\n");

	if (item=="buytrade")
	{

	templateBuilder.Append("买家\r\n");

	}	//end if


	if (item=="selltrade")
	{

	templateBuilder.Append("卖家\r\n");

	}	//end if

	templateBuilder.Append("                                 —— \r\n");

	if (filter=="")
	{

	templateBuilder.Append("进行中的交易\r\n");

	}	//end if


	if (filter=="attention")
	{

	templateBuilder.Append("进行中的交易\r\n");

	}	//end if


	if (filter=="eccredit")
	{

	templateBuilder.Append("评价的交易\r\n");

	}	//end if


	if (filter=="success")
	{

	templateBuilder.Append("成功的交易\r\n");

	}	//end if


	if (filter=="refund")
	{

	templateBuilder.Append("退款的交易\r\n");

	}	//end if


	if (filter=="closed")
	{

	templateBuilder.Append("失败的交易\r\n");

	}	//end if


	if (filter=="unstart")
	{

	templateBuilder.Append("未生效的交易\r\n");

	}	//end if


	if (filter=="all")
	{

	templateBuilder.Append("全部交易\r\n");

	}	//end if


	if (filter=="onsell")
	{

	templateBuilder.Append("出售中的商品\r\n");

	}	//end if


	if (filter=="allgoods")
	{

	templateBuilder.Append("全部商品\r\n");

	}	//end if

	templateBuilder.Append("                            </strong>\r\n");
	templateBuilder.Append("                        </div>\r\n");

	if (filter=="allgoods" || filter=="onsell")
	{

	templateBuilder.Append("                    <form id=\"goodslist\" name=\"goodslist\" method=\"post\" action=\"\">\r\n");
	templateBuilder.Append("                        <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n");
	templateBuilder.Append("                        <script type=\"text/javascript\">\r\n");
	templateBuilder.Append("	                        function checkGoodsBox(form,objtag)	{\r\n");
	templateBuilder.Append("		                        for(var i = 0; i < form.elements.length; i++) {\r\n");
	templateBuilder.Append("			                        var e = form.elements[i];\r\n");
	templateBuilder.Append("			                        if(e.name == \"goodsid\") {\r\n");
	templateBuilder.Append("				                        e.checked = objtag.checked;\r\n");
	templateBuilder.Append("			                        }\r\n");
	templateBuilder.Append("		                        }\r\n");
	templateBuilder.Append("		                        objtag.checked = !objtag.checked;\r\n");
	templateBuilder.Append("	                        }\r\n");
	templateBuilder.Append("                        </");
	templateBuilder.Append("script>                    \r\n");
	templateBuilder.Append("                            <thead>\r\n");
	templateBuilder.Append("                                <tr>\r\n");
	templateBuilder.Append("                                    <th colspan=\"3\">商品名称</th>\r\n");
	templateBuilder.Append("                                    <th>查看交易</th>\r\n");

	if (filter=="allgoods")
	{

	templateBuilder.Append("                                    <th>上架</th> \r\n");
	templateBuilder.Append("                                    <th>关闭</th> \r\n");

	}	//end if

	templateBuilder.Append("                                    <th>售出数</th>\r\n");
	templateBuilder.Append("                                    <th>库存数</th>\r\n");
	templateBuilder.Append("                                    <th>销售额(元)</th>\r\n");
	templateBuilder.Append("                                    <th>最后交易</th>\r\n");
	templateBuilder.Append("                                </tr>\r\n");
	templateBuilder.Append("                            </thead>\r\n");
	templateBuilder.Append("                            <!--NtGoodsList start-->\r\n");

	int goodsinfo__loop__id=0;
	foreach(Goodsinfo goodsinfo in goodslist)
	{
		goodsinfo__loop__id++;

	templateBuilder.Append("		                    <tbody>\r\n");
	templateBuilder.Append("                                <tr class=\"messagetable\" onmouseover=\"this.className='messagetableon'\" onmouseout=\"this.className='messagetable'\">\r\n");
	 aspxrewriteurl = this.ShowGoodsAspxRewrite(goodsinfo.Goodsid);
	
	templateBuilder.Append("                                    <td style=\"width: 30px;\"><input name=\"goodsid\" type=\"checkbox\" id=\"goodsid_");
	templateBuilder.Append(goodsinfo.Goodsid.ToString().Trim());
	templateBuilder.Append("\" value=\"");
	templateBuilder.Append(goodsinfo.Goodsid.ToString().Trim());
	templateBuilder.Append("\" style=\"margin-top:8px;\"/></td>\r\n");
	templateBuilder.Append("                                    <td style=\"width: 120px; padding:2px 0;\"><a href=\"");
	templateBuilder.Append(aspxrewriteurl.ToString());
	templateBuilder.Append("\" target=\"_blank\">\r\n");
	templateBuilder.Append("                                        <a href=\"");
	templateBuilder.Append(aspxrewriteurl.ToString());
	templateBuilder.Append("\" target=\"_blank\">\r\n");

	if (goodsinfo.Goodspic=="")
	{

	templateBuilder.Append("				                            <img width=\"80\" src=\"templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/NoPhoto.jpg\" onerror=\"this.onerror=null;this.src='");
	templateBuilder.Append(goodsinfo.Goodspic.ToString().Trim());
	templateBuilder.Append("';\"  title=\"");
	templateBuilder.Append(goodsinfo.Title.ToString().Trim());
	templateBuilder.Append("\">\r\n");

	}
	else
	{

	templateBuilder.Append("				                            <img width=\"80\" src=\"upload/");
	templateBuilder.Append(goodsinfo.Goodspic.ToString().Trim());
	templateBuilder.Append("\" onerror=\"this.onerror=null;this.src='");
	templateBuilder.Append(goodsinfo.Goodspic.ToString().Trim());
	templateBuilder.Append("';\"  title=\"");
	templateBuilder.Append(goodsinfo.Title.ToString().Trim());
	templateBuilder.Append("\">\r\n");

	}	//end if

	templateBuilder.Append("                                        </a>\r\n");
	templateBuilder.Append("                                    </td>\r\n");
	templateBuilder.Append("                                    <td style=\"text-align: left;\"><a href=\"");
	templateBuilder.Append(aspxrewriteurl.ToString());
	templateBuilder.Append("\" target=\"_blank\">");
	templateBuilder.Append(goodsinfo.Title.ToString().Trim());
	templateBuilder.Append("</a> <a href=\"editgoods.aspx?goodsid=");
	templateBuilder.Append(goodsinfo.Goodsid.ToString().Trim());
	templateBuilder.Append("\" target=\"_blank\">[编辑]</a></td>\r\n");
	templateBuilder.Append("                                    <td><a href=\"usercpmygoods.aspx?item=selltrade&goodsid=");
	templateBuilder.Append(goodsinfo.Goodsid.ToString().Trim());
	templateBuilder.Append("\" target=\"_blank\">进入</td>\r\n");

	if (filter=="allgoods")
	{


	if (goodsinfo.Displayorder>=0)
	{

	templateBuilder.Append("                                            <td>已上架</td>\r\n");

	}
	else
	{

	templateBuilder.Append("                                            <td>未上架</td>\r\n");

	}	//end if


	if (goodsinfo.Closed==1)
	{

	templateBuilder.Append("                                            <td>已关闭</td>\r\n");

	}
	else
	{

	templateBuilder.Append("                                            <td>未关闭</td>\r\n");

	}	//end if


	}	//end if

	templateBuilder.Append("                                    <td>");
	templateBuilder.Append(goodsinfo.Totalitems.ToString().Trim());
	templateBuilder.Append("</td>\r\n");
	templateBuilder.Append("                                    <td class=\"fontfamily\">");
	templateBuilder.Append(goodsinfo.Amount.ToString().Trim());
	templateBuilder.Append("</td>\r\n");
	templateBuilder.Append("                                    <td>");
	templateBuilder.Append(goodsinfo.Tradesum.ToString().Trim());
	templateBuilder.Append("</td>\r\n");
	templateBuilder.Append("                                    <td>\r\n");

	if (goodsinfo.Lastbuyer!="")
	{

	templateBuilder.Append("                                        ");
	templateBuilder.Append(goodsinfo.Lasttrade.ToString().Trim());
	templateBuilder.Append("<br/>\r\n");
	templateBuilder.Append("                                        by <a href=\"userinfo.aspx?username=");
	templateBuilder.Append(goodsinfo.Lastbuyer.ToString().Trim());
	templateBuilder.Append("\">");
	templateBuilder.Append(goodsinfo.Lastbuyer.ToString().Trim());
	templateBuilder.Append("</a>\r\n");

	}
	else
	{

	templateBuilder.Append("                                            暂无交易\r\n");

	}	//end if

	templateBuilder.Append("                                    </td>\r\n");
	templateBuilder.Append("                                </tr>\r\n");
	templateBuilder.Append("                            </tbody>\r\n");
	templateBuilder.Append("                            <!--NtGoodsList end-->                         \r\n");

	}	//end loop

	templateBuilder.Append("                     </table>      \r\n");
	templateBuilder.Append("					 </form>\r\n");
	templateBuilder.Append("					 <div class=\"pannelmessage\">\r\n");
	templateBuilder.Append("							<div class=\"pannelleft\" style=\"width: 160px;\">\r\n");
	templateBuilder.Append("								<a href=\"javascript:;\"  onclick=\"checkGoodsBox($('goodslist'),this)\" checked=\"true\" class=\"selectall\">全选</a>&nbsp;&nbsp;&nbsp;\r\n");
	templateBuilder.Append("								<input type=\"hidden\" id=\"operation\" name=\"operation\" value=\"deletegoods\">\r\n");
	templateBuilder.Append("								<a href=\"###\" onclick=\"$('operation').value = 'deletegoods';$('goodslist').submit();\" class=\"selectall\">删除</a> \r\n");
	templateBuilder.Append("								<!--\r\n");
	templateBuilder.Append("								<a href=\"###\" onclick=\"$('goodslist').submit()\" class=\"selectall\">上架</a>\r\n");
	templateBuilder.Append("								<a href=\"###\" onclick=\"$('goodslist').submit()\" class=\"selectall\">下架</a>-->\r\n");
	templateBuilder.Append("							</div>\r\n");
	templateBuilder.Append("					 </div>\r\n");

	}	//end if


	if (istradeloglist)
	{

	templateBuilder.Append("	                 <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n");
	templateBuilder.Append("		                    <thead>\r\n");
	templateBuilder.Append("                                <tr>\r\n");
	templateBuilder.Append("                                    <th colspan=\"2\">商品名称</th>\r\n");
	templateBuilder.Append("                                    <th>\r\n");

	if (item=="buytrade")
	{

	templateBuilder.Append("卖家\r\n");

	}	//end if


	if (item=="selltrade")
	{

	templateBuilder.Append("买家\r\n");

	}	//end if

	templateBuilder.Append("</th>\r\n");
	templateBuilder.Append("                                    <th>交易金额（元）</th>\r\n");
	templateBuilder.Append("                                    <th>交易状态</th>\r\n");

	if (isshowrate)
	{

	templateBuilder.Append("                                    <th>信用评价</th>\r\n");

	}	//end if

	templateBuilder.Append("                                </tr>\r\n");
	templateBuilder.Append("                            </thead>\r\n");

	int __mygoodstradelog__loop__id=0;
	foreach(DataRow __mygoodstradelog in goodstradeloglist.Rows)
	{
		__mygoodstradelog__loop__id++;

	templateBuilder.Append("		                    <!--NtTradeLogList start-->\r\n");
	templateBuilder.Append("		                    <tbody>\r\n");
	templateBuilder.Append("                                <tr class=\"messagetable\" onmouseover=\"this.className='messagetableon'\" onmouseout=\"this.className='messagetable'\">\r\n");
	 aspxrewriteurl = this.ShowGoodsAspxRewrite(__mygoodstradelog["goodsid"].ToString().Trim());
	
	templateBuilder.Append("                                    <td style=\"width: 120px;vertical-align:middle;\">\r\n");
	templateBuilder.Append("                                        <a href=\"");
	templateBuilder.Append(aspxrewriteurl.ToString());
	templateBuilder.Append("\" target=\"_blank\">\r\n");

	if (__mygoodstradelog["goodspic"].ToString().Trim()=="")
	{

	templateBuilder.Append("				                            <img src=\"templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/NoPhoto.jpg\" width=\"80\" onerror=\"this.onerror=null;this.src='" + __mygoodstradelog["goodspic"].ToString().Trim() + "';\"  title=\"" + __mygoodstradelog["title"].ToString().Trim() + "\" style=\"margin-top:2px;\">\r\n");

	}
	else
	{

	templateBuilder.Append("				                            <img src=\"upload/" + __mygoodstradelog["goodspic"].ToString().Trim() + "\" width=\"80\" onerror=\"this.onerror=null;this.src='" + __mygoodstradelog["goodspic"].ToString().Trim() + "';\"  title=\"" + __mygoodstradelog["title"].ToString().Trim() + "\" style=\"margin-top:2px;\">\r\n");

	}	//end if

	templateBuilder.Append("                                        </a>\r\n");
	templateBuilder.Append("                                    </td>\r\n");
	templateBuilder.Append("                                    <td style=\"text-align: left;\"><a href=\"");
	templateBuilder.Append(aspxrewriteurl.ToString());
	templateBuilder.Append("\" target=\"_blank\">" + __mygoodstradelog["title"].ToString().Trim() + "</a></td>\r\n");
	templateBuilder.Append("                                    <td>\r\n");

	if (item=="buytrade")
	{

	 aspxrewriteurl = this.UserInfoAspxRewrite(__mygoodstradelog["sellerid"].ToString().Trim());
	
	templateBuilder.Append("                                            <a href=\"");
	templateBuilder.Append(aspxrewriteurl.ToString());
	templateBuilder.Append("\" target=\"_blank\">" + __mygoodstradelog["seller"].ToString().Trim() + "</a>\r\n");

	}	//end if


	if (item=="selltrade")
	{

	 aspxrewriteurl = this.UserInfoAspxRewrite(__mygoodstradelog["buyerid"].ToString().Trim());
	
	templateBuilder.Append("                                            <a href=\"");
	templateBuilder.Append(aspxrewriteurl.ToString());
	templateBuilder.Append("\" target=\"_blank\">" + __mygoodstradelog["buyer"].ToString().Trim() + "</a>\r\n");

	}	//end if

	templateBuilder.Append("                                    </td>\r\n");
	templateBuilder.Append("                                    <td class=\"fontfamily\">" + __mygoodstradelog["tradesum"].ToString().Trim() + "</td>   \r\n");
	templateBuilder.Append("                                    <td>\r\n");
	templateBuilder.Append("                                        <a href=\"\r\n");

	if (__mygoodstradelog["offline"].ToString().Trim()=="1")
	{

	templateBuilder.Append("offlinetrade\r\n");

	}
	else
	{

	templateBuilder.Append("onlinetrade\r\n");

	}	//end if

	templateBuilder.Append(".aspx?goodstradelogid=" + __mygoodstradelog["id"].ToString().Trim() + "\" target=\"_blank\">	\r\n");

	if (__mygoodstradelog["status"].ToString().Trim()=="0")
	{

	templateBuilder.Append("				                            未生效的交易\r\n");

	}	//end if


	if (__mygoodstradelog["status"].ToString().Trim()=="1")
	{

	templateBuilder.Append("				                            等待买家付款\r\n");

	}	//end if


	if (__mygoodstradelog["status"].ToString().Trim()=="2")
	{

	templateBuilder.Append("				                            交易已创建, 等待卖家确认\r\n");

	}	//end if


	if (__mygoodstradelog["status"].ToString().Trim()=="3")
	{

	templateBuilder.Append("				                            确认买家付款中,暂勿发货\r\n");

	}	//end if


	if (__mygoodstradelog["status"].ToString().Trim()=="4")
	{

	templateBuilder.Append("			                                买家已付款,等待卖家发货\r\n");

	}	//end if


	if (__mygoodstradelog["status"].ToString().Trim()=="5")
	{

	templateBuilder.Append("			                                卖家已发货,买家确认中\r\n");

	}	//end if


	if (__mygoodstradelog["status"].ToString().Trim()=="6")
	{

	templateBuilder.Append("			                                买家确认收到货,等待支付宝打款给卖家\r\n");

	}	//end if


	if (__mygoodstradelog["status"].ToString().Trim()=="7")
	{

	templateBuilder.Append("			                                交易成功结束\r\n");

	}	//end if


	if (__mygoodstradelog["status"].ToString().Trim()=="8")
	{

	templateBuilder.Append("			                                交易中途关闭(未完成)\r\n");

	}	//end if


	if (__mygoodstradelog["status"].ToString().Trim()=="10")
	{

	templateBuilder.Append("			                                等待卖家同意退款\r\n");

	}	//end if


	if (__mygoodstradelog["status"].ToString().Trim()=="11")
	{

	templateBuilder.Append("			                                卖家拒绝买家条件，等待买家修改条件\r\n");

	}	//end if


	if (__mygoodstradelog["status"].ToString().Trim()=="12")
	{

	templateBuilder.Append("			                                卖家同意退款，等待买家退货\r\n");

	}	//end if


	if (__mygoodstradelog["status"].ToString().Trim()=="13")
	{

	templateBuilder.Append("			                                等待卖家收货\r\n");

	}	//end if


	if (__mygoodstradelog["status"].ToString().Trim()=="17")
	{

	templateBuilder.Append("			                                退款成功\r\n");

	}	//end if

	templateBuilder.Append("</a>\r\n");
	templateBuilder.Append("                                        <p class=\"fontfamily\">" + __mygoodstradelog["lastupdate"].ToString().Trim() + "</p>\r\n");
	templateBuilder.Append("                                    </td>\r\n");
	templateBuilder.Append("                                     <td> \r\n");

	if (isshowrate)
	{


	if (__mygoodstradelog["ratestatus"].ToString().Trim()=="0")
	{

	templateBuilder.Append("                                          <a href =\"goodsrate.aspx?goodstradelogid=" + __mygoodstradelog["id"].ToString().Trim() + "\" target=\"_blank\">评价</a>\r\n");

	}	//end if


	if (item=="selltrade" && __mygoodstradelog["ratestatus"].ToString().Trim()=="1")
	{

	templateBuilder.Append("                                          等待对方评价\r\n");

	}
	else
	{


	if (item=="buytrade" && __mygoodstradelog["ratestatus"].ToString().Trim()=="2")
	{

	templateBuilder.Append("                                            等待对方评价\r\n");

	}	//end if


	}	//end if


	if (item=="selltrade" && __mygoodstradelog["ratestatus"].ToString().Trim()=="2")
	{

	templateBuilder.Append("                                          对方已评<BR /><a href =\"goodsrate.aspx?goodstradelogid=" + __mygoodstradelog["id"].ToString().Trim() + "\" target=\"_blank\">评价</a>\r\n");

	}
	else
	{


	if (item=="buytrade" && __mygoodstradelog["ratestatus"].ToString().Trim()=="1")
	{

	templateBuilder.Append("                                            对方已评<BR /><a href =\"goodsrate.aspx?goodstradelogid=" + __mygoodstradelog["id"].ToString().Trim() + "\" target=\"_blank\">评价</a>\r\n");

	}	//end if


	}	//end if


	if (__mygoodstradelog["ratestatus"].ToString().Trim()=="3")
	{

	templateBuilder.Append("                                          双方已评\r\n");

	}	//end if


	}	//end if

	templateBuilder.Append("                                     </td>\r\n");
	templateBuilder.Append("                                </tr>\r\n");
	templateBuilder.Append("                            </tbody>\r\n");
	templateBuilder.Append("                            <!--NtTradeLogList end-->\r\n");

	}	//end loop

	templateBuilder.Append("		                </table>\r\n");

	}	//end if

	templateBuilder.Append("						<div class=\"pages_btns\" style=\"margin-top:10px;\">\r\n");
	templateBuilder.Append("							<div class=\"pages\">\r\n");
	templateBuilder.Append("								<em>");
	templateBuilder.Append(pageid.ToString());
	templateBuilder.Append("/");
	templateBuilder.Append(pagecount.ToString());
	templateBuilder.Append("页</em>");
	templateBuilder.Append(pagenumbers.ToString());
	templateBuilder.Append("\r\n");
	templateBuilder.Append("								<kbd>跳转<input name=\"gopage\" type=\"text\" id=\"gopage\" onKeyDown=\"if(event.keyCode==13) { window.location='usercpmygoods.aspx?item=");
	templateBuilder.Append(item.ToString());
	templateBuilder.Append("&filter=");
	templateBuilder.Append(filter.ToString());
	templateBuilder.Append("&page=' + (parseInt(this.value) > 0 ? parseInt(this.value) : 1);}\" size=\"4\" maxlength=\"9\"/>页</kbd>\r\n");
	templateBuilder.Append("							</div>\r\n");
	templateBuilder.Append("						</div>\r\n");

	}	//end if

	templateBuilder.Append("                    </div>\r\n");
	templateBuilder.Append("                </div>\r\n");
	templateBuilder.Append("			</div>\r\n");

	}	//end if


	}	//end if

	templateBuilder.Append("		</div>\r\n");
	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("<!--主体-->\r\n");

	}
	else
	{


	templateBuilder.Append("<div class=\"wrap s_clear\" id=\"wrap\">\r\n");
	templateBuilder.Append("<div class=\"main\">\r\n");
	templateBuilder.Append("	<div class=\"msgbox error_msg\">\r\n");
	templateBuilder.Append("		<h1>出现了");
	templateBuilder.Append(page_err.ToString());
	templateBuilder.Append("个错误</h1>\r\n");
	templateBuilder.Append("		<p>");
	templateBuilder.Append(msgbox_text.ToString());
	templateBuilder.Append("</p>\r\n");
	templateBuilder.Append("		<p class=\"errorback\">\r\n");
	templateBuilder.Append("			<script type=\"text/javascript\">\r\n");
	templateBuilder.Append("				if(");
	templateBuilder.Append(msgbox_showbacklink.ToString());
	templateBuilder.Append(")\r\n");
	templateBuilder.Append("				{\r\n");
	templateBuilder.Append("					document.write(\"<a href=\\\"");
	templateBuilder.Append(msgbox_backlink.ToString());
	templateBuilder.Append("\\\">返回上一步</a> &nbsp; &nbsp;|&nbsp; &nbsp  \");\r\n");
	templateBuilder.Append("				}\r\n");
	templateBuilder.Append("			</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("			<a href=\"forumindex.aspx\">论坛首页</a>\r\n");

	if (usergroupid==7)
	{

	templateBuilder.Append("			 &nbsp; &nbsp|&nbsp; &nbsp; <a href=\"register.aspx\">注册</a>\r\n");

	}	//end if

	templateBuilder.Append("		</p>\r\n");
	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("</div>\r\n");



	}	//end if



	if (infloat!=1)
	{


	if (footerad!="")
	{

	templateBuilder.Append("<div id=\"ad_footerbanner\">");
	templateBuilder.Append(footerad.ToString());
	templateBuilder.Append("</div>\r\n");

	}	//end if

	templateBuilder.Append("<div id=\"footer\">\r\n");
	templateBuilder.Append("	<div class=\"wrap\">\r\n");
	templateBuilder.Append("		<div id=\"footlinks\">\r\n");
	templateBuilder.Append("			<p><a href=\"");
	templateBuilder.Append(config.Weburl.ToString().Trim());
	templateBuilder.Append("\" target=\"_blank\">");
	templateBuilder.Append(config.Webtitle.ToString().Trim());
	templateBuilder.Append("</a> - ");
	templateBuilder.Append(config.Linktext.ToString().Trim());
	templateBuilder.Append(" - <a target=\"_blank\" href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("stats.aspx\">统计</a> - \r\n");

	if (config.Sitemapstatus==1)
	{

	templateBuilder.Append("&nbsp;<a href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("tools/sitemap.aspx\" target=\"_blank\" title=\"百度论坛收录协议\">Sitemap</a>\r\n");

	}	//end if

	templateBuilder.Append("			");
	templateBuilder.Append(config.Statcode.ToString().Trim());
	templateBuilder.Append(config.Icp.ToString().Trim());
	templateBuilder.Append("\r\n");
	templateBuilder.Append("			</p>\r\n");
	templateBuilder.Append("			<div>\r\n");
	templateBuilder.Append("				<a href=\"http://www.comsenz.com/\" target=\"_blank\">Comsenz Technology Ltd</a>\r\n");
	templateBuilder.Append("				- <a href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("archiver/index.aspx\" target=\"_blank\">简洁版本</a>\r\n");

	if (config.Stylejump==1)
	{


	if (userid!=-1 || config.Guestcachepagetimeout<=0)
	{

	templateBuilder.Append("				- <span id=\"styleswitcher\" class=\"drop\" onmouseover=\"showMenu(this.id)\" onclick=\"window.location.href='");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("showtemplate.aspx'\">界面风格</span>\r\n");
	templateBuilder.Append("				<ul id=\"styleswitcher_menu\" class=\"popupmenu_popup s_clear\" style=\"display: none;\">\r\n");
	templateBuilder.Append("				");
	templateBuilder.Append(templatelistboxoptions.ToString());
	templateBuilder.Append("\r\n");
	templateBuilder.Append("				</ul>\r\n");

	}	//end if


	}	//end if

	templateBuilder.Append("				- <span class=\"scrolltop\" onclick=\"window.scrollTo(0,0);\">TOP</span>\r\n");
	templateBuilder.Append("			</div>\r\n");
	templateBuilder.Append("		</div>\r\n");
	templateBuilder.Append("		<a title=\"Powered by Discuz!NT\" target=\"_blank\" href=\"http://nt.discuz.net\"><img border=\"0\" alt=\"Discuz!NT\" src=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/discuznt_logo.gif\"/></a>\r\n");
	templateBuilder.Append("		<p id=\"copyright\">\r\n");
	templateBuilder.Append("			Powered by <strong><a href=\"http://nt.discuz.net\" target=\"_blank\" title=\"Discuz!NT 3.0.0 (.NET Framework 2.0/3.x)\">Discuz!NT</a></strong> <em class=\"f_bold\">3.0.0</em>\r\n");

	if (config.Licensed==1)
	{

	templateBuilder.Append("				(<a href=\"\" onclick=\"this.href='http://nt.discuz.net/certificate/?host='+location.href.substring(0, location.href.lastIndexOf('/'))\" target=\"_blank\">Licensed</a>)\r\n");

	}	//end if

	templateBuilder.Append("				");
	templateBuilder.Append(config.Forumcopyright.ToString().Trim());
	templateBuilder.Append("\r\n");
	templateBuilder.Append("		</p>\r\n");
	templateBuilder.Append("		<p id=\"debuginfo\" class=\"grayfont\">\r\n");

	if (config.Debug!=0)
	{

	templateBuilder.Append("			Processed in ");
	templateBuilder.Append(this.Processtime.ToString().Trim());
	templateBuilder.Append(" second(s)\r\n");

	if (isguestcachepage==1)
	{

	templateBuilder.Append("				(Cached).\r\n");

	}
	else if (querycount>1)
	{

	templateBuilder.Append("				 , ");
	templateBuilder.Append(querycount.ToString());
	templateBuilder.Append(" queries.\r\n");

	}
	else
	{

	templateBuilder.Append("				        , ");
	templateBuilder.Append(querycount.ToString());
	templateBuilder.Append(" query.\r\n");

	}	//end if


	}	//end if

	templateBuilder.Append("		</p>\r\n");
	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("<ul id=\"quicksearch_menu\" class=\"popupmenu_popup\" style=\"display: none;\">\r\n");
	templateBuilder.Append("	<li onclick=\"document.getElementById('keywordtype').value='0';document.getElementById('quicksearch').innerHTML='帖子标题';document.getElementById('quicksearch_menu').style.display='none';\" onmouseover=\"MouseCursor(this);\">帖子标题</li>\r\n");

	if (config.Enablespace==1)
	{

	templateBuilder.Append("	<li onclick=\"document.getElementById('keywordtype').value='2';document.getElementById('quicksearch').innerHTML='空间日志';document.getElementById('quicksearch_menu').style.display='none';\" onmouseover=\"MouseCursor(this);\">空间日志</li>\r\n");

	}	//end if


	if (config.Enablealbum==1)
	{

	templateBuilder.Append("	<li onclick=\"document.getElementById('keywordtype').value='3';document.getElementById('quicksearch').innerHTML='相册标题';document.getElementById('quicksearch_menu').style.display='none';\" onmouseover=\"MouseCursor(this);\">相册标题</li>\r\n");

	}	//end if

	templateBuilder.Append("	<li onclick=\"document.getElementById('keywordtype').value='8';document.getElementById('quicksearch').innerHTML='作者';document.getElementById('quicksearch_menu').style.display='none';\" onmouseover=\"MouseCursor(this);\">作者</li>\r\n");
	templateBuilder.Append("</ul>\r\n");
	templateBuilder.Append("<ul class=\"popupmenu_popup\" id=\"viewpro_menu\" style=\"display: none\">\r\n");
	templateBuilder.Append("	<li style=\"text-align:center;\"><img src=\"");
	templateBuilder.Append(useravatar.ToString());
	templateBuilder.Append("\" onerror=\"this.onerror=null;this.src='templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/noavatar_small.gif';\" /></li>\r\n");
	 aspxrewriteurl = this.UserInfoAspxRewrite(userid);
	
	templateBuilder.Append("	<li class=\"popuser\"><a href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append(aspxrewriteurl.ToString());
	templateBuilder.Append("\">我的资料</a></li>\r\n");

	if (config.Enablespace==1)
	{

	templateBuilder.Append("	<li class=\"poplink\"><a href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append(spaceurl.ToString());
	templateBuilder.Append("space/\">我的空间</a></li>\r\n");

	}	//end if

	templateBuilder.Append("</ul>\r\n");

	int prentid__loop__id=0;
	foreach(string prentid in mainnavigationhassub)
	{
		prentid__loop__id++;

	templateBuilder.Append("<ul class=\"popupmenu_popup headermenu_popup\" id=\"menu_");
	templateBuilder.Append(prentid.ToString());
	templateBuilder.Append("_menu\" style=\"display: none\">\r\n");

	int subnav__loop__id=0;
	foreach(DataRow subnav in subnavigation.Rows)
	{
		subnav__loop__id++;

	bool isoutput = false;
	

	if (subnav["parentid"].ToString().Trim()==prentid)
	{


	if (subnav["level"].ToString().Trim()=="0")
	{

	 isoutput = true;
	

	}
	else
	{


	if (subnav["level"].ToString().Trim()=="1" && userid!=-1)
	{

	 isoutput = true;
	

	}
	else
	{

	bool leveluseradmindi = true;
	
	 leveluseradmindi = (useradminid==3 || useradminid==1 || useradminid==2);
	

	if (subnav["level"].ToString().Trim()=="2" &&  leveluseradmindi)
	{

	 isoutput = true;
	

	}	//end if


	if (subnav["level"].ToString().Trim()=="3" && useradminid==1)
	{

	 isoutput = true;
	

	}	//end if


	}	//end if


	}	//end if


	}	//end if


	if (isoutput)
	{


	if (subnav["id"].ToString().Trim()=="11" || subnav["id"].ToString().Trim()=="12")
	{


	if (config.Statstatus==1)
	{

	templateBuilder.Append("	" + subnav["nav"].ToString().Trim() + "\r\n");
	continue;


	}
	else
	{

	continue;


	}	//end if


	}	//end if


	if (subnav["id"].ToString().Trim()=="18")
	{


	if (config.Oltimespan>0)
	{

	templateBuilder.Append("    " + subnav["nav"].ToString().Trim() + "\r\n");
	continue;


	}
	else
	{

	continue;


	}	//end if


	}	//end if


	if (subnav["id"].ToString().Trim()=="24")
	{


	if (config.Enablespace==1)
	{

	templateBuilder.Append("    " + subnav["nav"].ToString().Trim() + "\r\n");
	continue;


	}
	else
	{

	continue;


	}	//end if


	}	//end if


	if (subnav["id"].ToString().Trim()=="25")
	{


	if (config.Enablealbum==1)
	{

	templateBuilder.Append("    " + subnav["nav"].ToString().Trim() + "\r\n");
	continue;


	}
	else
	{

	continue;


	}	//end if


	}	//end if


	if (subnav["id"].ToString().Trim()=="26")
	{


	if (config.Enablemall>=1)
	{

	templateBuilder.Append("    " + subnav["nav"].ToString().Trim() + "\r\n");
	continue;


	}
	else
	{

	continue;


	}	//end if


	}	//end if

	templateBuilder.Append("    " + subnav["nav"].ToString().Trim() + "\r\n");

	}	//end if


	}	//end loop

	templateBuilder.Append("</ul>\r\n");

	}	//end loop




	templateBuilder.Append("</body>\r\n");
	templateBuilder.Append("</html>\r\n");

	}
	else
	{

	templateBuilder.Append("]]></root>\r\n");

	}	//end if




	Response.Write(templateBuilder.ToString());
}
</script>
