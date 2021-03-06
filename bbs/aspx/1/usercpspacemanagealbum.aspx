<%@ Page language="c#" AutoEventWireup="false" EnableViewState="false" Inherits="Discuz.Album.Pages.usercpalbummanage" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="Discuz.Common" %>
<%@ Import namespace="Discuz.Forum" %>
<%@ Import namespace="Discuz.Entity" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by Discuz!NT Template Engine at 2009/9/29 9:12:41.
		本页面代码由Discuz!NT模板引擎生成于 2009/9/29 9:12:41. 
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



	templateBuilder.Append("<div id=\"nav\">\r\n");
	templateBuilder.Append("	<div class=\"wrap s_clear\">\r\n");
	templateBuilder.Append("       <a href=\"");
	templateBuilder.Append(config.Forumurl.ToString().Trim());
	templateBuilder.Append("\" class=\"title\">");
	templateBuilder.Append(config.Forumtitle.ToString().Trim());
	templateBuilder.Append("</a>  &raquo;  <a href=\"usercp.aspx\">用户中心</a>  &raquo;  <strong>管理相册</strong>\r\n");
	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\">\r\n");
	templateBuilder.Append("	function checkPublicAndPrivate(val)\r\n");
	templateBuilder.Append("	{\r\n");
	templateBuilder.Append("		if(val == 0)\r\n");
	templateBuilder.Append("		{\r\n");
	templateBuilder.Append("			$('password').value = '';\r\n");
	templateBuilder.Append("			$('password').readOnly = true;\r\n");
	templateBuilder.Append("		}\r\n");
	templateBuilder.Append("		else\r\n");
	templateBuilder.Append("		{\r\n");
	templateBuilder.Append("			$('password').readOnly = false;\r\n");
	templateBuilder.Append("			$('password').focus();\r\n");
	templateBuilder.Append("		}\r\n");
	templateBuilder.Append("	}\r\n");
	templateBuilder.Append("	function submitForm()\r\n");
	templateBuilder.Append("	{\r\n");
	templateBuilder.Append("		if($(\"albumtitle\").value == \"\")\r\n");
	templateBuilder.Append("		{\r\n");
	templateBuilder.Append("			alert(\"相册名称不能为空!\");\r\n");
	templateBuilder.Append("			return false;\r\n");
	templateBuilder.Append("		}\r\n");
	templateBuilder.Append("		if($(\"albumcate\").value == \"\")\r\n");
	templateBuilder.Append("		{\r\n");
	templateBuilder.Append("			alert(\"请选择相册分类!\");\r\n");
	templateBuilder.Append("			return false;\r\n");
	templateBuilder.Append("		}\r\n");
	templateBuilder.Append("		if($(\"albumdescription\").value.length > 200) \r\n");
	templateBuilder.Append("		{\r\n");
	templateBuilder.Append("			alert('链接描述长度最大为200字'); \r\n");
	templateBuilder.Append("			return false;\r\n");
	templateBuilder.Append("		}\r\n");
	templateBuilder.Append("		if($(\"private\").checked && $(\"password\").value == \"\")\r\n");
	templateBuilder.Append("		{\r\n");
	templateBuilder.Append("			alert(\"选择私人相册必须拥有一个授权密码!\");\r\n");
	templateBuilder.Append("			return false;\r\n");
	templateBuilder.Append("		}\r\n");
	templateBuilder.Append("		return true;\r\n");
	templateBuilder.Append("	}\r\n");
	templateBuilder.Append("	function delAlert(title)\r\n");
	templateBuilder.Append("	{\r\n");
	templateBuilder.Append("		if(!confirm(\"你真的要删除 \" + title + \" 吗？删除的相册与相册内的图片将无法恢复!\"))\r\n");
	templateBuilder.Append("		{\r\n");
	templateBuilder.Append("			event.cancelBubble = true;\r\n");
	templateBuilder.Append("			return false;				\r\n");
	templateBuilder.Append("		}\r\n");
	templateBuilder.Append("	}\r\n");
	templateBuilder.Append("</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<div class=\"wrap with_side s_clear\" id=\"wrap\">\r\n");

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


	templateBuilder.Append("	<div class=\"cpmain\">\r\n");
	templateBuilder.Append("	<div class=\"cpcontent\">\r\n");
	templateBuilder.Append("	<h1>管理相册</h1>\r\n");


	if (config.Enablealbum==1)
	{

	templateBuilder.Append("<div class=\"cm_header itemtitle s_clear\">\r\n");

	if (userid>0)
	{

	templateBuilder.Append("	<ul>\r\n");
	templateBuilder.Append("		<li  \r\n");

	if (pagename=="usercpspacemanagealbum.aspx"||pagename=="usercpspacemanagephoto.aspx"||pagename=="usercpspacephotoadd.aspx")
	{

	templateBuilder.Append("class=\"current\"\r\n");

	}	//end if

	templateBuilder.Append(">\r\n");
	templateBuilder.Append("		 <a href=\"usercpspacemanagealbum.aspx\"><span>管理");
	templateBuilder.Append(config.Albumname.ToString().Trim());
	templateBuilder.Append("</span></a>\r\n");
	templateBuilder.Append("		 </li>\r\n");
	templateBuilder.Append("	</ul>\r\n");

	}	//end if

	templateBuilder.Append("</div>\r\n");

	}	//end if




	if (page_err==0)
	{


	if (ispost)
	{


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



	}
	else
	{

	templateBuilder.Append("		<ul id=\"photo\">\r\n");

	if (albumcount>0)
	{


	int singleAlbumInfo__loop__id=0;
	foreach(DataRow singleAlbumInfo in albumInfoArray.Rows)
	{
		singleAlbumInfo__loop__id++;

	templateBuilder.Append("		<li>\r\n");
	templateBuilder.Append("		<div class=\"pictureimg\">\r\n");
	templateBuilder.Append("			<a href='usercpspacemanagephoto.aspx?albumid=" + singleAlbumInfo["Albumid"].ToString().Trim() + "' title='点击管理相册内容'>\r\n");
	templateBuilder.Append("			<img src='" + singleAlbumInfo["Logo"].ToString().Trim() + "' alt='" + singleAlbumInfo["Title"].ToString().Trim() + "' title='" + singleAlbumInfo["Description"].ToString().Trim() + "' style='border: 1px solid #ccc; padding:4px' />\r\n");
	templateBuilder.Append("			</a>\r\n");

	if (singleAlbumInfo["Type"].ToString().Trim()!="0")
	{

	templateBuilder.Append("			<span style='position:relative;left:-30px;top:0px;z-index:1'><img src='");
	templateBuilder.Append(spaceurl.ToString());
	templateBuilder.Append("space/manage/images/lock.gif' width='21' height='30'  title=\"私有相册\" alt=\"私有相册\"></span>\r\n");

	}	//end if

	templateBuilder.Append("		</div>\r\n");
	templateBuilder.Append("		<h4>" + singleAlbumInfo["Title"].ToString().Trim() + "</h4>\r\n");
	templateBuilder.Append("		<p>时间:" + singleAlbumInfo["Createdatetime"].ToString().Trim() + "</p>\r\n");
	templateBuilder.Append("		<p>" + singleAlbumInfo["Imgcount"].ToString().Trim() + "张图片  <a href=\"usercpspacephotoadd.aspx?albumid=" + singleAlbumInfo["Albumid"].ToString().Trim() + "\">增加图片</a>&nbsp;&nbsp;<a href='usercpspacemanagealbum.aspx?page=");
	templateBuilder.Append(pageid.ToString());
	templateBuilder.Append("&mod=edit&albumid=" + singleAlbumInfo["Albumid"].ToString().Trim() + "#edit'>编辑</a>\r\n");

					string temptitle = singleAlbumInfo["Title"].ToString().Trim().Replace("&quot;","\\&quot;");
				
	templateBuilder.Append("		&nbsp;&nbsp;<a href='usercpspacemanagealbum.aspx?mod=delete&albumid=" + singleAlbumInfo["Albumid"].ToString().Trim() + "' onclick='return delAlert(\"");
	templateBuilder.Append(temptitle.ToString());
	templateBuilder.Append("\")'>删除</a></p>\r\n");
	templateBuilder.Append("		</li>\r\n");

	}	//end loop


	}
	else
	{

	templateBuilder.Append("		<div class=\"zerothreads\">暂无相册</div>\r\n");

	}	//end if

	templateBuilder.Append("		</ul>\r\n");
	templateBuilder.Append("		<hr class=\"solidline\"/>\r\n");
	templateBuilder.Append("		<div class=\"cpbox s_clear\">\r\n");
	templateBuilder.Append("			<div class=\"pages_btns\">\r\n");

	if (pagecount>1)
	{

	templateBuilder.Append("				<div class=\"pages\">\r\n");
	templateBuilder.Append("					");
	templateBuilder.Append(pagenumbers.ToString());
	templateBuilder.Append(" <em>");
	templateBuilder.Append(pageid.ToString());
	templateBuilder.Append("/");
	templateBuilder.Append(pagecount.ToString());
	templateBuilder.Append("页</em> \r\n");
	templateBuilder.Append("				</div>\r\n");

	}	//end if


	if (allownewalbum)
	{

	templateBuilder.Append("					<a href=\"###\" onclick=\"BOX_show('neworeditalbum');\"><strong>新建");
	templateBuilder.Append(config.Albumname.ToString().Trim());
	templateBuilder.Append("</strong></a>\r\n");

	}	//end if

	templateBuilder.Append("			</div>\r\n");
	templateBuilder.Append("		</div>\r\n");

	}	//end if


	}
	else
	{


	templateBuilder.Append("<div class=\"msgbox error_msg\">\r\n");
	templateBuilder.Append("	<h3>错误显示</h3>\r\n");
	templateBuilder.Append("	<p>");
	templateBuilder.Append(msgbox_text.ToString());
	templateBuilder.Append("</p>\r\n");
	templateBuilder.Append("	<p class=\"errorback\">\r\n");
	templateBuilder.Append("		<script type=\"text/javascript\">\r\n");
	templateBuilder.Append("			if(");
	templateBuilder.Append(msgbox_showbacklink.ToString());
	templateBuilder.Append(")\r\n");
	templateBuilder.Append("			{\r\n");
	templateBuilder.Append("				document.write(\"<a href=\\\"");
	templateBuilder.Append(msgbox_backlink.ToString());
	templateBuilder.Append("\\\">返回上一步</a> &nbsp; &nbsp;|  \");\r\n");
	templateBuilder.Append("			}\r\n");
	templateBuilder.Append("		</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("		&nbsp; &nbsp; <a href=\"forumindex.aspx\">论坛首页</a>\r\n");

	if (usergroupid==7)
	{

	templateBuilder.Append("		 |&nbsp; &nbsp; <a href=\"register.aspx\">注册</a>\r\n");

	}	//end if

	templateBuilder.Append("	</p>\r\n");
	templateBuilder.Append("</div>\r\n");



	}	//end if

	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("</div>\r\n");


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



	templateBuilder.Append("<div id=\"BOX_overlay\" style=\"background:#000; position: absolute; z-index:100; filter:alpha(opacity=50);-moz-opacity: 0.6;opacity: 0.6;\"></div>\r\n");

	if (page_err==0 && allownewalbum)
	{

	templateBuilder.Append("<script type=\"text/javascript\" src=\"javascript/template_album.js\"></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<div id=\"neworeditalbum\" style=\"display:none; background:#FFF; padding:10px; border:1px solid #999; width:400px;text-align:left;\">\r\n");
	templateBuilder.Append("	<form action=\"\" method=\"post\" id=\"Form1\">\r\n");
	templateBuilder.Append("	<h3 style=\"line-height:270%;\"><a name=\"edit\" />");
	templateBuilder.Append(mod.ToString());
	templateBuilder.Append("</a></h3>\r\n");
	templateBuilder.Append("	<table cellspacing=\"0\" cellpadding=\"0\" class=\"formtable\" summary=\"");
	templateBuilder.Append(mod.ToString());
	templateBuilder.Append("\">	\r\n");
	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("		<tr>\r\n");
	templateBuilder.Append("			<th><label for=\"albumtitle\">相册名称</label></th>\r\n");
	templateBuilder.Append("			<td><input name=\"albumtitle\" type=\"text\" id=\"albumtitle\" size=\"40\" maxlength=\"50\" value=\"");
	templateBuilder.Append(title.ToString());
	templateBuilder.Append("\"  class=\"txt\"/>\r\n");
	templateBuilder.Append("				<input type=\"hidden\" name=\"albumid\" value=\"");
	templateBuilder.Append(albumid.ToString());
	templateBuilder.Append("\" id=\"albumid\">\r\n");
	templateBuilder.Append("				<input type=\"hidden\" name=\"active\" id=\"active\" value=\"\">\r\n");
	templateBuilder.Append("			</td>\r\n");
	templateBuilder.Append("		</tr>\r\n");
	templateBuilder.Append("		<tr>\r\n");
	templateBuilder.Append("			<th><label for=\"albumcate\">相册分类</label></th>\r\n");
	templateBuilder.Append("			<td>\r\n");
	templateBuilder.Append("			<select name=\"albumcate\" id=\"albumcate\" value=\"");
	templateBuilder.Append(title.ToString());
	templateBuilder.Append("\">\r\n");
	templateBuilder.Append("				<option value=\"\"></option>\r\n");

	int albumcate__loop__id=0;
	foreach(AlbumCategoryInfo albumcate in albumcates)
	{
		albumcate__loop__id++;

	templateBuilder.Append("					<option value=\"");
	templateBuilder.Append(albumcate.Albumcateid.ToString().Trim());
	templateBuilder.Append("\"\r\n");

	if (albumcateid==albumcate.Albumcateid)
	{

	templateBuilder.Append("					selected\r\n");

	}	//end if

	templateBuilder.Append("					>");
	templateBuilder.Append(albumcate.Title.ToString().Trim());
	templateBuilder.Append("</option>\r\n");

	}	//end loop

	templateBuilder.Append("			</select>\r\n");
	templateBuilder.Append("			</td>\r\n");
	templateBuilder.Append("		</tr>\r\n");
	templateBuilder.Append("		<tr>\r\n");
	templateBuilder.Append("			<th><label for=\"albumdescription\">描述</label></th>\r\n");
	templateBuilder.Append("			<td><textarea name=\"albumdescription\" cols=\"40\" rows=\"6\" id=\"albumdescription\" class=\"txtarea\">");
	templateBuilder.Append(description.ToString());
	templateBuilder.Append("</textarea></td>\r\n");
	templateBuilder.Append("		</tr>\r\n");
	templateBuilder.Append("		<tr>\r\n");
	templateBuilder.Append("			<th><label for=\"public\">是否公开:</label></th>\r\n");
	templateBuilder.Append("			<td><input id=\"public\" type=\"radio\" name=\"type\" value=\"0\" onclick='checkPublicAndPrivate(0)' \r\n");

	if (type==0)
	{

	templateBuilder.Append("checked=\"checked\"\r\n");

	}	//end if

	templateBuilder.Append(">公开相册&nbsp;&nbsp;&nbsp;\r\n");
	templateBuilder.Append("				<input id=\"private\" type=\"radio\" name=\"type\" value=\"1\" onclick='checkPublicAndPrivate(1)' \r\n");

	if (type==1)
	{

	templateBuilder.Append("checked=\"checked\"\r\n");

	}	//end if

	templateBuilder.Append(">私人相册\r\n");
	templateBuilder.Append("			</td>\r\n");
	templateBuilder.Append("		</tr>\r\n");
	templateBuilder.Append("		<tr>\r\n");
	templateBuilder.Append("			<th><label for=\"password\">密码</label></th>\r\n");
	templateBuilder.Append("			<td><input name=\"password\" type=\"text\" id=\"password\" size=\"40\" maxlength=\"50\" value=\"");
	templateBuilder.Append(albumpassword.ToString());
	templateBuilder.Append("\"\r\n");

	if (type==0)
	{

	templateBuilder.Append("readonly=\"readonly\"\r\n");

	}	//end if

	templateBuilder.Append("/>\r\n");
	templateBuilder.Append("			</td>\r\n");
	templateBuilder.Append("		</tr>\r\n");
	templateBuilder.Append("		<tr>\r\n");
	templateBuilder.Append("			<th></th>\r\n");
	templateBuilder.Append("			<td><input type=\"submit\" name=\"Submit\" value=\"确定\" onclick=\"return submitForm()\" /> &nbsp; <input type=\"button\" name=\"Submit\" value=\"取消\"  onclick=\"window.location='usercpspacemanagealbum.aspx';\" /></td>\r\n");
	templateBuilder.Append("		</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");
	templateBuilder.Append("	</table>\r\n");
	templateBuilder.Append("	</form>\r\n");
	templateBuilder.Append("</div>\r\n");

	if (albumid!=0)
	{

	templateBuilder.Append("		<script type=\"text/javascript\">BOX_show('neworeditalbum');\r\n");

	if (albumid==-1)
	{

	templateBuilder.Append("			$('albumid').value = \"0\";\r\n");

	}	//end if

	templateBuilder.Append("		</");
	templateBuilder.Append("script>\r\n");

	}	//end if


	}	//end if


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
