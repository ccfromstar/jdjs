<%@ Page language="c#" AutoEventWireup="false" EnableViewState="false" Inherits="Discuz.Web.usercppostpm" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="Discuz.Common" %>
<%@ Import namespace="Discuz.Forum" %>
<%@ Import namespace="Discuz.Entity" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by Discuz!NT Template Engine at 2009/9/29 9:12:58.
		本页面代码由Discuz!NT模板引擎生成于 2009/9/29 9:12:58. 
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




	if (infloat!=1)
	{

	templateBuilder.Append("<div id=\"nav\">\r\n");
	templateBuilder.Append("	<div class=\"wrap s_clear\">\r\n");
	templateBuilder.Append("		<a href=\"");
	templateBuilder.Append(config.Forumurl.ToString().Trim());
	templateBuilder.Append("\" class=\"title\">");
	templateBuilder.Append(config.Forumtitle.ToString().Trim());
	templateBuilder.Append("</a> &raquo; <a href=\"usercp.aspx\">用户中心</a> &raquo; <strong>撰写短消息</strong>\r\n");
	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("</div>\r\n");

	}	//end if


	if (ispost)
	{


	if (infloat==1)
	{


	if (page_err==0)
	{

	templateBuilder.Append("		    <script type=\"text/javascript\">\r\n");
	templateBuilder.Append("		        $('postpm').style.display = 'none';\r\n");
	templateBuilder.Append("		        $('return_mods').className = '';\r\n");
	templateBuilder.Append("		    </");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("			<div class=\"msgbox\">\r\n");
	templateBuilder.Append("			<h1>Discuz!NT Board 提示信息</h1>\r\n");
	templateBuilder.Append("			<p>");
	templateBuilder.Append(msgbox_text.ToString());
	templateBuilder.Append("</p>\r\n");

	if (msgbox_url!="")
	{

	templateBuilder.Append("			<h1><a href=\"javascript:;\" onclick=\"location.reload()\">如果长时间没有响应请点击此处</a></h1>\r\n");
	templateBuilder.Append("			<script type=\"text/javascript\">setTimeout('location.reload()', 3000);</");
	templateBuilder.Append("script>\r\n");

	}	//end if

	templateBuilder.Append("			</div>\r\n");

	}
	else
	{

	templateBuilder.Append("		    ");
	templateBuilder.Append(msgbox_text.ToString());
	templateBuilder.Append("\r\n");

	}	//end if


	}
	else
	{


	if (page_err==0)
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


	}	//end if


	}
	else
	{


	if (infloat==1)
	{

	templateBuilder.Append("    <div class=\"floatbox\" id=\"floatlayout_postpm\">\r\n");
	templateBuilder.Append("	<h3 class=\"float_ctrl\">\r\n");
	templateBuilder.Append("	<!--操作标题开始-->\r\n");
	templateBuilder.Append("	    <em id=\"return_mods\">撰写短消息</em>\r\n");
	templateBuilder.Append("	<!--操作标题结束-->\r\n");
	templateBuilder.Append("		<span>\r\n");
	templateBuilder.Append("			<a href=\"javascript:;\" class=\"float_close\" onclick=\"floatwin('close_postpm')\" title=\"关闭\">关闭</a>\r\n");
	templateBuilder.Append("		</span>\r\n");
	templateBuilder.Append("	</h3>\r\n");
	templateBuilder.Append("	<div class=\"gateform\" style=\"padding-left:15px;\">\r\n");
	templateBuilder.Append("	    <h3 id=\"returnmessage\"></h3>\r\n");
	templateBuilder.Append("		<form id=\"postpm\" name=\"postpm\" method=\"post\" onsubmit=\"javascript:ajaxpost('postpm', 'return_mods', 'return_mods', 'onerror');return false;\" action=\"");
	templateBuilder.Append(rooturl.ToString());
	templateBuilder.Append("usercppostpm.aspx?infloat=1\">\r\n");
	templateBuilder.Append("		<table cellspacing=\"0\" cellpadding=\"0\" class=\"formtable\" summary=\"撰写短消息\">\r\n");
	templateBuilder.Append("		<tbody>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th><label for=\"msgto\">收件人</label></th>\r\n");
	templateBuilder.Append("				<td><input name=\"msgto\" type=\"text\" id=\"msgto\" value=\"");
	templateBuilder.Append(msgto.ToString());
	templateBuilder.Append("\" size=\"25\" class=\"txt\" tabindex=\"1\" /></td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th><label for=\"subject\">标题</label></th>\r\n");
	templateBuilder.Append("				<td><input name=\"subject\" type=\"text\"id=\"subject\" value=\"");
	templateBuilder.Append(subject.ToString());
	templateBuilder.Append("\" size=\"40\" class=\"txt\" tabindex=\"1\" /></td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th><label for=\"message\">内容</label></th>\r\n");
	templateBuilder.Append("				<td><textarea name=\"message\" cols=\"60\" rows=\"8\" id=\"message\"  tabindex=\"1\" onkeydown=\"if((event.ctrlKey && event.keyCode == 13) || (event.altKey && event.keyCode == 83)) {ajaxpost('postpm', 'return_mods', 'return_mods', 'onerror');return false;}\" style=\"width:80%;\" class=\"txtarea\">");
	templateBuilder.Append(message.ToString());
	templateBuilder.Append("</textarea></td>\r\n");
	templateBuilder.Append("			</tr>\r\n");

	if (isseccode)
	{

	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th><label for=\"vcodetext\">验证码</label></th>\r\n");
	templateBuilder.Append("				<td>\r\n");
	templateBuilder.Append("					<div style=\"position: relative;\">\r\n");

	templateBuilder.Append("<div id=\"vcode_temp\"></div>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\" reload=\"1\">\r\n");
	templateBuilder.Append("	var infloat = ");
	templateBuilder.Append(infloat.ToString());
	templateBuilder.Append(";\r\n");
	templateBuilder.Append("	if (typeof vcodeimgid == 'undefined'){\r\n");
	templateBuilder.Append("		var vcodeimgid = 1;\r\n");
	templateBuilder.Append("	}\r\n");
	templateBuilder.Append("	else\r\n");
	templateBuilder.Append("	    vcodeimgid++;\r\n");
	templateBuilder.Append("    $('vcode_temp').parentNode.innerHTML = '<input name=\"vcodetext\" tabindex=\"1\" size=\"20\" onkeyup=\"changevcode(this.form, this.value);\" class=\"txt\" style=\"width:90px;\" id=\"vcodetext' + vcodeimgid + '\"  onblur=\"if(!seccodefocus) {display(this.id + \\'_menu\\')};\"  onclick=\"opensecwin('+vcodeimgid+',1)\"   value=\"验证码\" autocomplete=\"off\"/>' +\r\n");
	templateBuilder.Append("	                                       '<div class=\"seccodecontent\"  style=\"display:none;cursor: pointer;width: 124px; height: 44px;top:256px;z-index:10009;padding:0;\" id=\"vcodetext' + vcodeimgid + '_menu\" onmouseout=\"seccodefocus = 0\" onmouseover=\"seccodefocus = 1\"><img src=\"");
	templateBuilder.Append(rooturl.ToString());
	templateBuilder.Append("tools/VerifyImagePage.aspx?time=");
	templateBuilder.Append(Processtime.ToString());
	templateBuilder.Append("\" class=\"cursor\" id=\"vcodeimg' + vcodeimgid + '\" onclick=\"this.src=\\'");
	templateBuilder.Append(rooturl.ToString());
	templateBuilder.Append("tools/VerifyImagePage.aspx?id=");
	templateBuilder.Append(olid.ToString());
	templateBuilder.Append("&time=\\' + Math.random();\"/></div>';\r\n");
	templateBuilder.Append("	function changevcode(form, value){\r\n");
	templateBuilder.Append("		if (!$('vcode')){\r\n");
	templateBuilder.Append("			var vcode = document.createElement('input');\r\n");
	templateBuilder.Append("			vcode.id = 'vcode';\r\n");
	templateBuilder.Append("			vcode.name = 'vcode';\r\n");
	templateBuilder.Append("			vcode.type = 'hidden';\r\n");
	templateBuilder.Append("			vcode.value = value;\r\n");
	templateBuilder.Append("			form.appendChild(vcode);\r\n");
	templateBuilder.Append("		}else{\r\n");
	templateBuilder.Append("			$('vcode').value = value;\r\n");
	templateBuilder.Append("		}\r\n");
	templateBuilder.Append("	}\r\n");
	templateBuilder.Append("</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\">\r\n");
	templateBuilder.Append("var secclick = new Array();\r\n");
	templateBuilder.Append("var seccodefocus = 0;\r\n");
	templateBuilder.Append("function opensecwin(id,type) {\r\n");
	templateBuilder.Append("	if($('vcode')){\r\n");
	templateBuilder.Append("	$('vcode').parentNode.removeChild($('vcode'));}\r\n");
	templateBuilder.Append("	if (!secclick['vcodetext' + id]) {\r\n");
	templateBuilder.Append("	    $('vcodetext' + id).value = '';\r\n");
	templateBuilder.Append("	    secclick['vcodetext' + id] = 1;\r\n");
	templateBuilder.Append("	    if(type)\r\n");
	templateBuilder.Append("	        $('vcodetext' + id + '_menu').style.top = parseInt($('vcodetext' + id + '_menu').style.top) - parseInt($('vcodetext' + id + '_menu').style.height) + 'px';\r\n");
	templateBuilder.Append("	}\r\n");
	templateBuilder.Append("	$('vcodetext' + id + '_menu').style.position = 'absolute';\r\n");
	templateBuilder.Append("	$('vcodetext' + id + '_menu').style.top = (-parseInt($('vcodetext' + id + '_menu').style.height) - 2) + 'px';\r\n");
	templateBuilder.Append("	$('vcodetext' + id + '_menu').style.left = '0px';\r\n");
	templateBuilder.Append("	$('vcodetext' + id + '_menu').style.display = '';\r\n");
	templateBuilder.Append("	$('vcodetext' + id).focus();\r\n");
	templateBuilder.Append("	$('vcodetext' + id).unselectable = 'off';\r\n");
	templateBuilder.Append("	$('vcodeimg' + id).src = '");
	templateBuilder.Append(rooturl.ToString());
	templateBuilder.Append("tools/VerifyImagePage.aspx?id=");
	templateBuilder.Append(olid.ToString());
	templateBuilder.Append("&time=' + Math.random();\r\n");
	templateBuilder.Append("}\r\n");
	templateBuilder.Append("</");
	templateBuilder.Append("script>\r\n");


	templateBuilder.Append("					</div>\r\n");
	templateBuilder.Append("		        </td>\r\n");
	templateBuilder.Append("			</tr>\r\n");

	}	//end if

	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th></th>\r\n");
	templateBuilder.Append("				<td><input name=\"savetosentbox\" type=\"checkbox\" id=\"savetosentbox\" value=\"1\" tabindex=\"4\"  />保存到发件箱 \r\n");
	templateBuilder.Append("				<input type=\"checkbox\" name=\"emailnotify\" id=\"emailnotify\" />Email通知</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th></th>\r\n");
	templateBuilder.Append("				<td>\r\n");
	templateBuilder.Append("				<input name=\"sendmsg\" type=\"submit\" id=\"sendmsg\" value=\"立即发送\" tabindex=\"5\" />\r\n");
	templateBuilder.Append("				<input name=\"savetousercpdraftbox\" type=\"submit\" id=\"savetousercpdraftbox\" value=\"存为草稿\" tabindex=\"5\"  onclick=\"javascript:$('postpm').action='");
	templateBuilder.Append(rooturl.ToString());
	templateBuilder.Append("usercppostpm.aspx?infloat=1&savetousercpdraftbox=存为草稿';\"/>\r\n");
	templateBuilder.Append("				[可按Ctrl+Enter提交]</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("		</tbody>\r\n");
	templateBuilder.Append("		</table>							\r\n");
	templateBuilder.Append("	</form>\r\n");
	templateBuilder.Append("	</div>\r\n");

	}
	else
	{

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
	templateBuilder.Append("		<h1>撰写短消息</h1>\r\n");


	if (userid>0)
	{

	templateBuilder.Append("<div class=\"cm_header itemtitle s_clear\">\r\n");
	templateBuilder.Append("	<a class=\"postpm\" onclick=\"floatwin('open_postpm', this.href, 600, 410, '600,0');doane(event);\" href=\"usercppostpm.aspx\">+ 写新消息</a>\r\n");
	templateBuilder.Append("	<ul>\r\n");
	templateBuilder.Append("		<li \r\n");

	if (pagename=="usercpinbox.aspx")
	{

	templateBuilder.Append("class=\"current\"\r\n");

	}	//end if

	templateBuilder.Append("><a href=\"usercpinbox.aspx\"><span>收件箱</span></a></li>\r\n");
	templateBuilder.Append("		<li \r\n");

	if (pagename=="usercpsentbox.aspx")
	{

	templateBuilder.Append("class=\"current\"\r\n");

	}	//end if

	templateBuilder.Append("><a href=\"usercpsentbox.aspx\"><span>发件箱</span></a></li>\r\n");
	templateBuilder.Append("		<li \r\n");

	if (pagename=="usercpdraftbox.aspx")
	{

	templateBuilder.Append("class=\"current\"\r\n");

	}	//end if

	templateBuilder.Append("><a href=\"usercpdraftbox.aspx\"><span>草稿箱</span></a></li>\r\n");
	templateBuilder.Append("		<li \r\n");

	if (pagename=="usercpannouncepm.aspx")
	{

	templateBuilder.Append("class=\"current\"\r\n");

	}	//end if

	templateBuilder.Append("><a href=\"usercpannouncepm.aspx\"><span>公共消息\r\n");

	if (announcepmcount>0)
	{

	templateBuilder.Append("(");
	templateBuilder.Append(announcepmcount.ToString());
	templateBuilder.Append(")\r\n");

	}	//end if

	templateBuilder.Append("</span></a></li>\r\n");
	templateBuilder.Append("		<li \r\n");

	if (pagename=="usercpignorelist.aspx")
	{

	templateBuilder.Append("class=\"current\"\r\n");

	}	//end if

	templateBuilder.Append("><a href=\"usercpignorelist.aspx\"><span>黑名单</span></a></li>\r\n");
	templateBuilder.Append("		<li \r\n");

	if (pagename=="usercpnotice.aspx")
	{

	templateBuilder.Append("class=\"current\"\r\n");

	}	//end if

	templateBuilder.Append("><a id=\"notice\" onMouseOver=\"showMenu(this.id);\" onMouseOut=\"showMenu(this.id);\" onclick=\"javascript:window.location.href=this.href;\" href=\"usercpnotice.aspx\"><span><cite class=\"drop\">通知\r\n");

	if (newnoticecount>0)
	{

	templateBuilder.Append("(");
	templateBuilder.Append(newnoticecount.ToString());
	templateBuilder.Append(")\r\n");

	}	//end if

	templateBuilder.Append("</cite></span></a></li>\r\n");
	templateBuilder.Append("		<li \r\n");

	if (pagename=="usercppmset.aspx")
	{

	templateBuilder.Append("class=\"current\"\r\n");

	}	//end if

	templateBuilder.Append("><a href=\"usercppmset.aspx\"><span>选项</span></a></li>\r\n");
	templateBuilder.Append("	</ul>\r\n");
	templateBuilder.Append("</div>\r\n");

	}	//end if

	templateBuilder.Append("<ul class=\"popupmenu_popup headermenu_popup\" id=\"notice_menu\" style=\"display: none\">\r\n");

	if (config.Enablespace==1)
	{

	templateBuilder.Append("	<li><a href=\"usercpnotice.aspx?filter=spacecomment\">");
	templateBuilder.Append(config.Spacename.ToString().Trim());
	templateBuilder.Append("日志评论</a></li>               \r\n");

	}	//end if


	if (config.Enablealbum==1)
	{

	templateBuilder.Append("	<li><a href=\"usercpnotice.aspx?filter=albumcomment\">");
	templateBuilder.Append(config.Albumname.ToString().Trim());
	templateBuilder.Append("图片评论</a></li>		           \r\n");

	}	//end if


	if (config.Enablemall==1)
	{

	templateBuilder.Append("	<li><a href=\"usercpnotice.aspx?filter=goodstrade\">商品交易</a></li>\r\n");
	templateBuilder.Append("	<li><a href=\"usercpnotice.aspx?filter=goodsleaveword\">商品留言</a></li>	  \r\n");

	}	//end if

	templateBuilder.Append("	<li><a href=\"usercpnotice.aspx?filter=postreply\">主题回复</a></li>\r\n");
	templateBuilder.Append("	<li><a href=\"usercpnotice.aspx?filter=all\">全部通知</a></li>\r\n");
	templateBuilder.Append("</ul>\r\n");



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

	templateBuilder.Append("			<form id=\"postpm\" name=\"postpm\" method=\"post\" action=\"\">			\r\n");
	templateBuilder.Append("			<table cellspacing=\"0\" cellpadding=\"0\" class=\"formtable\" summary=\"撰写短消息\">\r\n");
	templateBuilder.Append("			<tbody>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th><label for=\"msgto\">收件人</label></th>\r\n");
	templateBuilder.Append("				<td><input name=\"msgto\" type=\"text\" id=\"msgto\" value=\"");
	templateBuilder.Append(msgto.ToString());
	templateBuilder.Append("\" size=\"25\" class=\"txt\"/></td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th><label for=\"subject\">标题</label></th>\r\n");
	templateBuilder.Append("				<td><input name=\"subject\" type=\"text\"id=\"subject\" value=\"");
	templateBuilder.Append(subject.ToString());
	templateBuilder.Append("\" size=\"40\" class=\"txt\"/></td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th><label for=\"message\">内容</label></th>\r\n");
	templateBuilder.Append("				<td><textarea name=\"message\" cols=\"60\" rows=\"8\" id=\"message\" onkeydown=\"if((event.ctrlKey && event.keyCode == 13) || (event.altKey && event.keyCode == 83)) document.getElementById('postpm').submit();\" style=\"width:80%;\" class=\"txtarea\">");
	templateBuilder.Append(message.ToString());
	templateBuilder.Append("</textarea></td>\r\n");
	templateBuilder.Append("			</tr>\r\n");

	if (isseccode)
	{

	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th><label for=\"vcodetext\">验证码</label></th>\r\n");
	templateBuilder.Append("				<td>\r\n");
	templateBuilder.Append("					<div style=\"position: relative;\">\r\n");

	templateBuilder.Append("<div id=\"vcode_temp\"></div>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\" reload=\"1\">\r\n");
	templateBuilder.Append("	var infloat = ");
	templateBuilder.Append(infloat.ToString());
	templateBuilder.Append(";\r\n");
	templateBuilder.Append("	if (typeof vcodeimgid == 'undefined'){\r\n");
	templateBuilder.Append("		var vcodeimgid = 1;\r\n");
	templateBuilder.Append("	}\r\n");
	templateBuilder.Append("	else\r\n");
	templateBuilder.Append("	    vcodeimgid++;\r\n");
	templateBuilder.Append("    $('vcode_temp').parentNode.innerHTML = '<input name=\"vcodetext\" tabindex=\"1\" size=\"20\" onkeyup=\"changevcode(this.form, this.value);\" class=\"txt\" style=\"width:90px;\" id=\"vcodetext' + vcodeimgid + '\"  onblur=\"if(!seccodefocus) {display(this.id + \\'_menu\\')};\"  onclick=\"opensecwin('+vcodeimgid+',1)\"   value=\"验证码\" autocomplete=\"off\"/>' +\r\n");
	templateBuilder.Append("	                                       '<div class=\"seccodecontent\"  style=\"display:none;cursor: pointer;width: 124px; height: 44px;top:256px;z-index:10009;padding:0;\" id=\"vcodetext' + vcodeimgid + '_menu\" onmouseout=\"seccodefocus = 0\" onmouseover=\"seccodefocus = 1\"><img src=\"");
	templateBuilder.Append(rooturl.ToString());
	templateBuilder.Append("tools/VerifyImagePage.aspx?time=");
	templateBuilder.Append(Processtime.ToString());
	templateBuilder.Append("\" class=\"cursor\" id=\"vcodeimg' + vcodeimgid + '\" onclick=\"this.src=\\'");
	templateBuilder.Append(rooturl.ToString());
	templateBuilder.Append("tools/VerifyImagePage.aspx?id=");
	templateBuilder.Append(olid.ToString());
	templateBuilder.Append("&time=\\' + Math.random();\"/></div>';\r\n");
	templateBuilder.Append("	function changevcode(form, value){\r\n");
	templateBuilder.Append("		if (!$('vcode')){\r\n");
	templateBuilder.Append("			var vcode = document.createElement('input');\r\n");
	templateBuilder.Append("			vcode.id = 'vcode';\r\n");
	templateBuilder.Append("			vcode.name = 'vcode';\r\n");
	templateBuilder.Append("			vcode.type = 'hidden';\r\n");
	templateBuilder.Append("			vcode.value = value;\r\n");
	templateBuilder.Append("			form.appendChild(vcode);\r\n");
	templateBuilder.Append("		}else{\r\n");
	templateBuilder.Append("			$('vcode').value = value;\r\n");
	templateBuilder.Append("		}\r\n");
	templateBuilder.Append("	}\r\n");
	templateBuilder.Append("</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\">\r\n");
	templateBuilder.Append("var secclick = new Array();\r\n");
	templateBuilder.Append("var seccodefocus = 0;\r\n");
	templateBuilder.Append("function opensecwin(id,type) {\r\n");
	templateBuilder.Append("	if($('vcode')){\r\n");
	templateBuilder.Append("	$('vcode').parentNode.removeChild($('vcode'));}\r\n");
	templateBuilder.Append("	if (!secclick['vcodetext' + id]) {\r\n");
	templateBuilder.Append("	    $('vcodetext' + id).value = '';\r\n");
	templateBuilder.Append("	    secclick['vcodetext' + id] = 1;\r\n");
	templateBuilder.Append("	    if(type)\r\n");
	templateBuilder.Append("	        $('vcodetext' + id + '_menu').style.top = parseInt($('vcodetext' + id + '_menu').style.top) - parseInt($('vcodetext' + id + '_menu').style.height) + 'px';\r\n");
	templateBuilder.Append("	}\r\n");
	templateBuilder.Append("	$('vcodetext' + id + '_menu').style.position = 'absolute';\r\n");
	templateBuilder.Append("	$('vcodetext' + id + '_menu').style.top = (-parseInt($('vcodetext' + id + '_menu').style.height) - 2) + 'px';\r\n");
	templateBuilder.Append("	$('vcodetext' + id + '_menu').style.left = '0px';\r\n");
	templateBuilder.Append("	$('vcodetext' + id + '_menu').style.display = '';\r\n");
	templateBuilder.Append("	$('vcodetext' + id).focus();\r\n");
	templateBuilder.Append("	$('vcodetext' + id).unselectable = 'off';\r\n");
	templateBuilder.Append("	$('vcodeimg' + id).src = '");
	templateBuilder.Append(rooturl.ToString());
	templateBuilder.Append("tools/VerifyImagePage.aspx?id=");
	templateBuilder.Append(olid.ToString());
	templateBuilder.Append("&time=' + Math.random();\r\n");
	templateBuilder.Append("}\r\n");
	templateBuilder.Append("</");
	templateBuilder.Append("script>\r\n");


	templateBuilder.Append("				</div>\r\n");
	templateBuilder.Append("		        </td>\r\n");
	templateBuilder.Append("			</tr>\r\n");

	}	//end if

	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th></th>\r\n");
	templateBuilder.Append("				<td><input name=\"savetosentbox\" type=\"checkbox\" id=\"savetosentbox\" value=\"1\"/>保存到发件箱 \r\n");
	templateBuilder.Append("				<input type=\"checkbox\" name=\"emailnotify\" id=\"emailnotify\" />Email通知</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th></th>\r\n");
	templateBuilder.Append("				<td>\r\n");
	templateBuilder.Append("				<input name=\"sendmsg\" type=\"submit\" id=\"sendmsg\" value=\"立即发送\"/>\r\n");
	templateBuilder.Append("				<input name=\"savetousercpdraftbox\" type=\"submit\" id=\"savetousercpdraftbox\" value=\"存为草稿\"/>\r\n");
	templateBuilder.Append("				[可按Ctrl+Enter提交]</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			</tbody>\r\n");
	templateBuilder.Append("			</table>							\r\n");
	templateBuilder.Append("			</form>\r\n");

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

	}	//end if


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
