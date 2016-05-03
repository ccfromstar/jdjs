<%@ Page language="c#" AutoEventWireup="false" EnableViewState="false" Inherits="Discuz.Mall.Pages.postgoods" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="Discuz.Common" %>
<%@ Import namespace="Discuz.Forum" %>
<%@ Import namespace="Discuz.Entity" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by Discuz!NT Template Engine at 2009/9/29 9:12:49.
		本页面代码由Discuz!NT模板引擎生成于 2009/9/29 9:12:49. 
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



	templateBuilder.Append("<script type=\"text/javascript\" src=\"javascript/template_calendar.js\"></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\" src=\"javascript/ajax.js\"></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\">\r\n");
	templateBuilder.Append("var postminchars = parseInt('");
	templateBuilder.Append(config.Minpostsize.ToString().Trim());
	templateBuilder.Append("');\r\n");
	templateBuilder.Append("var postmaxchars = parseInt('");
	templateBuilder.Append(config.Maxpostsize.ToString().Trim());
	templateBuilder.Append("');\r\n");
	templateBuilder.Append("var disablepostctrl = parseInt('");
	templateBuilder.Append(disablepost.ToString());
	templateBuilder.Append("');\r\n");
	templateBuilder.Append("var tradepost =1\r\n");
	templateBuilder.Append("</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<!--TheCurrent start-->\r\n");

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

	templateBuilder.Append("<div id=\"foruminfo\">\r\n");
	templateBuilder.Append("	<div id=\"nav\">\r\n");
	templateBuilder.Append("		<a href=\"");
	templateBuilder.Append(config.Forumurl.ToString().Trim());
	templateBuilder.Append("\" class=\"home\">");
	templateBuilder.Append(config.Forumtitle.ToString().Trim());
	templateBuilder.Append("</a>  &raquo; <strong>");
	templateBuilder.Append(goodscategoryinfo.Pathlist.ToString().Trim());
	templateBuilder.Append("</strong> &raquo; <strong>发表新商品</strong>\r\n");
	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("	<div id=\"headsearch\">\r\n");
	templateBuilder.Append("		<div id=\"search\">\r\n");

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

	templateBuilder.Append("		</div>\r\n");
	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("<div class=\"mainbox\">\r\n");
	templateBuilder.Append("<h3>发表新商品</h3>\r\n");
	templateBuilder.Append("<form method=\"post\" name=\"postform\" id=\"postform\" action=\"\" enctype=\"multipart/form-data\" onsubmit=\"\">\r\n");
	templateBuilder.Append("<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<td class=\"navformcommend\"  colspan=\"2\">商品信息</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<th><label for=\"goodscategoryid\">商品类目</label></th>\r\n");
	templateBuilder.Append("		<td>\r\n");
	templateBuilder.Append("			 <input type=\"hidden\" id=\"goodscategoryid\" name=\"goodscategoryid\" value=\"");
	templateBuilder.Append(goodscategoryinfo.Categoryid.ToString().Trim());
	templateBuilder.Append("\"/>\r\n");
	templateBuilder.Append("			 <span id=\"goodstypeinfo\">\r\n");

	if (goodscategoryinfo.Categoryname=="")
	{

	templateBuilder.Append("				暂无分类\r\n");

	}
	else
	{

	templateBuilder.Append("				");
	templateBuilder.Append(goodscategoryinfo.Categoryname.ToString().Trim());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("</span>\r\n");

	templateBuilder.Append("<script type=\"text/javascript\">\r\n");
	templateBuilder.Append("var enablemall = parseInt('");
	templateBuilder.Append(config.Enablemall.ToString().Trim());
	templateBuilder.Append("');\r\n");
	templateBuilder.Append("</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("[<a href=\"javascript:;\" onclick=\"setCategory('goodscategoryid');boxShow('editcategoryinfo');\">选择...</a>]\r\n");

	if (config.Enablemall==1)
	{

	templateBuilder.Append("				<div id=\"BOX_overlay\" style=\"background: #000; position: absolute; z-index:100; filter:alpha(opacity=50);-moz-opacity: 0.6;opacity: 0.6;\"></div>\r\n");
	templateBuilder.Append("					<div id=\"editcategoryinfo\" style=\"display: none; background :#fff; padding:10px; border:1px solid #999; width:740px;\">\r\n");
	templateBuilder.Append("					<h3 style=\"line-height:270%;margin-top:15px;\"><a name=\"edit\" />请选择已绑定版块的商品分类(不带*号):</a></h3>\r\n");
	templateBuilder.Append("					<div class=\"CompartLine\">&nbsp;</div>\r\n");
	templateBuilder.Append("					<div id=\"categoryselector\">\r\n");
	templateBuilder.Append("					<ul id=\"categorylevel0\" class=\"\"></ul>\r\n");
	templateBuilder.Append("					<ul id=\"categorylevel1\" class=\"blank\"/></ul>\r\n");
	templateBuilder.Append("					<ul id=\"categorylevel2\" class=\"blank\"/></ul>\r\n");
	templateBuilder.Append("					<ul id=\"categorylevel3\" class=\"blank\"/></ul>\r\n");
	templateBuilder.Append("					</div>\r\n");
	templateBuilder.Append("					<div style=\"padding-top:5px;text-align:center;\" >					\r\n");
	templateBuilder.Append("					<input type=\"button\" name=\"submit\" value=\"确定\" onclick=\"submitCategory();\" /> &nbsp; \r\n");
	templateBuilder.Append("					<input type=\"button\" name=\"cancel\" value=\"取消\" onclick=\"boxRemove('editcategoryinfo');\" /> &nbsp; 							\r\n");
	templateBuilder.Append("					</div>\r\n");
	templateBuilder.Append("				</div>\r\n");

	}	//end if

	templateBuilder.Append("<script language=\"javascript\" src=\"javascript/template_goodsadmin.js\"></");
	templateBuilder.Append("script>\r\n");


	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");
	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<th><label for=\"quality\">商品类型</label></th>\r\n");
	templateBuilder.Append("		<td>\r\n");
	templateBuilder.Append("			<select id=\"quality\" name=\"quality\" tabindex=\"51\">\r\n");
	templateBuilder.Append("				<option value=\"1\" >全新</option>\r\n");
	templateBuilder.Append("				<option value=\"2\" >二手</option>\r\n");
	templateBuilder.Append("			</select>\r\n");
	templateBuilder.Append("			<select id=\"itemtype\"  name=\"itemtype\" tabindex=\"52\">\r\n");
	templateBuilder.Append("				<option value=\"1\" >商品</option>\r\n");
	templateBuilder.Append("				<option value=\"2\" >服务</option>\r\n");
	templateBuilder.Append("				<option value=\"3\" >拍卖</option>\r\n");
	templateBuilder.Append("				<option value=\"4\" >捐赠</option>\r\n");
	templateBuilder.Append("				<option value=\"5\" >邮费</option>\r\n");
	templateBuilder.Append("				<option value=\"6\" >奖金</option>\r\n");
	templateBuilder.Append("			</select>\r\n");
	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");
	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<th><label for=\"title\">商品标题</label></th>\r\n");
	templateBuilder.Append("		<td>\r\n");
	templateBuilder.Append("			<span id=\"ticketTitle\" style=\"display: none;\"></span>\r\n");
	templateBuilder.Append("			<input id=\"title\" name=\"title\" maxlength=\"60\" size=\"40\" value=\"\" >\r\n");

	if (canhtmltitle)
	{

	templateBuilder.Append("				<a id=\"titleEditorButton\" href=\"###\" onclick=\"\">高级编辑</a>\r\n");
	templateBuilder.Append("				<script type=\"text/javascript\" src=\"javascript/dnteditor.js\"></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("				<div id=\"titleEditorDiv\" style=\"display: none;\">\r\n");
	templateBuilder.Append("				<textarea name=\"htmltitle\" id=\"htmltitle\" cols=\"80\" rows=\"10\"></textarea>\r\n");
	templateBuilder.Append("				<script type=\"text/javascript\">\r\n");
	templateBuilder.Append("					var forumpath = '");
	templateBuilder.Append(forumpath.ToString());
	templateBuilder.Append("';\r\n");
	templateBuilder.Append("					var templatepath = '");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("';\r\n");
	templateBuilder.Append("					var temptitle = $('faketitle');\r\n");
	templateBuilder.Append("					var titleEditor = null;\r\n");
	templateBuilder.Append("					function AdvancedTitleEditor() {\r\n");
	templateBuilder.Append("						$('title').style.display = 'none';\r\n");
	templateBuilder.Append("						$('titleEditorDiv').style.display = '';\r\n");
	templateBuilder.Append("						$('titleEditorButton').style.display = 'none';\r\n");
	templateBuilder.Append("						titleEditor = new DNTeditor('htmltitle', '500', '50', $('title').value);\r\n");
	templateBuilder.Append("						titleEditor.OnChange = function(){\r\n");
	templateBuilder.Append("							//temptitle.innerHTML = html2bbcode(titleEditor.GetHtml().replace(/<[^>]*>/ig, ''));\r\n");
	templateBuilder.Append("						}\r\n");
	templateBuilder.Append("						titleEditor.Basic = true;\r\n");
	templateBuilder.Append("						titleEditor.IsAutoSave = false;\r\n");
	templateBuilder.Append("						titleEditor.Style = forumpath + 'templates/' + templatepath + '/editor.css';\r\n");
	templateBuilder.Append("						titleEditor.BasePath = forumpath;\r\n");
	templateBuilder.Append("						titleEditor.ReplaceTextarea();\r\n");
	templateBuilder.Append("					}\r\n");
	templateBuilder.Append("					$('titleEditorButton').onclick = function(){\r\n");
	templateBuilder.Append("						AdvancedTitleEditor();\r\n");
	templateBuilder.Append("					};\r\n");
	templateBuilder.Append("				</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("				</div>\r\n");

	}	//end if

	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");
	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<th><label for=\"postfile\">上传图片</label></th>\r\n");
	templateBuilder.Append("		<td>\r\n");
	templateBuilder.Append("			<div style=\"float:left; padding-top:25px;\">\r\n");
	templateBuilder.Append("			<input type=\"file\" onchange=\"PhotoView(this.value,document.getElementById('previewImage'))\" id=\"upfilegoodspic\" name=\"postfile\" size=\"40\" /> \r\n");
	templateBuilder.Append("			<br/><span class=\"posttip\">图片限定jpg或gif格式, 请确保图片在浏览器中可以正常打开.</span> &nbsp; &nbsp;&nbsp;\r\n");
	templateBuilder.Append("			</div>\r\n");
	templateBuilder.Append("			<div style=\"float:left; border: 1px solid #DDD; width: 75px; height: 75px; text-align:center;line-height:75px;\" id=\"previewImage\">暂无图片</div>\r\n");
	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");
	templateBuilder.Append("	<!--编辑器代码段开始-->\r\n");

	templateBuilder.Append("<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(rooturl.ToString());
	templateBuilder.Append("javascript/bbcode.js\" reload=\"1\" ></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(rooturl.ToString());
	templateBuilder.Append("javascript/ajax.js\" reload=\"1\" ></");
	templateBuilder.Append("script>\r\n");

	if (infloat==1)
	{
	templateBuilder.Append(link.ToString());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("<script type=\"text/javascript\" reload=\"1\" >\r\n");
	templateBuilder.Append("	var infloat = ");
	templateBuilder.Append(infloat.ToString());
	templateBuilder.Append(";\r\n");
	templateBuilder.Append("	var InFloat_Editor = 'floatlayout_");
	templateBuilder.Append(action.ToString());
	templateBuilder.Append("';\r\n");
	templateBuilder.Append("	var editoraction = '");
	templateBuilder.Append(action.ToString());
	templateBuilder.Append("';\r\n");
	templateBuilder.Append("	var lang	= new Array();\r\n");
	templateBuilder.Append("	lang['post_discuzcode_code'] = '请输入要插入的代码';\r\n");
	templateBuilder.Append("	lang['post_discuzcode_quote'] = '请输入要插入的引用';\r\n");
	templateBuilder.Append("	lang['post_discuzcode_free'] = '请输入要插入的免费信息';\r\n");
	templateBuilder.Append("	lang['post_discuzcode_hide'] = '请输入要插入的隐藏内容';\r\n");
	templateBuilder.Append("	lang['board_allowed'] = '系统限制';\r\n");
	templateBuilder.Append("	lang['lento'] = '到';\r\n");
	templateBuilder.Append("	lang['bytes'] = '字节';\r\n");
	templateBuilder.Append("	lang['post_curlength'] = '当前长度';\r\n");
	templateBuilder.Append("	lang['post_title_and_message_isnull'] = '请完成标题或内容栏。';\r\n");
	templateBuilder.Append("	lang['post_title_toolong'] = '您的标题超过 60 个字符的限制。';\r\n");
	templateBuilder.Append("	lang['post_message_length_invalid'] = '您的帖子长度不符合要求。';\r\n");
	templateBuilder.Append("	lang['post_type_isnull'] = '请选择主题对应的分类。';\r\n");
	templateBuilder.Append("	lang['post_reward_credits_null'] = '对不起，您输入悬赏积分。';\r\n");
	templateBuilder.Append("	lang['post_attachment_ext_notallowed']	= '对不起，不支持上传此类扩展名的附件。';\r\n");
	templateBuilder.Append("	lang['post_attachment_img_invalid']		= '无效的图片文件。';\r\n");
	templateBuilder.Append("	lang['post_attachment_deletelink']		= '删除';\r\n");
	templateBuilder.Append("	lang['post_attachment_insert']			= '点击这里将本附件插入帖子内容中当前光标的位置';\r\n");
	templateBuilder.Append("	lang['post_attachment_insertlink']		= '插入';\r\n");
	templateBuilder.Append("	lang['enter_list_item']			= \"输入一个列表项目.\\r\\n留空或者点击取消完成此列表.\";\r\n");
	templateBuilder.Append("	lang['enter_link_url']			= \"请输入链接的地址:\";\r\n");
	templateBuilder.Append("	lang['enter_image_url']			= \"请输入图片链接地址:\";\r\n");
	templateBuilder.Append("	lang['enter_email_link']		= \"请输入此链接的邮箱地址:\";\r\n");
	templateBuilder.Append("	lang['fontname']				= \"字体\";\r\n");
	templateBuilder.Append("	lang['fontsize']				= \"大小\";\r\n");
	templateBuilder.Append("	lang['post_advanceeditor']		= \"全部功能\";\r\n");
	templateBuilder.Append("	lang['post_simpleeditor']		= \"简单功能\";\r\n");
	templateBuilder.Append("	lang['submit']					= \"提交\";\r\n");
	templateBuilder.Append("	lang['cancel']					= \"取消\";\r\n");
	templateBuilder.Append("	lang['post_autosave_none'] = \"没有可以恢复的数据\";\r\n");
	templateBuilder.Append("	lang['post_autosave_confirm'] = \"本操作将覆盖当前帖子内容，确定要恢复数据吗？\";\r\n");
	templateBuilder.Append("	lang['enter_tag_option']		= \"请输入 %1 标签的选项:\";\r\n");
	templateBuilder.Append("	lang['enter_table_rows']		= \"请输入行数，最多 30 行:\";\r\n");
	templateBuilder.Append("	lang['enter_table_columns']		= \"请输入列数，最多 30 列:\";\r\n");
	templateBuilder.Append("	var editorcss = 'templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/editor.css';\r\n");
	templateBuilder.Append("	var typerequired = parseInt('0');\r\n");
	templateBuilder.Append("	var seccodecheck = parseInt('0');\r\n");
	templateBuilder.Append("	var secqaacheck = parseInt('0');\r\n");
	templateBuilder.Append("	var special = 1;\r\n");

	if (special=="")
	{

	templateBuilder.Append("	special = 0;\r\n");

	}	//end if

	templateBuilder.Append("	var isfirstpost = 0;\r\n");

	if (isfirstpost)
	{

	templateBuilder.Append("	isfirstpost = 1;\r\n");

	}	//end if

	templateBuilder.Append("	var allowposttrade = parseInt('1');\r\n");
	templateBuilder.Append("	var allowpostreward = parseInt('1');\r\n");
	templateBuilder.Append("	var allowpostactivity = parseInt('1');\r\n");
	templateBuilder.Append("	var bbinsert = parseInt('1');\r\n");
	templateBuilder.Append("	var editorid = '");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("';\r\n");
	templateBuilder.Append("	var allowhtml = parseInt('");
	templateBuilder.Append(htmlon.ToString());
	templateBuilder.Append("');\r\n");
	templateBuilder.Append("	var forumallowhtml = parseInt('1');\r\n");
	templateBuilder.Append("	var allowsmilies = 1 - parseInt('");
	templateBuilder.Append(smileyoff.ToString());
	templateBuilder.Append("');\r\n");
	templateBuilder.Append("	var allowbbcode = parseInt('");
	templateBuilder.Append(usergroupinfo.Allowcusbbcode.ToString().Trim());
	templateBuilder.Append("') == 1 && parseInt('");
	templateBuilder.Append(forum.Allowbbcode.ToString().Trim());
	templateBuilder.Append("') == 1;\r\n");
	templateBuilder.Append("	var allowimgcode = parseInt('");
	templateBuilder.Append(forum.Allowimgcode.ToString().Trim());
	templateBuilder.Append("');\r\n");
	templateBuilder.Append("	var wysiwyg = (is_ie || is_moz || (is_opera && opera.version() >= 9)) && parseInt('");
	templateBuilder.Append(config.Defaulteditormode.ToString().Trim());
	templateBuilder.Append("') && allowbbcode == 1 ? 1 : 0;//bbinsert == 1 ? 1 : 0;\r\n");
	templateBuilder.Append("	var allowswitcheditor = parseInt('");
	templateBuilder.Append(config.Allowswitcheditor.ToString().Trim());
	templateBuilder.Append("') && allowbbcode == 1 ;\r\n");
	templateBuilder.Append("	var custombbcodes = { ");
	templateBuilder.Append(Caches.GetCustomEditButtonList().ToString().Trim());
	templateBuilder.Append(" };\r\n");
	templateBuilder.Append("	var smileyinsert = parseInt('1');\r\n");
	templateBuilder.Append("	var smiliesCount = 32;//显示表情总数\r\n");
	templateBuilder.Append("	var colCount = 8; //每行显示表情个数\r\n");
	templateBuilder.Append("	var title = \"\";				   //标题\r\n");
	templateBuilder.Append("	var showsmiliestitle = 1;        //是否显示标题（0不显示 1显示）\r\n");
	templateBuilder.Append("	var smiliesIsCreate = 0;		   //编辑器是否已被创建(0否，1是）\r\n");
	templateBuilder.Append("	var smilies_HASH = {};//得到表情符号信息\r\n");
	templateBuilder.Append("	var maxpolloptions = parseInt('");
	templateBuilder.Append(config.Maxpolloptions.ToString().Trim());
	templateBuilder.Append("');\r\n");
	templateBuilder.Append("	function alloweditorhtml() {\r\n");
	templateBuilder.Append("		if($('htmlon').checked) {\r\n");
	templateBuilder.Append("			allowhtml = 1;\r\n");
	templateBuilder.Append("			forumallowhtml = 1;\r\n");
	templateBuilder.Append("		} else {\r\n");
	templateBuilder.Append("			allowhtml = 0;\r\n");
	templateBuilder.Append("			forumallowhtml = 0;\r\n");
	templateBuilder.Append("		}\r\n");
	templateBuilder.Append("	}\r\n");
	templateBuilder.Append("</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<input type=\"hidden\" name=\"wysiwyg\" id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_mode\" value=\"");
	templateBuilder.Append(config.Defaulteditormode.ToString().Trim());
	templateBuilder.Append("\" />\r\n");
	templateBuilder.Append("<div id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_controls\" class=\"editorrow\">\r\n");
	templateBuilder.Append("	<div class=\"editor\">\r\n");
	templateBuilder.Append("		<a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_switcher\" class=\"plugeditor editormode\"><input type=\"checkbox\" name=\"checkbox\" value=\"0\" \r\n");

	if (config.Defaulteditormode==0)
	{

	templateBuilder.Append(" checked=\"checked\"\r\n");

	}	//end if

	templateBuilder.Append(" onclick=\"switchEditor(this.checked?0:1)\"/>源码</a>\r\n");
	templateBuilder.Append("		<div class=\"editorbtn\" id=\"editorbtn\">\r\n");
	templateBuilder.Append("			<a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_bold\" title=\"粗体\" href=\"javascript:;\"></a>\r\n");
	templateBuilder.Append("			<a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_simple\" title=\"粗体 斜体 下划线\" href=\"javascript:;\"></a>\r\n");
	templateBuilder.Append("			<a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_fontname\" title=\"字体\" href=\"javascript:;\"></a>\r\n");
	templateBuilder.Append("			<a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_fontsize\" title=\"大小\" href=\"javascript:;\"></a>\r\n");
	templateBuilder.Append("			<a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_forecolor\" title=\"颜色\" href=\"javascript:;\"></a>\r\n");
	templateBuilder.Append("			<a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_justify\" title=\"对齐\" href=\"javascript:;\"></a>\r\n");
	templateBuilder.Append("			<a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_createlink\" title=\"链接\" href=\"javascript:;\"></a>\r\n");
	templateBuilder.Append("			<a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_email\" title=\"Email\" href=\"javascript:;\"></a>\r\n");
	templateBuilder.Append("			<a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_insertimage\" title=\"图片\" href=\"javascript:;\"></a>\r\n");
	templateBuilder.Append("			<a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_quote\" title=\"引用\" href=\"javascript:;\"></a>\r\n");
	templateBuilder.Append("			<a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_code\" title=\"代码\" href=\"javascript:;\"></a>\r\n");
	templateBuilder.Append("			<a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_list\" title=\"列表\" href=\"javascript:;\"></a>\r\n");
	templateBuilder.Append("			<a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_dent\" title=\"缩进\" href=\"javascript:;\"></a>\r\n");
	templateBuilder.Append("			<a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_float\" title=\"浮动\" href=\"javascript:;\"></a>\r\n");
	templateBuilder.Append("			<a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_table\" title=\"表格\" style=\"display: none;\" href=\"javascript:;\"></a>\r\n");
	templateBuilder.Append("			<a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_free\" title=\"免费信息\" href=\"javascript:;\"></a>\r\n");
	templateBuilder.Append("			<a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_hide\" title=\"隐藏内容\" href=\"javascript:;\"></a>\r\n");

	if (config.Smileyinsert==1)
	{

	templateBuilder.Append("			<a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_smilies\" title=\"表情\" href=\"javascript:;\"></a>\r\n");

	}	//end if

	templateBuilder.Append("			<a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_media\" title=\"多媒体\" href=\"javascript:;\"></a>\r\n");
	templateBuilder.Append("			<a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_tools\" title=\"工具\" href=\"javascript:;\"></a>\r\n");
	templateBuilder.Append("		</div>\r\n");
	templateBuilder.Append("		<script type=\"text/javascript\" reload=\"1\">\r\n");
	templateBuilder.Append("			//自定义按扭显示\r\n");
	templateBuilder.Append("			if(typeof(custombbcodes) != 'undefined') {\r\n");
	templateBuilder.Append("				for (var id in custombbcodes){\r\n");
	templateBuilder.Append("					if (custombbcodes[id][1] == '')\r\n");
	templateBuilder.Append("						continue;\r\n");
	templateBuilder.Append("					var btn = document.createElement(\"a\");\r\n");
	templateBuilder.Append("					btn.id = \"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_custom\" + custombbcodes[id][5] + \"_\" + custombbcodes[id][0];\r\n");
	templateBuilder.Append("					btn.className = \"customedit\";\r\n");
	templateBuilder.Append("					btn.innerHTML = '<img title=\"' + custombbcodes[id][2] + '\" alt=\"' + custombbcodes[id][2] + '\" src = \"");
	templateBuilder.Append(rooturl.ToString());
	templateBuilder.Append("editor/images/' + custombbcodes[id][1] + '\" />';\r\n");
	templateBuilder.Append("					$(\"editorbtn\").appendChild(btn);\r\n");
	templateBuilder.Append("				}\r\n");
	templateBuilder.Append("			}\r\n");
	templateBuilder.Append("		</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("	<div class=\"editortoolbar\">\r\n");
	templateBuilder.Append("		<div class=\"popupmenu_popup fontstyle_menu\" id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_simple_menu\" style=\"display: none\">\r\n");
	templateBuilder.Append("		<ul unselectable=\"on\">\r\n");
	templateBuilder.Append("			<li><a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_italic\" title=\"斜体\">斜体</a></li>\r\n");
	templateBuilder.Append("			<li><a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_underline\" title=\"下划线\">下划线</a></li>\r\n");
	templateBuilder.Append("		</ul>\r\n");
	templateBuilder.Append("		</div>\r\n");
	string fontoptions = "仿宋_GB2312,黑体,楷体_GB2312,宋体,新宋体,微软雅黑,TrebuchetMS,Tahoma,Arial,Impact,Verdana,TimesNewRoman";
	
	templateBuilder.Append("		<div class=\"popupmenu_popup fontname_menu\" id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_fontname_menu\" style=\"display: none\">\r\n");
	templateBuilder.Append("		<ul unselectable=\"on\">\r\n");

	int fontname__loop__id=0;
	foreach(string fontname in fontoptions.Split(comma))
	{
		fontname__loop__id++;

	templateBuilder.Append("			<li onclick=\"discuzcode('fontname', '");
	templateBuilder.Append(fontname.ToString());
	templateBuilder.Append("')\" style=\"font-family: ");
	templateBuilder.Append(fontname.ToString());
	templateBuilder.Append("\" unselectable=\"on\">");
	templateBuilder.Append(fontname.ToString());
	templateBuilder.Append("</li>\r\n");

	}	//end loop

	templateBuilder.Append("		</ul>\r\n");
	templateBuilder.Append("		</div>\r\n");
	string sizeoptions = "1,2,3,4,5,6,7";
	
	templateBuilder.Append("		<div class=\"popupmenu_popup fontsize_menu\" id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_fontsize_menu\" style=\"display: none\">\r\n");
	templateBuilder.Append("		<ul unselectable=\"on\">\r\n");

	int size__loop__id=0;
	foreach(string size in sizeoptions.Split(comma))
	{
		size__loop__id++;

	templateBuilder.Append("			<li onclick=\"discuzcode('fontsize', ");
	templateBuilder.Append(size.ToString());
	templateBuilder.Append(")\" unselectable=\"on\"><font size=\"");
	templateBuilder.Append(size.ToString());
	templateBuilder.Append("\" unselectable=\"on\">");
	templateBuilder.Append(size.ToString());
	templateBuilder.Append("</font></li>\r\n");

	}	//end loop

	templateBuilder.Append("		</ul>\r\n");
	templateBuilder.Append("		</div>\r\n");
	string coloroptions = "Black,Sienna,DarkOliveGreen,DarkGreen,DarkSlateBlue,Navy,Indigo,DarkSlateGray,DarkRed,DarkOrange,Olive,Green,Teal,Blue,SlateGray,DimGray,Red,SandyBrown,YellowGreen,SeaGreen,MediumTurquoise,RoyalBlue,Purple,Gray,Magenta,Orange,Yellow,Lime,Cyan,DeepSkyBlue,DarkOrchid,Silver,Pink,Wheat,LemonChiffon,PaleGreen,PaleTurquoise,LightBlue,Plum,White";
	
	templateBuilder.Append("		<div class=\"popupmenu_popup\" id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_forecolor_menu\" style=\"display: none\">\r\n");
	templateBuilder.Append("		<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" unselectable=\"on\" style=\"width: auto;\">\r\n");
	templateBuilder.Append("		<tr>\r\n");

	int colorname__loop__id=0;
	foreach(string colorname in coloroptions.Split(comma))
	{
		colorname__loop__id++;

	templateBuilder.Append("			<td class=\"editor_colornormal\" onclick=\"discuzcode('forecolor', '");
	templateBuilder.Append(colorname.ToString());
	templateBuilder.Append("')\" unselectable=\"on\"><div style=\"background-color: ");
	templateBuilder.Append(colorname.ToString());
	templateBuilder.Append("\" unselectable=\"on\"></div></td>\r\n");

	if (colorname__loop__id%8==0)
	{

	templateBuilder.Append("</tr><tr>\r\n");

	}	//end if


	}	//end loop

	templateBuilder.Append("		</tr>\r\n");
	templateBuilder.Append("		</table>\r\n");
	templateBuilder.Append("		</div>\r\n");
	templateBuilder.Append("		<div class=\"popupmenu_popup\" id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_justify_menu\" style=\"display: none\">\r\n");
	templateBuilder.Append("		<ul unselectable=\"on\">\r\n");
	templateBuilder.Append("			<li><a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_justifyleft\" title=\"居左\">居左</a></li>\r\n");
	templateBuilder.Append("			<li><a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_justifycenter\" title=\"居中\">居中</a></li>\r\n");
	templateBuilder.Append("			<li><a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_justifyright\" title=\"居右\">居右</a></li>\r\n");
	templateBuilder.Append("		</ul>\r\n");
	templateBuilder.Append("		</div>\r\n");

	if (config.Smileyinsert==1)
	{

	templateBuilder.Append("		<div class=\"smilies popupmenu_popup\" id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_smilies_menu\" style=\"display: none;width:320px;\">\r\n");

	templateBuilder.Append("<div class=\"smilieslist\">\r\n");
	string defaulttypname = string.Empty;
	
	templateBuilder.Append("	<div id=\"smiliesdiv\">\r\n");
	templateBuilder.Append("		<div class=\"smiliesgroup\" style=\"margin-right: 0pt;\">\r\n");
	templateBuilder.Append("			<ul>\r\n");

	int stype__loop__id=0;
	foreach(DataRow stype in Caches.GetSmilieTypesCache().Rows)
	{
		stype__loop__id++;


	if (stype__loop__id==1)
	{

	 defaulttypname = stype["code"].ToString().Trim();
	

	}	//end if


	if (stype__loop__id==1)
	{

	templateBuilder.Append("				<li id=\"t_s_" + stype__loop__id.ToString() + "\"><a id=\"s_" + stype__loop__id.ToString() + "\" hidefocus=\"true\" href=\"javascript:;\" onclick=\"showsmiles(" + stype__loop__id.ToString() + ", '" + stype["code"].ToString().Trim() + "');\" class=\"current\">" + stype["code"].ToString().Trim() + "</a></li>\r\n");

	}
	else
	{

	templateBuilder.Append("				<li id=\"t_s_" + stype__loop__id.ToString() + "\"><a id=\"s_" + stype__loop__id.ToString() + "\" hidefocus=\"true\" href=\"javascript:;\" onclick=\"showsmiles(" + stype__loop__id.ToString() + ", '" + stype["code"].ToString().Trim() + "');\">" + stype["code"].ToString().Trim() + "</a></li>\r\n");

	}	//end if


	}	//end loop

	templateBuilder.Append("			</ul>\r\n");
	templateBuilder.Append("		 </div>\r\n");
	templateBuilder.Append("		 <div style=\"clear: both;\" class=\"float_typeid\" id=\"showsmilie\"></div>\r\n");
	templateBuilder.Append("		 <table class=\"smilieslist_table\" id=\"s_preview_table\" style=\"display: none\"><tr><td class=\"smilieslist_preview\" id=\"s_preview\"></td></tr></table>\r\n");
	templateBuilder.Append("		 <div id=\"showsmilie_pagenum\" class=\"smilieslist_page\">&nbsp;</div>\r\n");
	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("<script src=\"javascript/post.js\" type=\"text/javascript\" reload=\"1\"></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\" reload=\"1\">\r\n");
	templateBuilder.Append("	function getSmilies(func){\r\n");
	templateBuilder.Append("		if($('showsmilie').innerHTML !='' && $('showsmilie').innerHTML != '正在加载表情...')\r\n");
	templateBuilder.Append("			return;\r\n");
	templateBuilder.Append("		var c = \"");
	templateBuilder.Append(forumpath.ToString());
	templateBuilder.Append("tools/ajax.aspx?t=smilies\";\r\n");
	templateBuilder.Append("		_sendRequest(c,function(d){var e={};try{e=eval(\"(\"+d+\")\")}catch(f){e={}}var h=e?e:null;func(h);e=null;func=null},false,true);\r\n");
	templateBuilder.Append("		setTimeout(\"if($('showsmilie').innerHTML=='')$('showsmilie').innerHTML = '正在加载表情...'\", 2000);\r\n");
	templateBuilder.Append("	}\r\n");
	templateBuilder.Append("	function getSmilies_callback(obj) {\r\n");
	templateBuilder.Append("		smilies_HASH = obj; \r\n");
	templateBuilder.Append("		showsmiles(1, '");
	templateBuilder.Append(defaulttypname.ToString());
	templateBuilder.Append("');\r\n");
	templateBuilder.Append("	}\r\n");
	templateBuilder.Append("	_attachEvent($('");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_smilies'), 'click', function(){\r\n");
	templateBuilder.Append("		getSmilies(getSmilies_callback);\r\n");
	templateBuilder.Append("	});\r\n");
	templateBuilder.Append("</");
	templateBuilder.Append("script>\r\n");


	templateBuilder.Append("		</div>\r\n");

	}	//end if

	templateBuilder.Append("		<div class=\"popupmenu_popup\" id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_dent_menu\" style=\"display: none\">\r\n");
	templateBuilder.Append("		<ul unselectable=\"on\">\r\n");
	templateBuilder.Append("			<li><a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_indent\" title=\"增加缩进\">增加缩进</a></li>\r\n");
	templateBuilder.Append("			<li><a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_outdent\" title=\"减少缩进\">减少缩进</a></li>\r\n");
	templateBuilder.Append("		</ul>\r\n");
	templateBuilder.Append("		</div>\r\n");
	templateBuilder.Append("		<div class=\"popupmenu_popup\" id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_float_menu\" style=\"display: none\">\r\n");
	templateBuilder.Append("		<ul unselectable=\"on\">\r\n");
	templateBuilder.Append("			<li><a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_floatleft\" title=\"左浮动\">左浮动</a></li>\r\n");
	templateBuilder.Append("			<li><a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_floatright\" title=\"右浮动\">右浮动</a></li>\r\n");
	templateBuilder.Append("		</ul>\r\n");
	templateBuilder.Append("		</div>\r\n");
	templateBuilder.Append("		<div class=\"popupmenu_popup\" id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_list_menu\" style=\"display: none\">\r\n");
	templateBuilder.Append("		<ul unselectable=\"on\">\r\n");
	templateBuilder.Append("			<li><a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_insertorderedlist\" title=\"排序的列表\">排序的列表</a></li>\r\n");
	templateBuilder.Append("			<li><a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_insertunorderedlist\" title=\"未排序的列表\">未排序的列表</a></li>\r\n");
	templateBuilder.Append("		</ul>\r\n");
	templateBuilder.Append("		</div>\r\n");
	templateBuilder.Append("		<div class=\"popupmenu_popup\" id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_hide_menu\" style=\"display: none\">\r\n");
	templateBuilder.Append("		<ul unselectable=\"on\">\r\n");

	if (usergroupinfo.Allowhidecode==1)
	{

	templateBuilder.Append("<li><a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_hide\" title=\"隐藏内容\">隐藏内容</a></li>\r\n");

	}	//end if

	templateBuilder.Append("			<li><a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_table\" title=\"表格\">表格</a></li>\r\n");
	templateBuilder.Append("			<li><a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_free\" title=\"免费信息\">免费信息</a></li>\r\n");
	templateBuilder.Append("		</ul>\r\n");
	templateBuilder.Append("		</div>\r\n");
	templateBuilder.Append("		<div class=\"popupmenu_popup\" id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_tools_menu\" style=\"display: none\">\r\n");
	templateBuilder.Append("		<ul unselectable=\"on\">\r\n");
	templateBuilder.Append("			<li><a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_removeformat\" title=\"清除文本格式\">清除文本格式</a></li>\r\n");
	templateBuilder.Append("			<li><a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_unlink\" title=\"移除链接\">移除链接</a></li>\r\n");
	templateBuilder.Append("			<li><a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_undo\" title=\"撤销\">撤销</a></li>\r\n");
	templateBuilder.Append("			<li><a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_redo\" title=\"重做\">重做</a></li>\r\n");
	templateBuilder.Append("			<li><a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_checklength\" title=\"字数检查\">字数检查</a></li>\r\n");
	templateBuilder.Append("			<li><a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_clearcontent\" title=\"清空内容\">清空内容</a></li>\r\n");
	templateBuilder.Append("			<br />\r\n");
	templateBuilder.Append("			<li><a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_autosave\" title=\"自动保存\">自动保存<em id=\"autsavet\">(60秒)</em></a></li>\r\n");
	templateBuilder.Append("			<li><a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_saveData\" title=\"保存数据\">保存数据</a></li>\r\n");
	templateBuilder.Append("			<li><a id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_loadData\" title=\"恢复数据\">恢复数据</a></li>\r\n");
	templateBuilder.Append("		</ul>\r\n");
	templateBuilder.Append("		</div>\r\n");
	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("<div class=\"newediter\">\r\n");
	templateBuilder.Append("	<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\" style=\"table-layout:fixed\">\r\n");
	templateBuilder.Append("		<tr>\r\n");
	templateBuilder.Append("			<td>\r\n");

	if (infloat==0)
	{

	templateBuilder.Append("			<textarea class=\"autosave max\" name=\"message\" id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_textarea\" tabindex=\"1\" class=\"txt\" style=\"height:300px\">");
	templateBuilder.Append(message.ToString());
	templateBuilder.Append("</textarea>\r\n");

	}
	else
	{

	templateBuilder.Append("			<textarea class=\"autosave max\" name=\"message\" id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_textarea\" tabindex=\"1\">");
	templateBuilder.Append(message.ToString());
	templateBuilder.Append("</textarea>\r\n");

	}	//end if

	templateBuilder.Append("			</td>\r\n");
	templateBuilder.Append("		</tr>\r\n");
	templateBuilder.Append("	</table>\r\n");
	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\" reload=\"1\" >\r\n");
	templateBuilder.Append("var pagescroll = new pagescroll_class('floatlayout_");
	templateBuilder.Append(action.ToString());
	templateBuilder.Append("', 600, 410);\r\n");

	if (infloat==0)
	{

	templateBuilder.Append("	$('floatlayout_");
	templateBuilder.Append(action.ToString());
	templateBuilder.Append("').scrollLeft = 600;\r\n");

	}	//end if


	if (forum.Applytopictype==1 && topictypeselectoptions!=""&&isfirstpost)
	{

	templateBuilder.Append("	loadselect('typeid', 0, 'floatlayout_");
	templateBuilder.Append(action.ToString());
	templateBuilder.Append("');\r\n");

	}	//end if

	templateBuilder.Append("var editorid = '");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("';\r\n");
	templateBuilder.Append("var textobj = $(editorid + '_textarea');\r\n");
	templateBuilder.Append("var TABLEBG = '#FFF';//'{  WRAPBG  }';\r\n");
	templateBuilder.Append("var uid = parseInt('");
	templateBuilder.Append(userid.ToString());
	templateBuilder.Append("');\r\n");
	templateBuilder.Append("var special = parseInt('0');\r\n");
	templateBuilder.Append("var charset = 'utf-8';\r\n");
	templateBuilder.Append("var thumbwidth = parseInt(400);\r\n");
	templateBuilder.Append("var thumbheight = parseInt(300);\r\n");
	templateBuilder.Append("var extensions = '';\r\n");
	templateBuilder.Append("var fontoptions = new Array(\"仿宋_GB2312\", \"黑体\", \"楷体_GB2312\", \"宋体\", \"新宋体\", \"微软雅黑\", \"Trebuchet MS\", \"Tahoma\", \"Arial\", \"Impact\", \"Verdana\", \"Times New Roman\");\r\n");
	templateBuilder.Append("</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\" reload=\"1\" >\r\n");
	templateBuilder.Append("function messagehandle_");
	templateBuilder.Append(action.ToString());
	templateBuilder.Append("(key) {\r\n");
	templateBuilder.Append("	if(!Editorwin) {\r\n");
	templateBuilder.Append("		$('floatlayout_");
	templateBuilder.Append(action.ToString());
	templateBuilder.Append("').scrollTop = 0;\r\n");

	if (!adveditor)
	{

	templateBuilder.Append("			$('more_1').style.display='none';pagescroll.up(1, '$(\\'more_2\\').style.display=\\'\\';$(\\'custominfoarea\\').style.display=\\'\\'');\r\n");

	}
	else
	{

	templateBuilder.Append("			$('custominfoarea').style.display=$('more_2').style.display='none';pagescroll.up(1, '$(\\'more_1\\').style.display=\\'\\'');\r\n");

	}	//end if

	templateBuilder.Append("	}\r\n");
	templateBuilder.Append("}\r\n");
	templateBuilder.Append("function messagehandle() {\r\n");
	templateBuilder.Append("	messagehandle_");
	templateBuilder.Append(action.ToString());
	templateBuilder.Append("();\r\n");
	templateBuilder.Append("}\r\n");
	templateBuilder.Append("function submithandle_");
	templateBuilder.Append(action.ToString());
	templateBuilder.Append("(locationhref, message) {\r\n");

	if (action=="edit" || action=="reply")
	{

	templateBuilder.Append("		try {\r\n");
	templateBuilder.Append("			var pid = locationhref.lastIndexOf('#pid');\r\n");
	templateBuilder.Append("			if(pid != -1) {\r\n");
	templateBuilder.Append("				pid = locationhref.substr(pid + 4);\r\n");

	if (action=="edit")
	{

	templateBuilder.Append("					if(pid) {\r\n");
	templateBuilder.Append("						ajaxget('viewthread.php?tid=$tid&viewpid=' + pid, 'post_' + pid, 'ajaxwaitid');\r\n");
	templateBuilder.Append("					} else {\r\n");
	templateBuilder.Append("						ajaxget('viewthread.php?tid=$tid&viewpid=$pid', 'post_$pid', 'ajaxwaitid');\r\n");
	templateBuilder.Append("					}\r\n");
	templateBuilder.Append("					$('postform').editsubmit.disabled = false;\r\n");

	}
	else if (action=="reply")
	{

	templateBuilder.Append("					ajaxget('viewthread.php?tid=$tid&viewpid=' + pid, 'post_new', 'ajaxwaitid', '', null, 'appendreply()');\r\n");
	templateBuilder.Append("					if(replyreload) {\r\n");
	templateBuilder.Append("						var reloadpids = replyreload.split(',');\r\n");
	templateBuilder.Append("						for(i = 1;i < reloadpids.length;i++) {\r\n");
	templateBuilder.Append("							ajaxget('viewthread.php?tid=$tid&viewpid=' + reloadpids[i], 'post_' + reloadpids[i]);\r\n");
	templateBuilder.Append("						}\r\n");
	templateBuilder.Append("					}\r\n");

	}	//end if

	templateBuilder.Append("			} else {\r\n");
	templateBuilder.Append("				location.href = locationhref;\r\n");
	templateBuilder.Append("			}\r\n");
	templateBuilder.Append("		} catch(e) {\r\n");
	templateBuilder.Append("			location.href = locationhref;\r\n");
	templateBuilder.Append("		}\r\n");

	}
	else if (action=="newthread'")
	{

	templateBuilder.Append("		var hastid = locationhref.lastIndexOf('tid=');\r\n");
	templateBuilder.Append("		if(hastid == -1) {\r\n");
	templateBuilder.Append("			dnotice(message, \"location.href='\" + locationhref + \"'\", 390, 130);\r\n");
	templateBuilder.Append("		} else {\r\n");
	templateBuilder.Append("			location.href = locationhref;\r\n");
	templateBuilder.Append("		}\r\n");

	}	//end if

	templateBuilder.Append("	floatwinreset = 1;\r\n");
	templateBuilder.Append("	closeEditorwin();\r\n");
	templateBuilder.Append("}\r\n");
	templateBuilder.Append("function cedit() {\r\n");
	templateBuilder.Append("	try {\r\n");
	templateBuilder.Append("		loadData(1);\r\n");
	templateBuilder.Append("	} catch(e) {\r\n");
	templateBuilder.Append("		setTimeout('cedit()', 1000);\r\n");
	templateBuilder.Append("	}\r\n");
	templateBuilder.Append("}\r\n");
	templateBuilder.Append("function openEditor() {\r\n");
	templateBuilder.Append("	try {\r\n");

	if (action=="reply" && message=="")
	{


	}	//end if


	if (action=="edit" || action=="reply"&&DNTRequest.GetString("quote")=="yes")
	{

	templateBuilder.Append("		if(wysiwyg) {\r\n");
	templateBuilder.Append("			initialized = false;\r\n");
	templateBuilder.Append("			newEditor(1, bbcode2html(textobj.value));\r\n");
	templateBuilder.Append("		} else {\r\n");
	templateBuilder.Append("			newEditor(0);\r\n");
	templateBuilder.Append("		}\r\n");
	templateBuilder.Append("		setCaretAtEnd();\r\n");

	}
	else
	{

	templateBuilder.Append("		newEditor(wysiwyg);\r\n");
	templateBuilder.Append("		if(editbox) {\r\n");
	templateBuilder.Append("			editbox.className = 'autosave max';\r\n");
	templateBuilder.Append("		}\r\n");

	}	//end if

	templateBuilder.Append("	} catch(e) {\r\n");
	templateBuilder.Append("		setTimeout('openEditor()', 100);\r\n");
	templateBuilder.Append("		return;\r\n");
	templateBuilder.Append("	}\r\n");
	templateBuilder.Append("	if(!$('floatlayout_");
	templateBuilder.Append(action.ToString());
	templateBuilder.Append("').scrollLeft) {\r\n");
	templateBuilder.Append("		$('floatlayout_");
	templateBuilder.Append(action.ToString());
	templateBuilder.Append("').scrollLeft = 600;\r\n");
	templateBuilder.Append("	}\r\n");
	templateBuilder.Append("	// 需要开启tools\r\n");
	templateBuilder.Append("	if(!getcookie('disableautosave')) {\r\n");
	templateBuilder.Append("		clearInterval(autosaveDatai);\r\n");
	templateBuilder.Append("		autosaveData(1);\r\n");
	templateBuilder.Append("	}\r\n");
	templateBuilder.Append("	if(is_ie >= 5 || is_moz >= 2) {\r\n");
	templateBuilder.Append("		window.onbeforeunload = function () {\r\n");
	templateBuilder.Append("			try {\r\n");
	templateBuilder.Append("				saveData(wysiwyg ? editdoc.body.innerHTML : textobj.value);\r\n");
	templateBuilder.Append("			} catch(e) {}\r\n");
	templateBuilder.Append("		};\r\n");
	templateBuilder.Append("	}\r\n");
	templateBuilder.Append("}\r\n");
	templateBuilder.Append("</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(rooturl.ToString());
	templateBuilder.Append("javascript/post.js\" reload=\"1\" ></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(rooturl.ToString());
	templateBuilder.Append("javascript/editor.js\" reload=\"1\" ></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(rooturl.ToString());
	templateBuilder.Append("javascript/post_editor.js\" reload=\"1\" ></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<!--{if $forum['allowmediacode']}-->\r\n");
	templateBuilder.Append("<div class=\"popupmenu_popup\" id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_popup_media_menu\" style=\"width: 280px;display: none\" unselectable=\"on\">\r\n");
	templateBuilder.Append("<input type=\"hidden\" id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_mediatype\" value=\"ra\">\r\n");
	templateBuilder.Append("<table cellpadding=\"4\" cellspacing=\"0\" border=\"0\">\r\n");
	templateBuilder.Append("	<tr class=\"popupmenu_option\">\r\n");
	templateBuilder.Append("		<td nowrap>\r\n");
	templateBuilder.Append("			请输入在线视频的地址:<br />\r\n");
	templateBuilder.Append("			<input id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_mediaurl\" style=\"width: 98%\" value=\"\" onkeyup=\"setmediatype('");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("')\" class=\"txt\" />\r\n");
	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	<tr class=\"popupmenu_option\">\r\n");
	templateBuilder.Append("		<td nowrap>\r\n");
	templateBuilder.Append("			<label style=\"float: left; width: 32%\"><input type=\"radio\" name=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_mediatyperadio\" id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_mediatyperadio_ra\" onclick=\"$('");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_mediatype').value = 'ra'\" checked=\"checked\">RA</label>\r\n");
	templateBuilder.Append("			<label style=\"float: left; width: 32%\"><input type=\"radio\" name=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_mediatyperadio\" id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_mediatyperadio_wma\" onclick=\"$('");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_mediatype').value = 'wma'\">WMA</label>\r\n");
	templateBuilder.Append("			<label style=\"float: left; width: 32%\"><input type=\"radio\" name=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_mediatyperadio\" id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_mediatyperadio_mp3\" onclick=\"$('");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_mediatype').value = 'mp3'\">MP3</label>\r\n");
	templateBuilder.Append("			<label style=\"float: left; width: 32%\"><input type=\"radio\" name=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_mediatyperadio\" id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_mediatyperadio_rm\" onclick=\"$('");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_mediatype').value = 'rm'\">RM/RMVB</label>\r\n");
	templateBuilder.Append("			<label style=\"float: left; width: 32%\"><input type=\"radio\" name=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_mediatyperadio\" id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_mediatyperadio_wmv\" onclick=\"$('");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_mediatype').value = 'wmv'\">WMV</label>\r\n");
	templateBuilder.Append("			<label style=\"float: left; width: 32%\"><input type=\"radio\" name=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_mediatyperadio\" id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_mediatyperadio_mov\" onclick=\"$('");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_mediatype').value = 'mov'\">MOV</label>\r\n");
	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	<tr class=\"popupmenu_option\">\r\n");
	templateBuilder.Append("		<td nowrap>\r\n");
	templateBuilder.Append("			<label style=\"float: left; width: 32%\">宽度: <input id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_mediawidth\" size=\"5\" value=\"400\" class=\"txt\" /></label>\r\n");
	templateBuilder.Append("			<label style=\"float: left; width: 32%\">高度: <input id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_mediaheight\" size=\"5\" value=\"300\"  class=\"txt\"/></label>\r\n");
	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	<tr class=\"popupmenu_option\">\r\n");
	templateBuilder.Append("		<td align=\"center\" colspan=\"2\"><input type=\"button\" value=\"提交\" onclick=\"setmediacode('");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("')\"> &nbsp; <input type=\"button\" onclick=\"hideMenu()\" value=\"取消\" /></td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("</table>\r\n");
	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("<!--{/if}-->\r\n");
	templateBuilder.Append("<!--{if $_DCACHE['bbcodes_display']['img']}-->\r\n");
	templateBuilder.Append("<div class=\"popupmenu_popup\" id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_insertimage_menu\" style=\"display: none\" unselectable=\"on\">\r\n");
	templateBuilder.Append("		请输入图片地址:<br /><input id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_insertimage_param_url\" style=\"width: 300px;\" value=\"\" class=\"txt\" type=\"text\" onkeydown=\"editorMenuEvent_onkeydown(this);\" />\r\n");
	templateBuilder.Append("		<br /><center><input id=\"");
	templateBuilder.Append(editorid.ToString());
	templateBuilder.Append("_cmd_insertimage_submit\" value=\"提交\" type=\"button\" onclick=\"insertimagesubmit()\" /> &nbsp; <input onclick=\"hideMenu();\" value=\"取消\" type=\"button\" /></center>\r\n");
	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("<!--{/if}-->\r\n");


	templateBuilder.Append("	<!--编辑器代码段结束-->\r\n");
	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<th><label for=\"amount\">总数</label></th>\r\n");
	templateBuilder.Append("		<td>\r\n");
	templateBuilder.Append("			 <input maxlength=\"6\" size=\"5\" value=\"1\" name=\"amount\" id=\"amount\">&nbsp;件\r\n");
	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");
	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<td class=\"navformcommend\"  colspan=\"2\">交易信息</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");
	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<th><label for=\"costprice\">商品原价</label></th>\r\n");
	templateBuilder.Append("		<td>\r\n");
	templateBuilder.Append("			<input id=\"costprice\" maxlength=\"12\" size=\"12\" name=\"costprice\" value=\"1\" type=\"text\">元 \r\n");
	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");
	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<th><label for=\"price\">商品现价</label></th>\r\n");
	templateBuilder.Append("		<td>\r\n");
	templateBuilder.Append("			<input id=\"price\" maxlength=\"12\" size=\"12\" name=\"price\" value=\"1\" type=\"text\" >元 \r\n");
	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");
	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<th><label for=\"locus_1\">所在地点</label></th>\r\n");
	templateBuilder.Append("		<td>								\r\n");
	templateBuilder.Append("			<select class=\"input_gray\" style=\"width: 130px;\"  id=\"locus_1\" name=\"locus_1\"></select>\r\n");
	templateBuilder.Append("			城市:<select class=\"input_gray\" style=\"width: 90px;\" id=\"locus_2\" name=\"locus_2\"></select>\r\n");
	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");
	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<th><label for=\"transport\">物流方式</label></th>\r\n");
	templateBuilder.Append("		<td>\r\n");
	templateBuilder.Append("			<input class=\"radio\" type=\"radio\" name=\"transport\" value=\"0\" tabindex=\"160\"  onclick=\"$('logisticssetting').style.display='none'\" /> 虚拟物品或无需邮递\r\n");
	templateBuilder.Append("			<input class=\"radio\" type=\"radio\" name=\"transport\" value=\"1\" tabindex=\"161\"  onclick=\"$('logisticssetting').style.display=''\" /> 卖家承担运费\r\n");
	templateBuilder.Append("			<input class=\"radio\" type=\"radio\" name=\"transport\" value=\"2\" tabindex=\"162\"  checked=\"checked\" onclick=\"$('logisticssetting').style.display=''\" /> 买家承担运费\r\n");
	templateBuilder.Append("			<input class=\"radio\" type=\"radio\" name=\"transport\" value=\"3\" tabindex=\"163\"  onclick=\"$('logisticssetting').style.display=''\" /> 支付给物流公司\r\n");
	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");
	templateBuilder.Append("	<tbody id=\"logisticssetting\" style=\"display:;\">\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<th><label for=\"postage_mail\">运费</label></th>\r\n");
	templateBuilder.Append("		<td>\r\n");
	templateBuilder.Append("			平邮 <input type=\"text\" id=\"postage_mail\" name=\"postage_mail\" size=\"3\" value=\"\" tabindex=\"164\" /> 元 <em class=\"tips\">(不填表示不提供平邮)</em><br />\r\n");
	templateBuilder.Append("			快递 <input type=\"text\" id=\"postage_express\" name=\"postage_express\" size=\"3\" value=\"\" tabindex=\"165\"  /> 元 <em class=\"tips\">(不填表示不提供快递)</em><br />\r\n");
	templateBuilder.Append("			EMS  <input type=\"text\" id=\"postage_ems\" name=\"postage_ems\" size=\"3\" value=\"\" tabindex=\"166\" /> 元 <em class=\"tips\">(不填表示不提供 EMS)</em><br />\r\n");
	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");
	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<th><label for=\"invoice\">发票</label></th>\r\n");
	templateBuilder.Append("		<td>\r\n");
	templateBuilder.Append("			<input checked=\"checked\" value=\"0\" name=\"invoice\" id=\"invoiceN\" type=\"radio\"><label for=\"invoiceN\">无</label>\r\n");
	templateBuilder.Append("			<input value=\"1\" name=\"invoice\" id=\"invoiceY\" type=\"radio\"><label for=\"invoiceY\">有</label>    	    \r\n");
	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");
	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<th><label for=\"repair\">保修期</label></th>\r\n");
	templateBuilder.Append("		<td>\r\n");
	templateBuilder.Append("			<input type=\"text\"  value=\"\" name=\"repair\" id=\"repair\" > 单位:天, 不填表示不提供保修\r\n");
	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");
	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<td class=\"navformcommend\"  colspan=\"2\">支付宝</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");
	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<th><label for=\"tradetype\">交易方式</label></th>\r\n");
	templateBuilder.Append("		<td> 					\r\n");
	templateBuilder.Append("			<input id=\"tradetype_1\" name=\"tradetype\" onclick=\"$('tradeaccount').style.display = ''\" value=\"1\" type=\"radio\" > 支付宝在线交易\r\n");
	templateBuilder.Append("			<input id=\"tradetype_2\" name=\"tradetype\" onclick=\"$('tradeaccount').style.display = 'none'\" value=\"0\" checked=\"checked\" type=\"radio\"> 线下交易\r\n");
	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");
	templateBuilder.Append("	<tbody id=\"tradeaccount\" style=\"display: none\">\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("	<th><label for=\"account\">支付宝账户</label></th>\r\n");
	templateBuilder.Append("	<td> 	\r\n");
	templateBuilder.Append("		<input type=\"text\" id=\"account\" name=\"account\" size=\"30\" value=\"\" />\r\n");
	templateBuilder.Append("	</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");
	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<td class=\"navformcommend\"  colspan=\"2\"><span style=\"color:#999; font-size:10px; padding-right:2px;\"></span>其它信息</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");
	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<th><label for=\"_now\">开始时间</label></th>\r\n");
	templateBuilder.Append("		<td>\r\n");
	templateBuilder.Append("			<input id=\"serverdatetime\" name=\"serverdatetime\" value=\"");
	templateBuilder.Append(serverdatetime.ToString());
	templateBuilder.Append("\" type=\"hidden\">\r\n");
	templateBuilder.Append("			<input name=\"_now\" value=\"0\" id=\"_now0\" onclick=\"setTimeEnableAndInStock(false, 0)\" type=\"radio\"><label for=\"_now0\">立刻</label>\r\n");
	templateBuilder.Append("			<br>\r\n");
	templateBuilder.Append("			<input name=\"_now\" value=\"1\" id=\"_now1\" onclick=\"setTimeEnableAndInStock(true, 1)\" type=\"radio\"><label for=\"_now1\">设定</label>\r\n");
	templateBuilder.Append("			<select disabled=\"disabled\" id=\"_date\" name=\"_date\" onchange=\"changeDate()\"></select>\r\n");
	templateBuilder.Append("			<select disabled=\"disabled\" id=\"_hour\" name=\"_hour\" onchange=\"changeHour()\"></select>时\r\n");
	templateBuilder.Append("			<select disabled=\"disabled\" id=\"_minute\" name=\"_minute\" onchange=\"setMinute()\"></select>分\r\n");
	templateBuilder.Append("			<span class=\"posttip\" style=\"font-size: 12px;\" id=\"durainfo\">您可以设定商品的正式开始销售时间</span>\r\n");
	templateBuilder.Append("			<br>\r\n");
	templateBuilder.Append("			<input name=\"_now\" value=\"2\" id=\"inStock\" onclick=\"setTimeEnableAndInStock(false, 2)\" type=\"radio\"><label for=\"inStock\">暂不设置</label>\r\n");
	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");
	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<th><label for=\"expiration\">有效期至</label></th>\r\n");
	templateBuilder.Append("		<td> \r\n");
	templateBuilder.Append("			<input name=\"expiration\" type=\"text\" id=\"expiration\" size=\"10\" value=\"");
	templateBuilder.Append(expiration.ToString());
	templateBuilder.Append("\" style=\"cursor:default\" onClick=\"showcalendar(event, 'expiration', 'cal_startdate', 'cal_enddate', '");
	templateBuilder.Append(expiration.ToString());
	templateBuilder.Append("');\" readonly=\"readonly\" /></span>\r\n");
	templateBuilder.Append("			<input type=\"hidden\" name=\"cal_startdate\" id=\"cal_startdate\" size=\"10\"  value=\"");
	templateBuilder.Append(expiration.ToString());
	templateBuilder.Append("\">\r\n");
	templateBuilder.Append("			<input type=\"hidden\" name=\"cal_enddate\" id=\"cal_enddate\" size=\"10\"  value=\"\">\r\n");
	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");

	if (enabletag)
	{

	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<th><label for=\"tags\">标签(Tags)</label></th>\r\n");
	templateBuilder.Append("		<td><input type=\"text\" name=\"tags\" id=\"tags\" value=\"\"/><input type=\"button\" onclick=\"relatekw();\" value=\"可用标签\" />(用空格隔开多个标签，最多可填写 5 个)</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");

	}	//end if


	if (config.Enablemall==2)
	{

	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<th><label for=\"recommend\">推荐商品</label></th>\r\n");
	templateBuilder.Append("		<td>\r\n");
	templateBuilder.Append("			<input name=\"recommend\" id=\"recommend\" type=\"checkbox\">\r\n");
	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");

	}	//end if

	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<th><label for=\"displayorder\">上架</label></th>\r\n");
	templateBuilder.Append("		<td>\r\n");
	templateBuilder.Append("			<input name=\"displayorder\" id=\"displayorder\" type=\"checkbox\" checked>\r\n");
	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");

	if (isseccode)
	{

	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<th><label for=\"vcode\">验证码</label></th>\r\n");
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
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");

	}	//end if

	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<th>&nbsp;</th>\r\n");
	templateBuilder.Append("		<td>\r\n");
	templateBuilder.Append("			<input name=\"topicsubmit\" id=\"postsubmit\" value=\"发布商品\" style=\"margin-bottom: -3px; margin-right: 10px;\" type=\"submit\" >\r\n");
	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");
	templateBuilder.Append("</table>\r\n");
	templateBuilder.Append("</form>\r\n");
	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("<script language=\"javascript\" src=\"javascript/goodscategories.js\"></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<script language=\"javascript\" src=\"javascript/locations.js\"></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<script language=\"javascript\" src=\"javascript/template_postgoods.js\"></");
	templateBuilder.Append("script>\r\n");

	}	//end if


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
