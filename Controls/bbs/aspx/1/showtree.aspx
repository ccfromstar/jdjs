<%@ Page language="c#" AutoEventWireup="false" EnableViewState="false" Inherits="Discuz.Web.showtree" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="Discuz.Common" %>
<%@ Import namespace="Discuz.Forum" %>
<%@ Import namespace="Discuz.Entity" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by Discuz!NT Template Engine at 2009/1/15 15:59:22.
		本页面代码由Discuz!NT模板引擎生成于 2009/1/15 15:59:22. 
	*/

	base.OnInit(e);

	templateBuilder.Capacity = 220000;


	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
	templateBuilder.Append("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
	templateBuilder.Append("<head>\r\n");
	templateBuilder.Append("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
	templateBuilder.Append("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=7\" />\r\n");
	templateBuilder.Append(meta.ToString());
	templateBuilder.Append("\r\n");

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

	templateBuilder.Append("<link rel=\"icon\" href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("favicon.ico\" type=\"image/x-icon\" />\r\n");
	templateBuilder.Append("<link rel=\"shortcut icon\" href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("favicon.ico\" type=\"image/x-icon\" />\r\n");
	templateBuilder.Append("<!-- 调用样式表 -->\r\n");
	templateBuilder.Append("<link rel=\"stylesheet\" href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/dnt.css\" type=\"text/css\" media=\"all\"  />\r\n");
	templateBuilder.Append(link.ToString());
	templateBuilder.Append("\r\n");
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
	templateBuilder.Append("javascript/common.js\"></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("javascript/menu.js\"></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\">\r\n");
	templateBuilder.Append("	var aspxrewrite = ");
	templateBuilder.Append(config.Aspxrewrite.ToString().Trim());
	templateBuilder.Append(";\r\n");
	templateBuilder.Append("</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append(script.ToString());
	templateBuilder.Append("\r\n");
	templateBuilder.Append("</head>\r\n");


	templateBuilder.Append("<body>\r\n");
	templateBuilder.Append("<div id=\"append_parent\"></div><div id=\"ajaxwaitid\"></div>\r\n");
	templateBuilder.Append("<div class=\"wrap\">\r\n");
	templateBuilder.Append("<div id=\"header\">\r\n");
	templateBuilder.Append("	<h2><a href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("index.aspx\" title=\"Discuz!NT|BBS|论坛 - Powered by Discuz!NT\"><img src=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/logo.gif\" alt=\"Discuz! Board NT|BBS|论坛\"/></a>\r\n");
	templateBuilder.Append("	</h2>\r\n");

	if (headerad!="")
	{

	templateBuilder.Append("		<div id=\"ad_headerbanner\">");
	templateBuilder.Append(headerad.ToString());
	templateBuilder.Append("</div>\r\n");

	}	//end if

	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("<div id=\"menu\">\r\n");

	if (config.Isframeshow!=0)
	{

	templateBuilder.Append("	<div class=\"frameswitch\">\r\n");
	templateBuilder.Append("		<script type=\"text/javascript\">\r\n");
	templateBuilder.Append("			if(top == self) {\r\n");
	templateBuilder.Append("			    document.write('<a href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("frame.aspx?f=1\" target=\"_top\">分栏模式<\\/a>');\r\n");
	templateBuilder.Append("			}\r\n");
	templateBuilder.Append("		</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("	</div>\r\n");

	}	//end if

	templateBuilder.Append("	<span class=\"avataonline\">\r\n");

	if (userid==-1)
	{

	templateBuilder.Append("			<a href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("login.aspx\" class=\"reg\">登录</a>\r\n");
	templateBuilder.Append("			<a href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("register.aspx\" class=\"reg\">注册</a>\r\n");

	}
	else
	{


	if (oluserinfo.Newpms>0)
	{

	templateBuilder.Append("			&nbsp;<a href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("usercpinbox.aspx\" class=\"new_info\"><img src=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/message_1.gif\" alt=\"");
	templateBuilder.Append(oluserinfo.Newpms.ToString().Trim());
	templateBuilder.Append("条新短消息\"  title=\"");
	templateBuilder.Append(oluserinfo.Newpms.ToString().Trim());
	templateBuilder.Append("条新短消息\"/></a>&nbsp;\r\n");

	}	//end if

	templateBuilder.Append("			<cite>欢迎:<a class=\"dropmenu\" id=\"viewpro\" onMouseOver=\"showMenu(this.id)\">");
	templateBuilder.Append(username.ToString());
	templateBuilder.Append("</a></cite>\r\n");

	if (oluserinfo.Newnotices>0)
	{

	templateBuilder.Append("			&nbsp;<a href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("usercpnotice.aspx?filter=all\" class=\"new_info\">");
	templateBuilder.Append(oluserinfo.Newnotices.ToString().Trim());
	templateBuilder.Append("个新通知</a>&nbsp;\r\n");

	}	//end if

	templateBuilder.Append("			<a href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("logout.aspx?userkey=");
	templateBuilder.Append(userkey.ToString());
	templateBuilder.Append("\">退出</a>\r\n");

	}	//end if

	templateBuilder.Append("	</span>\r\n");
	templateBuilder.Append("	<ul>\r\n");
	templateBuilder.Append("		");
	templateBuilder.Append(mainnavigation.ToString());
	templateBuilder.Append("\r\n");
	templateBuilder.Append("	</ul>\r\n");
	templateBuilder.Append("</div>\r\n");


	int loopi = 1;
	

	if (page_err==0)
	{


	if (enabletag)
	{

	templateBuilder.Append("<script type=\"text/javascript\" src=\"cache/tag/closedtags.txt\"></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\" src=\"cache/tag/colorfultags.txt\"></");
	templateBuilder.Append("script>\r\n");

	}	//end if

	templateBuilder.Append("<script type=\"text/javascript\" src=\"javascript/ajax.js\"></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\" src=\"javascript/template_showtopic.js\"></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\">\r\n");
	templateBuilder.Append("var templatepath = \"");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("\";\r\n");
	templateBuilder.Append("var postminchars = parseInt(");
	templateBuilder.Append(config.Minpostsize.ToString().Trim());
	templateBuilder.Append(");\r\n");
	templateBuilder.Append("var postmaxchars = parseInt(");
	templateBuilder.Append(config.Maxpostsize.ToString().Trim());
	templateBuilder.Append(");\r\n");
	templateBuilder.Append("var disablepostctrl = parseInt(");
	templateBuilder.Append(disablepostctrl.ToString());
	templateBuilder.Append(");\r\n");
	templateBuilder.Append("var forumpath = \"");
	templateBuilder.Append(forumpath.ToString());
	templateBuilder.Append("\";\r\n");
	templateBuilder.Append("</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<div id=\"foruminfo\">\r\n");
	templateBuilder.Append("	<div id=\"nav\">\r\n");
	templateBuilder.Append("		<a href=\"");
	templateBuilder.Append(config.Forumurl.ToString().Trim());
	templateBuilder.Append("\">");
	templateBuilder.Append(config.Forumtitle.ToString().Trim());
	templateBuilder.Append("</a> &raquo; ");
	templateBuilder.Append(forumnav.ToString());
	templateBuilder.Append(" &raquo; \r\n");
	int ishtmltitle = Topics.GetMagicValue(topic.Magic, MagicType.HtmlTitle);
	

	if (ishtmltitle==1)
	{

	templateBuilder.Append("			<strong>");
	templateBuilder.Append(Topics.GetHtmlTitle(topic.Tid).ToString().Trim());
	templateBuilder.Append("</strong>\r\n");

	}
	else
	{

	templateBuilder.Append("			<strong>");
	templateBuilder.Append(topictitle.ToString());
	templateBuilder.Append("</strong>\r\n");

	}	//end if

	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("	<div id=\"headsearch\">\r\n");
	templateBuilder.Append("		<div id=\"search\">\r\n");

	if (usergroupinfo.Allowsearch>0)
	{


	templateBuilder.Append("			<form method=\"post\" action=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("search.aspx\" target=\"_blank\" onsubmit=\"bind_keyword(this);\">\r\n");
	templateBuilder.Append("				<input type=\"hidden\" name=\"poster\" />\r\n");
	templateBuilder.Append("				<input type=\"hidden\" name=\"keyword\" />\r\n");
	templateBuilder.Append("				<input type=\"hidden\" name=\"type\" value=\"\" />\r\n");
	templateBuilder.Append("				<input id=\"keywordtype\" type=\"hidden\" name=\"keywordtype\" value=\"0\"/>\r\n");
	templateBuilder.Append("				<div id=\"searchbar\">\r\n");
	templateBuilder.Append("					<dl>\r\n");
	templateBuilder.Append("						<dt id=\"quicksearch\" class=\"s2\" onclick=\"showMenu(this.id, false);\" onmouseover=\"MouseCursor(this);\">帖子标题</dt>\r\n");
	templateBuilder.Append("						<dd class=\"textinput\"><input type=\"text\" name=\"keywordf\" value=\"\" class=\"text\"/></dd>\r\n");
	templateBuilder.Append("						<dd><input name=\"searchsubmit\" type=\"submit\" value=\"\" class=\"s3\"/></dd>\r\n");
	templateBuilder.Append("					</dl>\r\n");
	templateBuilder.Append("				</div>\r\n");
	templateBuilder.Append("			</form>\r\n");
	templateBuilder.Append("			<script type=\"text/javascript\">function bind_keyword(form){if(form.keywordtype.value=='8'){form.keyword.value='';form.poster.value=form.keywordf.value; } else { form.poster.value=''; form.keyword.value=form.keywordf.value;if(form.keywordtype.value == '2')form.type.value = 'spacepost';if(form.keywordtype.value == '3')form.type.value = 'album';}}</");
	templateBuilder.Append("script>\r\n");



	}	//end if

	templateBuilder.Append("		</div>\r\n");
	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("</div>\r\n");


	if (pagewordad.Length>0)
	{

	templateBuilder.Append("<!--adtext-->\r\n");
	templateBuilder.Append("<div id=\"ad_text\" class=\"ad_text\">\r\n");
	templateBuilder.Append("	<table cellspacing=\"1\" cellpadding=\"0\" summary=\"Text Ad\">\r\n");
	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("		<tr>\r\n");
	int adindex = 0;
	

	int pageword__loop__id=0;
	foreach(string pageword in pagewordad)
	{
		pageword__loop__id++;


	if (adindex<4)
	{

	templateBuilder.Append("				<td>");
	templateBuilder.Append(pageword.ToString());
	templateBuilder.Append("</td>\r\n");
	 adindex = adindex+1;
	

	}
	else
	{

	templateBuilder.Append("				</tr><tr>\r\n");
	templateBuilder.Append("				<td>");
	templateBuilder.Append(pageword.ToString());
	templateBuilder.Append("</td>\r\n");
	 adindex = 1;
	

	}	//end if


	}	//end loop


	if (pagewordad.Length%4>0)
	{


					for (int j = 0; j < (4 - pagewordad.Length % 4); j++)
					{
				
	templateBuilder.Append("				<td>&nbsp;</td>\r\n");

					}
				

	}	//end if

	templateBuilder.Append("		</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");
	templateBuilder.Append("	</table>\r\n");
	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("<!--adtext-->\r\n");

	}	//end if





	if (newpmcount>0 && showpmhint)
	{

	templateBuilder.Append("<!--短信息 area start-->\r\n");
	templateBuilder.Append("<div class=\"mainbox\">\r\n");

	if (pmsound>0)
	{

	templateBuilder.Append("		<bgsound src=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("sound/pm");
	templateBuilder.Append(pmsound.ToString());
	templateBuilder.Append(".wav\" />\r\n");

	}	//end if

	templateBuilder.Append("	<span class=\"headactions\"><a href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("usercpinbox.aspx\" target=\"_blank\">查看详情</a> <a href=\"###\" onclick=\"document.getElementById('frmnewpm').submit();\">不再提示</a></span>\r\n");
	templateBuilder.Append("	<h3>您有 ");
	templateBuilder.Append(newpmcount.ToString());
	templateBuilder.Append(" 条新的短消息</h3>\r\n");
	templateBuilder.Append("	<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">\r\n");

	int pm__loop__id=0;
	foreach(PrivateMessageInfo pm in pmlist)
	{
		pm__loop__id++;

	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("		<tr>\r\n");
	templateBuilder.Append("			<td style=\"width:53px;text-align:center; height:18px; line-height:18px; padding:2px 0;\"><img src=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/message_");
	templateBuilder.Append(pm.New.ToString().Trim());
	templateBuilder.Append(".gif\" alt=\"短信息\"/></td>\r\n");
	templateBuilder.Append("			<th><a href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("usercpshowpm.aspx?pmid=");
	templateBuilder.Append(pm.Pmid.ToString().Trim());
	templateBuilder.Append("\">");
	templateBuilder.Append(pm.Subject.ToString().Trim());
	templateBuilder.Append("</a></th>\r\n");
	templateBuilder.Append("			<td width=\"15%\">\r\n");

	if (pm.Msgfromid>0)
	{

	templateBuilder.Append("				    <a href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("userinfo.aspx?userid=");
	templateBuilder.Append(pm.Msgfromid.ToString().Trim());
	templateBuilder.Append("\" target=\"_blank\">");
	templateBuilder.Append(pm.Msgfrom.ToString().Trim());
	templateBuilder.Append("</a>\r\n");

	}
	else
	{

	templateBuilder.Append("				    ");
	templateBuilder.Append(pm.Msgfrom.ToString().Trim());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("			</td>\r\n");
	templateBuilder.Append("			<td width=\"15%\">\r\n");
	templateBuilder.Append("				<span class=\"fontfamily\">");
	templateBuilder.Append(pm.Postdatetime.ToString().Trim());
	templateBuilder.Append("</span>\r\n");
	templateBuilder.Append("			</td>\r\n");
	templateBuilder.Append("		</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");

	}	//end loop

	templateBuilder.Append("	</table>\r\n");
	templateBuilder.Append("	<form id=\"frmnewpm\" name=\"frmnewpm\" method=\"post\" action=\"#\">\r\n");
	templateBuilder.Append("		<input id=\"ignore\" name=\"ignore\" type=\"hidden\" value=\"yes\" />\r\n");
	templateBuilder.Append("	</form>\r\n");
	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("<!--短信息 area end-->\r\n");

	}	//end if





	if (ispoll)
	{

	templateBuilder.Append("<!--投票区开始-->\r\n");
	templateBuilder.Append("<div class=\"box pollpanel\">\r\n");
	templateBuilder.Append("	<form id=\"formpoll\" name=\"formpoll\" method=\"post\" action=\"poll.aspx?topicid=");
	templateBuilder.Append(topicid.ToString());
	templateBuilder.Append("\">\r\n");
	templateBuilder.Append("		<h4>\r\n");
	templateBuilder.Append("		投票：<strong>");
	templateBuilder.Append(topictitle.ToString());
	templateBuilder.Append("</strong>\r\n");

	if (pollinfo.Multiple==1)
	{

	templateBuilder.Append("		-多选(最多可选");
	templateBuilder.Append(pollinfo.Maxchoices.ToString().Trim());
	templateBuilder.Append("项)\r\n");

	}	//end if

	templateBuilder.Append("		-截止时间：");
	templateBuilder.Append(pollinfo.Expiration.ToString().Trim());
	templateBuilder.Append("\r\n");
	templateBuilder.Append("		</h4>\r\n");
	templateBuilder.Append("	<div class=\"postmessage\">\r\n");
	templateBuilder.Append("		<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" summary=\"pollpanel\">\r\n");

	int polloption__loop__id=0;
	foreach(DataRow polloption in polloptionlist.Rows)
	{
		polloption__loop__id++;

	templateBuilder.Append("		<tbody>\r\n");
	templateBuilder.Append("		<tr>\r\n");
	templateBuilder.Append("			<td style=\"padding:3px 0;\">\r\n");

	if (allowvote)
	{


	if (pollinfo.Multiple==1)
	{

	templateBuilder.Append("					<input type=\"checkbox\" name=\"pollitemid\" value=\"" + polloption["polloptionid"].ToString().Trim() + "\" onclick='checkbox(this)'/>\r\n");

	}
	else
	{

	templateBuilder.Append("					<input type=\"radio\" name=\"pollitemid\"  value=\"" + polloption["polloptionid"].ToString().Trim() + "\"  />\r\n");

	}	//end if


	}	//end if

	templateBuilder.Append("				" + polloption["name"].ToString().Trim() + "\r\n");
	templateBuilder.Append("			</td>\r\n");
	templateBuilder.Append("			<td width=\"420\">\r\n");

	if (showpollresult)
	{

	templateBuilder.Append("				<div class=\"optionbar\">\r\n");
	templateBuilder.Append("					<div style=\"width:" + polloption["percentwidth"].ToString().Trim() + "px\"></div>\r\n");
	templateBuilder.Append("				</div>				\r\n");
	templateBuilder.Append("				<div id=\"voterlist" + polloption["polloptionid"].ToString().Trim() + "\" style=\"display:none;clear:both;\">\r\n");

	if (useradminid==1 && polloption["value"].ToString().Trim()!="0")
	{

	templateBuilder.Append("					 " + polloption["votername"].ToString().Trim() + "\r\n");

	}	//end if

	templateBuilder.Append("				</div>\r\n");

	}
	else
	{

	templateBuilder.Append("				&nbsp;\r\n");

	}	//end if

	templateBuilder.Append("			</td>\r\n");
	templateBuilder.Append("			<td>\r\n");

	if (showpollresult)
	{

	templateBuilder.Append("			<strong>" + polloption["value"].ToString().Trim() + "</strong>票 / " + polloption["percent"].ToString().Trim() + "\r\n");

	if (useradminid==1 && polloption["value"].ToString().Trim()!="0")
	{

	templateBuilder.Append("				( <a href=\"javascript:void(0);\" onclick=\"javascript:displayvoter($('voterlist" + polloption["polloptionid"].ToString().Trim() + "'));\">查看该项投票人</a> )\r\n");

	}	//end if


	}
	else
	{

	templateBuilder.Append("			&nbsp;\r\n");

	}	//end if

	templateBuilder.Append("			</td>\r\n");
	templateBuilder.Append("		</tr>\r\n");
	templateBuilder.Append("		</tbody>\r\n");

	}	//end loop

	templateBuilder.Append("		<script language=\"javascript\">\r\n");
	templateBuilder.Append("		var max_obj = ");
	templateBuilder.Append(pollinfo.Maxchoices.ToString().Trim());
	templateBuilder.Append(";\r\n");
	templateBuilder.Append("	    var p = 0;\r\n");
	templateBuilder.Append("	    function checkbox(obj) {\r\n");
	templateBuilder.Append("	        if(obj.checked) {\r\n");
	templateBuilder.Append("		        p++;\r\n");
	templateBuilder.Append("		        for (var i = 0; i < $('formpoll').elements.length; i++) {\r\n");
	templateBuilder.Append("			        var e = $('formpoll').elements[i];\r\n");
	templateBuilder.Append("			        if(p == max_obj) {\r\n");
	templateBuilder.Append("				        if(e.name.match('pollitemid') && !e.checked) {\r\n");
	templateBuilder.Append("					        e.disabled = true;\r\n");
	templateBuilder.Append("				        }\r\n");
	templateBuilder.Append("			        }\r\n");
	templateBuilder.Append("		        }\r\n");
	templateBuilder.Append("	        } else {\r\n");
	templateBuilder.Append("		        p--;\r\n");
	templateBuilder.Append("		        for (var i = 0; i < $('formpoll').elements.length; i++) {\r\n");
	templateBuilder.Append("			        var e = $('formpoll').elements[i];\r\n");
	templateBuilder.Append("			        if(e.name.match('pollitemid') && e.disabled) {\r\n");
	templateBuilder.Append("				        e.disabled = false;\r\n");
	templateBuilder.Append("			        }\r\n");
	templateBuilder.Append("		        }\r\n");
	templateBuilder.Append("	        }\r\n");
	templateBuilder.Append("        }	   \r\n");
	templateBuilder.Append("	    function displayvoter(objid) {\r\n");
	templateBuilder.Append("	        if(objid.style.display == 'block') {\r\n");
	templateBuilder.Append("	           objid.style.display = 'none';\r\n");
	templateBuilder.Append("	        }\r\n");
	templateBuilder.Append("	        else {\r\n");
	templateBuilder.Append("	           objid.style.display = 'block';\r\n");
	templateBuilder.Append("	        }\r\n");
	templateBuilder.Append("	    }	    \r\n");
	templateBuilder.Append("	    </");
	templateBuilder.Append("script>\r\n");

	if (config.Silverlight==1)
	{

	templateBuilder.Append("		<tbody>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("			<td colspan=\"3\"><iframe src=\"silverlight/piechart/index.html?topicid=");
	templateBuilder.Append(topicid.ToString());
	templateBuilder.Append("&bg=F5FAFE\" allowtransparency=\"yes\" width=\"95%\" height=\"425\" border=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" frameborder=\"0\" ></iframe>\r\n");
	templateBuilder.Append("			</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("		</tbody>\r\n");

	}	//end if

	templateBuilder.Append("		<tbody>\r\n");
	templateBuilder.Append("		<tr>\r\n");
	templateBuilder.Append("			<td colspan=\"3\" style=\"padding:4px 0;\">\r\n");

	if (useradminid==1 && voters!="")
	{

	templateBuilder.Append("					<button onclick=\"expandoptions('ticketvoterlist');\" />查看投票用户名单>></button>\r\n");

	}	//end if


	if (usergroupinfo.Allowvote==1)
	{


	if (allowvote)
	{

	templateBuilder.Append("						<input type=\"submit\" name=\"Submit\" value=\"投票\"/>\r\n");

	}
	else
	{

	templateBuilder.Append("						提示: 您已经投过票或者投票已经过期\r\n");

	}	//end if


	}
	else
	{

	templateBuilder.Append("					抱歉,您没有参与投票的权限\r\n");

	}	//end if

	templateBuilder.Append("			 </td>\r\n");
	templateBuilder.Append("		</tr>\r\n");
	templateBuilder.Append("		</tbody>\r\n");
	templateBuilder.Append("		</table>\r\n");
	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("	</form>\r\n");
	templateBuilder.Append("</div>\r\n");

	if (useradminid==1 && voters!="")
	{

	templateBuilder.Append("<div id=\"ticketvoterlist\" style=\"display:none;\" class=\"box\">\r\n");
	templateBuilder.Append("	<h4>投票用户名单</h4>\r\n");
	templateBuilder.Append("	<div class=\"postmessage\">\r\n");
	templateBuilder.Append("	<table width=\"96%\" border=\"0\" cellpadding=\"4\" cellspacing=\"0\" summary=\"投票用户名单\">\r\n");
	templateBuilder.Append("		<tr>\r\n");
	templateBuilder.Append("			<td>");
	templateBuilder.Append(voters.ToString());
	templateBuilder.Append("</td>\r\n");
	templateBuilder.Append("		</tr>\r\n");
	templateBuilder.Append("	</table>\r\n");
	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("</div>\r\n");

	}	//end if

	templateBuilder.Append("<!--投票区结束-->\r\n");

	}	//end if



	templateBuilder.Append("<div class=\"pages_btns\">\r\n");
	templateBuilder.Append("	<span class=\"postbtn\">	\r\n");

	if (userid<0||canposttopic)
	{

	templateBuilder.Append("	    <span onmouseover=\"$('newspecial').id = 'newspecialtmp';this.id = 'newspecial';if($('newspecial_menu').childNodes.length>0)  showMenu(this.id);\" id=\"newspecial\" class=\"postbtn\"><a title=\"发新话题\" id=\"newtopic\" href=\"posttopic.aspx?forumid=");
	templateBuilder.Append(forum.Fid.ToString().Trim());
	templateBuilder.Append("\" onmouseover=\"if($('newspecial_menu').childNodes.length>0)  showMenu(this.id);\"><img alt=\"发新话题\" src=\"templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/newtopic.gif\"/></a></span>\r\n");

	}	//end if


	if (canreply)
	{

	templateBuilder.Append("	    <SPAN class=\"replybtn\"><a href=\"postreply.aspx?topicid=");
	templateBuilder.Append(topicid.ToString());
	templateBuilder.Append("\"><img src=\"templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/reply.gif\" border=\"0\" alt=\"回复该主题\" /></a></span>\r\n");

	}	//end if

	templateBuilder.Append("	</span>\r\n");
	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("<div class=\"mainbox viewthread\">\r\n");
	templateBuilder.Append("	<h3>\r\n");

	if (forum.Applytopictype==1 && forum.Topictypeprefix==1)
	{

	templateBuilder.Append("			");
	templateBuilder.Append(topictypes.ToString());
	templateBuilder.Append(" \r\n");

	}	//end if

	templateBuilder.Append("			");
	templateBuilder.Append(topictitle.ToString());
	templateBuilder.Append("\r\n");

	if (topic.Price>0 && topic.Posterid!=userid)
	{

	templateBuilder.Append("			<a href=\"buytopic.aspx?topicid=");
	templateBuilder.Append(topicid.ToString());
	templateBuilder.Append("&showpayments=1\">浏览需支付 ");
	templateBuilder.Append(userextcreditsinfo.Name.ToString().Trim());
	templateBuilder.Append(" ");
	templateBuilder.Append(topic.Price.ToString().Trim());
	templateBuilder.Append(" ");
	templateBuilder.Append(userextcreditsinfo.Unit.ToString().Trim());
	templateBuilder.Append("</a>\r\n");

	}	//end if

	templateBuilder.Append("	</h3>\r\n");
	templateBuilder.Append("	<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\r\n");
	templateBuilder.Append("		<tbody>\r\n");
	templateBuilder.Append("		<tr>\r\n");
	templateBuilder.Append("		<td class=\"postauthor\" id=\"");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append("\">\r\n");
	templateBuilder.Append("		<!--register user-->\r\n");

	if (post.Posterid!=-1)
	{

	templateBuilder.Append("			<cite>\r\n");
	templateBuilder.Append("				<a href=\"#\" target=\"_blank\" id=\"memberinfo_");
	templateBuilder.Append(loopi.ToString());
	templateBuilder.Append("\" class=\"dropmenu\" onmouseover=\"showMenu(this.id)\">\r\n");

	if (post.Onlinestate==1)
	{

	templateBuilder.Append("				<img src=\"templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/useronline.gif\" alt=\"在线\" title=\"在线\"/>\r\n");

	}
	else
	{

	templateBuilder.Append("				<img src=\"templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/useroutline.gif\"  alt=\"离线\" title=\"离线\"/>\r\n");

	}	//end if

	templateBuilder.Append("				");
	templateBuilder.Append(post.Poster.ToString().Trim());
	templateBuilder.Append("\r\n");
	templateBuilder.Append("				</a>\r\n");
	templateBuilder.Append("			</cite>\r\n");

	if (config.Showavatars==1 && post.Avatar!="")
	{

	templateBuilder.Append("			<div class=\"avatar\">\r\n");
	templateBuilder.Append("				<img class=\"avatar\" src=\"");
	templateBuilder.Append(post.Avatar.ToString().Trim());
	templateBuilder.Append("\" onerror=\"this.onerror=null;this.src='templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/noavatar.gif';\" \r\n");

	if (post.Avatarwidth>0)
	{

	templateBuilder.Append("							width=\"");
	templateBuilder.Append(post.Avatarwidth.ToString().Trim());
	templateBuilder.Append("\"\r\n");
	templateBuilder.Append("							height=\"");
	templateBuilder.Append(post.Avatarheight.ToString().Trim());
	templateBuilder.Append("\"\r\n");

	}	//end if

	templateBuilder.Append(" alt=\"头像\"\r\n");
	templateBuilder.Append("				/>	\r\n");
	templateBuilder.Append("			</div>		\r\n");

	}	//end if


	if (post.Nickname!="")
	{

	templateBuilder.Append("			<p><em>");
	templateBuilder.Append(post.Nickname.ToString().Trim());
	templateBuilder.Append("</em></p>\r\n");

	}	//end if

	templateBuilder.Append("			<p>\r\n");
	templateBuilder.Append("			<script language=\"javascript\" type=\"text/javascript\">\r\n");
	templateBuilder.Append("				ShowStars(");
	templateBuilder.Append(post.Stars.ToString().Trim());
	templateBuilder.Append(", ");
	templateBuilder.Append(config.Starthreshold.ToString().Trim());
	templateBuilder.Append(");\r\n");
	templateBuilder.Append("			</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("			</p>\r\n");
	templateBuilder.Append("			<ul class=\"otherinfo\">\r\n");

	if (config.Userstatusby==1)
	{

	templateBuilder.Append("				<li><label>组别</label>");
	templateBuilder.Append(post.Status.ToString().Trim());
	templateBuilder.Append("</li>\r\n");

	}	//end if

	templateBuilder.Append("				<li><label>性别</label><script type=\"text/javascript\">document.write(displayGender(");
	templateBuilder.Append(post.Gender.ToString().Trim());
	templateBuilder.Append("));</");
	templateBuilder.Append("script></li>\r\n");

	if (post.Bday!="")
	{

	templateBuilder.Append("				<li><label>生日</label>");
	templateBuilder.Append(post.Bday.ToString().Trim());
	templateBuilder.Append("</li>\r\n");

	}	//end if

	templateBuilder.Append("				<li><label>来自</label>");
	templateBuilder.Append(post.Location.ToString().Trim());
	templateBuilder.Append("</li>\r\n");
	templateBuilder.Append("				<li><label>积分</label>");
	templateBuilder.Append(post.Credits.ToString().Trim());
	templateBuilder.Append("</li>\r\n");
	templateBuilder.Append("				<li><label>帖子</label>");
	templateBuilder.Append(post.Posts.ToString().Trim());
	templateBuilder.Append("</li>\r\n");
	templateBuilder.Append("				<li><label>注册时间</label>\r\n");

	if (post.Joindate!="")
	{

	templateBuilder.Append(Convert.ToDateTime(post.Joindate).ToString("yyyy-MM-dd"));

	}	//end if

	templateBuilder.Append("</li>\r\n");
	templateBuilder.Append("				</ul>\r\n");
	templateBuilder.Append("			</div>\r\n");

	if (config.Enablespace==1 || config.Enablealbum==1)
	{

	templateBuilder.Append("			<ul>\r\n");

	if (config.Enablespace==1)
	{

	templateBuilder.Append("				<li class=\"space\">\r\n");

	if (post.Spaceid>0)
	{

	templateBuilder.Append("<a href=\"");
	templateBuilder.Append(spaceurl.ToString());
	templateBuilder.Append("space/?uid=");
	templateBuilder.Append(post.Posterid.ToString().Trim());
	templateBuilder.Append("\">个人空间</a>\r\n");

	}
	else
	{

	templateBuilder.Append("<a href=\"###\" onclick=\"nospace('");
	templateBuilder.Append(post.Poster.ToString().Trim());
	templateBuilder.Append("');\">个人空间</a>\r\n");

	}	//end if

	templateBuilder.Append("				</li>\r\n");

	}	//end if


	if (config.Enablealbum==1)
	{

	templateBuilder.Append("				<li class=\"albumpic\"><a href=\"showalbumlist.aspx?uid=");
	templateBuilder.Append(post.Posterid.ToString().Trim());
	templateBuilder.Append("\">相册</a></li>\r\n");

	}	//end if

	templateBuilder.Append("			</ul>\r\n");

	}	//end if


	if (post.Medals!="")
	{

	templateBuilder.Append("			<div class=\"medals\">");
	templateBuilder.Append(post.Medals.ToString().Trim());
	templateBuilder.Append("</div>\r\n");

	}	//end if


	}
	else
	{

	templateBuilder.Append("				<div class=\"ipshow\"><strong>");
	templateBuilder.Append(post.Poster.ToString().Trim());
	templateBuilder.Append("</strong>  ");
	templateBuilder.Append(post.Ip.ToString().Trim());
	templateBuilder.Append("\r\n");

	if (useradminid>0 && admininfo.Allowviewip==1)
	{

	templateBuilder.Append("					<a href=\"getip.aspx?pid=");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append("&topicid=");
	templateBuilder.Append(topicid.ToString());
	templateBuilder.Append("\" title=\"查看IP\"><img src=\"templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/ip.gif\" alt=\"查看IP\" /></a>\r\n");

	}	//end if

	templateBuilder.Append("				</div>\r\n");
	templateBuilder.Append("			<!--guest-->\r\n");
	templateBuilder.Append("			<div class=\"noregediter\">\r\n");
	templateBuilder.Append("				未注册\r\n");
	templateBuilder.Append("			</div>\r\n");

	}	//end if

	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("		<td class=\"postcontent\">\r\n");
	templateBuilder.Append("			<div class=\"postinfo\">\r\n");
	templateBuilder.Append("				<em>\r\n");
	templateBuilder.Append(Convert.ToDateTime(post.Postdatetime).ToString("yyyy-MM-dd HH:mm"));
	templateBuilder.Append("</em>\r\n");
	templateBuilder.Append("				<a href=\"showtopic.aspx?topicid=");
	templateBuilder.Append(topicid.ToString());
	templateBuilder.Append("&forumpage=");
	templateBuilder.Append(forumpageid.ToString());
	templateBuilder.Append("\">平板</a>|\r\n");
	templateBuilder.Append("				<a href=\"favorites.aspx?topicid=");
	templateBuilder.Append(topicid.ToString());
	templateBuilder.Append("&forumpage=");
	templateBuilder.Append(forumpageid.ToString());
	templateBuilder.Append("\">收藏</a>|\r\n");

	if (ismoder==1)
	{

	templateBuilder.Append("					<a href=\"editpost.aspx?topicid=");
	templateBuilder.Append(topicid.ToString());
	templateBuilder.Append("&postid=");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append("&forumpage=");
	templateBuilder.Append(forumpageid.ToString());
	templateBuilder.Append("\">编辑</a>|\r\n");
	templateBuilder.Append("					<a href=\"delpost.aspx?topicid=");
	templateBuilder.Append(topicid.ToString());
	templateBuilder.Append("&postid=");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append("&forumpage=");
	templateBuilder.Append(forumpageid.ToString());
	templateBuilder.Append("\" onclick=\"return confirm('确定要删除吗?');\">删除</a>|\r\n");

	if (post.Posterid!=-1)
	{

	templateBuilder.Append("						<a href=\"###\" onclick=\"action_onchange('rate',$('moderate'),'");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append("');\">评分</a>|\r\n");

	if (post.Ratetimes>0)
	{

	templateBuilder.Append("						<a href=\"###\" onclick=\"action_onchange('cancelrate',$('moderate'),'");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append("');\">撤销评分</a>&nbsp;\r\n");

	}	//end if


	if (post.Invisible==-2)
	{

	templateBuilder.Append("					<a href=\"###\" onclick=\"action_onchange('banpost',$('moderate'),'");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append("','0');\">撤销屏蔽</a>|\r\n");

	}
	else
	{

	templateBuilder.Append("					<a href=\"###\" onclick=\"action_onchange('banpost',$('moderate'),'");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append("','-2');\">屏蔽帖子</a>|\r\n");

	}	//end if


	}	//end if

	templateBuilder.Append("					<input name=\"postid\" id=\"postid\" value=\"");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append("\" type=\"checkbox\" />\r\n");

	}
	else
	{


	if (post.Posterid!=-1 && userid==post.Posterid)
	{


	if (topic.Closed==0)
	{

	templateBuilder.Append("							<a href=\"editpost.aspx?topicid=");
	templateBuilder.Append(topicid.ToString());
	templateBuilder.Append("&postid=");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append("&forumpage=");
	templateBuilder.Append(forumpageid.ToString());
	templateBuilder.Append("\">编辑</a>|\r\n");

	}	//end if

	templateBuilder.Append("						<a href=\"delpost.aspx?topicid=");
	templateBuilder.Append(topicid.ToString());
	templateBuilder.Append("&postid=");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append("&forumpage=");
	templateBuilder.Append(forumpageid.ToString());
	templateBuilder.Append("\" onclick=\"return confirm('确定要删除吗?');\">删除</a>|\r\n");

	}	//end if


	if (usergroupinfo.Raterange!="" && post.Posterid!=-1)
	{

	templateBuilder.Append("<a href=\"###\" onclick=\"action_onchange('rate',$('moderate'),'");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append("');\">评分</a>\r\n");

	}	//end if


	}	//end if

	templateBuilder.Append("				<a href=\"###\" class=\"t_number\" onclick=\"$('message");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append("').className='t_smallfont'\">小</a>			\r\n");
	templateBuilder.Append("				<a href=\"###\" class=\"t_number\" onclick=\"$('message");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append("').className='t_msgfont'\">中</a>\r\n");
	templateBuilder.Append("				<a href=\"###\" class=\"t_number\" onclick=\"$('message");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append("').className='t_bigfont'\">大</a>\r\n");
	templateBuilder.Append("			</div>\r\n");
	templateBuilder.Append("			<div id=\"ad_thread2_1\"></div>\r\n");
	templateBuilder.Append("			<div class=\"postmessage defaultpost\">\r\n");

	if (post.Invisible!=-2 || ismoder==1)
	{


	if (topic.Identify>0)
	{

	templateBuilder.Append("				<div class=\"ntprint\" onclick=\"this.style.display='none';\"><img onload=\"setIdentify(this.parentNode);\" src=\"images/identify/");
	templateBuilder.Append(topicidentify.Filename.ToString().Trim());
	templateBuilder.Append("\" alt=\"点击关闭鉴定图章\" title=\"点击关闭鉴定图章\" /></div>\r\n");

	}	//end if


	if (ismoder==1 && post.Invisible==-2)
	{

	templateBuilder.Append("						<!--管理组有权查看内容开始-->\r\n");
	templateBuilder.Append("						<div class='hintinfo'>提示: 该帖已被屏蔽, 您拥有管理权限, 以下是帖子内容</div>		              \r\n");

	}	//end if

	templateBuilder.Append("				<h2>");
	templateBuilder.Append(post.Title.ToString().Trim());
	templateBuilder.Append("</h2>\r\n");
	templateBuilder.Append("				<div id=\"message");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append("\" class=\"t_msgfont\">\r\n");
	templateBuilder.Append("					<div id=\"ad_thread3_1\"></div>\r\n");

	if (post.Layer==0 && enabletag)
	{

	templateBuilder.Append("						<div id=\"firstpost\">\r\n");

	}	//end if

	templateBuilder.Append("							");
	templateBuilder.Append(post.Message.ToString().Trim());
	templateBuilder.Append("\r\n");

	if (post.Layer==0 && enabletag)
	{

	templateBuilder.Append("						</div>\r\n");

	}	//end if

	templateBuilder.Append("				</div>\r\n");

	if (attachmentlist.Count>0)
	{

	int currentattachcount = 0;
	

	int attachtemp__loop__id=0;
	foreach(ShowtopicPageAttachmentInfo attachtemp in attachmentlist)
	{
		attachtemp__loop__id++;


	if (attachtemp.Pid==post.Pid)
	{

	 currentattachcount = currentattachcount + 1;
	

	}	//end if


	}	//end loop


	if (currentattachcount>0)
	{

	int getattachperm = attachmentlist[0].Getattachperm;
	

	if (getattachperm==1)
	{

	templateBuilder.Append("					<div class=\"box postattachlist\">\r\n");
	templateBuilder.Append("						<h4>附件</h4>\r\n");
	templateBuilder.Append("						<div id=\"BOX_overlay\" style=\"background: #000; position: absolute; z-index:100; filter:alpha(opacity=50);-moz-opacity: 0.6;opacity: 0.6;\"></div>\r\n");
	templateBuilder.Append("                        <div id=\"attachpaymentlog\" style=\"display: none; background :Aliceblue;  border:0px solid #999; width:503px; height:443px;\"></div>\r\n");
	templateBuilder.Append("                        <div id=\"buyattach\" style=\"display: none; background :Aliceblue; border:0px solid #999; width:503px; height:323px;\"></div>\r\n");

	int attachment__loop__id=0;
	foreach(ShowtopicPageAttachmentInfo attachment in attachmentlist)
	{
		attachment__loop__id++;


	if (attachment.Pid==post.Pid)
	{

	templateBuilder.Append("							<!--附件开始-->\r\n");

	if (attachment.Allowread==1)
	{


	templateBuilder.Append("										<dl class=\"t_attachlist\">\r\n");
	templateBuilder.Append("											<dt>\r\n");
	templateBuilder.Append("											<img class=\"absmiddle\" border=\"0\" alt=\"\" src=\"images/attachicons/image.gif\"/>\r\n");

	if (attachment.Attachprice<=0)
	{

	templateBuilder.Append("											   <a class=\"bold\" target=\"_blank\" href=\"attachment.aspx?attachmentid=");
	templateBuilder.Append(attachment.Aid.ToString().Trim());
	templateBuilder.Append("\">");
	templateBuilder.Append(attachment.Attachment.ToString().Trim());
	templateBuilder.Append("</a>\r\n");

	}
	else
	{


	if (attachment.Isbought==1 || post.Posterid==userid)
	{

	templateBuilder.Append("											       <a class=\"bold\" target=\"_blank\" href=\"attachment.aspx?attachmentid=");
	templateBuilder.Append(attachment.Aid.ToString().Trim());
	templateBuilder.Append("\">");
	templateBuilder.Append(attachment.Attachment.ToString().Trim());
	templateBuilder.Append("</a>\r\n");

	}
	else
	{


	if (usergroupinfo.Radminid==1)
	{

	templateBuilder.Append("											          <a class=\"bold\" target=\"_blank\" href=\"attachment.aspx?attachmentid=");
	templateBuilder.Append(attachment.Aid.ToString().Trim());
	templateBuilder.Append("\">");
	templateBuilder.Append(attachment.Attachment.ToString().Trim());
	templateBuilder.Append("</a>\r\n");

	}
	else
	{

	templateBuilder.Append("											          ");
	templateBuilder.Append(attachment.Attachment.ToString().Trim());
	templateBuilder.Append("\r\n");

	}	//end if


	}	//end if


	}	//end if

	templateBuilder.Append("											<em>(<script type=\"text/javascript\">ShowFormatBytesStr(");
	templateBuilder.Append(attachment.Filesize.ToString().Trim());
	templateBuilder.Append(");</");
	templateBuilder.Append("script>)</em>\r\n");
	bool viewattach = false;
	

	if (attachment.Attachprice>0)
	{

	templateBuilder.Append("											售价:<strong>");
	templateBuilder.Append(Scoresets.GetTopicAttachCreditsTransName().ToString().Trim());
	templateBuilder.Append(" ");
	templateBuilder.Append(attachment.Attachprice.ToString().Trim());
	templateBuilder.Append(" </strong>										\r\n");
	templateBuilder.Append("											[<a onclick=\"BOX_show('attachpaymentlog', ");
	templateBuilder.Append(attachment.Aid.ToString().Trim());
	templateBuilder.Append(");\" href=\"javascript:void(0);\">记录</a>]\r\n");
	 viewattach = attachment.Isbought==1;
	

	if (post.Posterid!=userid && !viewattach)
	{


	if (usergroupinfo.Radminid!=1)
	{

	templateBuilder.Append("											    [<a onclick=\"BOX_show('buyattach', ");
	templateBuilder.Append(attachment.Aid.ToString().Trim());
	templateBuilder.Append(");\" href=\"javascript:void(0);\">购买</a>] \r\n");

	}	//end if


	}	//end if


	}	//end if

	templateBuilder.Append("											</dt>\r\n");
	templateBuilder.Append("											<dd>\r\n");
	templateBuilder.Append("											<p style=\"padding:3px 0;\">\r\n");

	if (attachment.Description!="")
	{
	templateBuilder.Append(attachment.Description.ToString().Trim());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("<span style=\"color:#666\">(");
	templateBuilder.Append(attachment.Postdatetime.ToString().Trim());
	templateBuilder.Append(")</span></p>\r\n");

	if (attachment.Preview!="")
	{

	templateBuilder.Append("											<p>");
	templateBuilder.Append(attachment.Preview.ToString().Trim());
	templateBuilder.Append("</p>\r\n");

	}	//end if

	templateBuilder.Append("											<p>												\r\n");

	if (post.Posterid==userid || usergroupinfo.Radminid==1)
	{

	 viewattach = true;
	

	}	//end if

	templateBuilder.Append("											<a name=\"attach");
	templateBuilder.Append(attachment.Aid.ToString().Trim());
	templateBuilder.Append("\"></a>\r\n");

	if (allowdownloadattach)
	{

	templateBuilder.Append("<!--当用户有下载附件权限时-->\r\n");

	if (config.Showimages==1)
	{


	if (config.Attachimgpost==1)
	{


	if (attachment.Attachimgpost==1)
	{


	if (attachment.Attachprice<=0 || viewattach)
	{

	templateBuilder.Append("														<img alt=\"");
	templateBuilder.Append(attachment.Attachment.ToString().Trim());
	templateBuilder.Append("\" \r\n");

	if (config.Showattachmentpath==1)
	{

	templateBuilder.Append("															src=\"upload/");
	templateBuilder.Append(attachment.Filename.ToString().Trim());
	templateBuilder.Append("\"\r\n");

	}
	else
	{

	templateBuilder.Append("															src=\"attachment.aspx?attachmentid=");
	templateBuilder.Append(attachment.Aid.ToString().Trim());
	templateBuilder.Append("\"\r\n");

	}	//end if

	templateBuilder.Append("													onmouseover=\"attachimg(this, 'mouseover')\" onload=\"attachimg(this, 'load');\" onclick=\"zoom(this, this.src);\" />\r\n");

	}	//end if


	}	//end if


	}	//end if

	templateBuilder.Append("												<br />\r\n");

	}	//end if


	}
	else
	{

	templateBuilder.Append("											<span class=\\\"attachnotdown\\\">您所在的用户组无法下载或查看附件</span>\r\n");

	}	//end if

	templateBuilder.Append("											</p>\r\n");
	templateBuilder.Append("											</dd>										\r\n");
	templateBuilder.Append("										</dl>\r\n");



	}
	else
	{

	templateBuilder.Append("								<span class=\"notdown\">你的下载权限 ");
	templateBuilder.Append(usergroupinfo.Readaccess.ToString().Trim());
	templateBuilder.Append(" 低于此附件所需权限 ");
	templateBuilder.Append(attachment.Readperm.ToString().Trim());
	templateBuilder.Append(", 你无权查看此附件</span>\r\n");

	}	//end if

	templateBuilder.Append("							<!--附件结束-->\r\n");

	}	//end if


	}	//end loop

	templateBuilder.Append("					</div>\r\n");

	}
	else
	{

	templateBuilder.Append("					<div class=\"notice\" style=\"width: 500px;\">\r\n");
	templateBuilder.Append("					附件:<em>您所在的用户组无法下载或查看附件</em>\r\n");
	templateBuilder.Append("					</div>\r\n");

	}	//end if


	}	//end if


	}	//end if


	if (post.Ratetimes>0)
	{


	templateBuilder.Append("<script type=\"text/javascript\">\r\n");
	templateBuilder.Append("function ratevalveimg(rate,ratevalveset)\r\n");
	templateBuilder.Append("{\r\n");
	templateBuilder.Append("    valveimg = '';\r\n");
	templateBuilder.Append("	if(rate) {\r\n");
	templateBuilder.Append("		image = rate > 0 ? 'templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/agree.gif' : 'templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/disagree.gif';\r\n");
	templateBuilder.Append("		var  ratevalve = ratevalveset.split(\",\");\r\n");
	templateBuilder.Append("		for(i = 0; i < ratevalve.length; i++) {\r\n");
	templateBuilder.Append("		    if(Math.abs(rate)>ratevalve[i]){ \r\n");
	templateBuilder.Append("			    valveimg += '<img src=\"' + image + '\" border=\"0\" alt=\"\" />';\r\n");
	templateBuilder.Append("			}\r\n");
	templateBuilder.Append("			else{\r\n");
	templateBuilder.Append("			    break;\r\n");
	templateBuilder.Append("			}\r\n");
	templateBuilder.Append("		}\r\n");
	templateBuilder.Append("	}\r\n");
	templateBuilder.Append("	return valveimg;\r\n");
	templateBuilder.Append("}\r\n");
	templateBuilder.Append("</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("	<div class=\"ratelog\">\r\n");

	if (showratelog==1)
	{

	templateBuilder.Append("		<div id=\"rate_");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append("_fake\"><script type=\"text/javascript\">document.write(ratevalveimg(");
	templateBuilder.Append(post.Rate.ToString().Trim());
	templateBuilder.Append(",'");
	templateBuilder.Append(config.Ratevalveset.ToString().Trim());
	templateBuilder.Append("'));</");
	templateBuilder.Append("script> <a href=\"###\" title=\"查看/收起 评分记录\" onclick=\"showrate(");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append(",");
	templateBuilder.Append(config.Aspxrewrite.ToString().Trim());
	templateBuilder.Append(")\">本帖被评分 ");
	templateBuilder.Append(post.Ratetimes.ToString().Trim());
	templateBuilder.Append(" 次</a></div>\r\n");
	templateBuilder.Append("		<div id=\"rate_");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append("_real\" style=\"display:none\">\r\n");
	templateBuilder.Append("		<fieldset style=\"width: 600px;\">\r\n");
	templateBuilder.Append("			<legend><script>document.write(ratevalveimg(");
	templateBuilder.Append(post.Rate.ToString().Trim());
	templateBuilder.Append(",'");
	templateBuilder.Append(config.Ratevalveset.ToString().Trim());
	templateBuilder.Append("'));</");
	templateBuilder.Append("script> <a href=\"###\" title=\"查看/收起 评分记录\" onclick=\"showrate(");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append(",");
	templateBuilder.Append(config.Aspxrewrite.ToString().Trim());
	templateBuilder.Append(")\">本帖被评分 ");
	templateBuilder.Append(post.Ratetimes.ToString().Trim());
	templateBuilder.Append(" 次</a> </legend>\r\n");
	templateBuilder.Append("			<div id=\"rate_");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append("\" style=\"margin: 5px; height: 77px; overflow: auto;\"></div>\r\n");
	templateBuilder.Append("		</fieldset>\r\n");
	templateBuilder.Append("		</div>\r\n");
	templateBuilder.Append("	<script type=\"text/javascript\">_attachEvent(window, \"load\", function(){ showrate(");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append(",");
	templateBuilder.Append(config.Aspxrewrite.ToString().Trim());
	templateBuilder.Append(",");
	templateBuilder.Append(post.Ratetimes.ToString().Trim());
	templateBuilder.Append(",");
	templateBuilder.Append(topic.Tid.ToString().Trim());
	templateBuilder.Append("); })</");
	templateBuilder.Append("script>\r\n");

	}
	else
	{

	templateBuilder.Append("	<script type=\"text/javascript\">document.write(ratevalveimg(");
	templateBuilder.Append(post.Rate.ToString().Trim());
	templateBuilder.Append(",'");
	templateBuilder.Append(config.Ratevalveset.ToString().Trim());
	templateBuilder.Append("'));</");
	templateBuilder.Append("script>本帖被评分 ");
	templateBuilder.Append(post.Ratetimes.ToString().Trim());
	templateBuilder.Append(" 次\r\n");

	}	//end if

	templateBuilder.Append("	</div>\r\n");



	}	//end if


	if (post.Lastedit!="")
	{

	templateBuilder.Append("				<!--最后编辑开始-->\r\n");
	templateBuilder.Append("				<div class=\"lastediter\">\r\n");
	templateBuilder.Append("					<img src=\"templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/lastedit.gif\" alt=\"最后编辑\"/>");
	templateBuilder.Append(post.Lastedit.ToString().Trim());
	templateBuilder.Append("\r\n");
	templateBuilder.Append("				</div>\r\n");
	templateBuilder.Append("				<!--最后编辑结束-->\r\n");

	}	//end if


	if (post.Id==1)
	{


	if (topic.Special==3)
	{

	templateBuilder.Append("						<div class=\"quote\">\r\n");
	templateBuilder.Append("							<div class=\"text\"><p>本帖得分:</p>\r\n");
	templateBuilder.Append("								<div class=\"attachmentinfo\">\r\n");

	int bonuslog__loop__id=0;
	foreach(BonusLogInfo bonuslog in bonuslogs)
	{
		bonuslog__loop__id++;

	 aspxrewriteurl = this.UserInfoAspxRewrite(bonuslog.Answerid);
	
	string unit = scoreunit[ bonuslog.Extid ];
	
	string name = score[ bonuslog.Extid ];
	
	templateBuilder.Append("										<a href=\"");
	templateBuilder.Append(aspxrewriteurl.ToString());
	templateBuilder.Append("\">");
	templateBuilder.Append(bonuslog.Answername.ToString().Trim());
	templateBuilder.Append("</a>(");
	templateBuilder.Append(bonuslog.Bonus.ToString().Trim());
	templateBuilder.Append(" ");
	templateBuilder.Append(unit.ToString());
	templateBuilder.Append(name.ToString());
	templateBuilder.Append(")\r\n");

	if (bonuslog__loop__id!=bonuslogs.Count)
	{

	templateBuilder.Append("											,\r\n");

	}	//end if


	}	//end loop

	templateBuilder.Append("								</div>\r\n");
	templateBuilder.Append("							</div>\r\n");
	templateBuilder.Append("						</div>\r\n");

	}	//end if


	}	//end if


	if (forum.Allowtag==1 && post.Layer==0)
	{

	templateBuilder.Append("				<script type=\"text/javascript\">\r\n");
	templateBuilder.Append("					function forumhottag_callback(data)\r\n");
	templateBuilder.Append("					{\r\n");
	templateBuilder.Append("						tags = data;\r\n");
	templateBuilder.Append("					}\r\n");
	templateBuilder.Append("				</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("				<script type=\"text/javascript\" src=\"cache/hottags_forum_cache_jsonp.txt\"></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("				<div id=\"topictag\">\r\n");
	int hastag = Topics.GetMagicValue(topic.Magic, MagicType.TopicTag);
	

	if (hastag==1)
	{

	templateBuilder.Append("						<script type=\"text/javascript\">getTopicTags(");
	templateBuilder.Append(topic.Tid.ToString().Trim());
	templateBuilder.Append(");</");
	templateBuilder.Append("script>\r\n");

	}
	else
	{

	templateBuilder.Append("						<script type=\"text/javascript\">parsetag();</");
	templateBuilder.Append("script>\r\n");

	}	//end if

	templateBuilder.Append("				</div>\r\n");

	}	//end if

	templateBuilder.Append("			</div>\r\n");

	}
	else
	{

	templateBuilder.Append("			<div id=\"message");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append("\" class=\"t_msgfont\">\r\n");
	templateBuilder.Append("			          <div class='hintinfo'>提示: 该帖被管理员或版主屏蔽</div>\r\n");
	templateBuilder.Append("			</div>\r\n");

	}	//end if


	if (config.Showsignatures==1)
	{


	if (post.Usesig==1)
	{


	if (post.Signature!="")
	{

	templateBuilder.Append("			<!--签名开始-->\r\n");
	templateBuilder.Append("				<div class=\"postertext\">\r\n");

	if (config.Maxsigrows>0)
	{

	int ieheight = config.Maxsigrows*12;
	
	templateBuilder.Append("						<div class=\"signatures\" style=\"max-height: ");
	templateBuilder.Append(config.Maxsigrows.ToString().Trim());
	templateBuilder.Append("em;maxHeightIE:");
	templateBuilder.Append(ieheight.ToString());
	templateBuilder.Append("px\">");
	templateBuilder.Append(post.Signature.ToString().Trim());
	templateBuilder.Append("</div>\r\n");

	}
	else
	{

	templateBuilder.Append("						");
	templateBuilder.Append(post.Signature.ToString().Trim());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("				</div>\r\n");
	templateBuilder.Append("			<!--签名结束-->\r\n");

	}	//end if


	}	//end if


	}	//end if

	templateBuilder.Append("	</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");
	templateBuilder.Append("	<tbody>\r\n");
	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("	<!--用户信息结束-->\r\n");
	templateBuilder.Append("		<td class=\"postauthor\">&nbsp;</td>\r\n");
	templateBuilder.Append("		<td class=\"postcontent\">\r\n");
	templateBuilder.Append("			<div class=\"postactions\">\r\n");
	templateBuilder.Append("				<p>\r\n");

	if (userid!=-1)
	{


	templateBuilder.Append("<script type=\"text/javascript\">\r\n");
	templateBuilder.Append("    show_report_button();\r\n");
	templateBuilder.Append("</");
	templateBuilder.Append("script>\r\n");


	templateBuilder.Append("|\r\n");

	}	//end if


	if (canreply)
	{

	templateBuilder.Append("					<a href=\"postreply.aspx?&forumpage=");
	templateBuilder.Append(forumpageid.ToString());
	templateBuilder.Append("&topicid=");
	templateBuilder.Append(topicid.ToString());
	templateBuilder.Append("&postid=");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append("&quote=yes\">引用</a>|\r\n");

	if (userid!=-1)
	{

	templateBuilder.Append("					<a href=\"###\" onclick=\"replyToFloor('");
	templateBuilder.Append(post.Id.ToString().Trim());
	templateBuilder.Append("', '");
	templateBuilder.Append(post.Poster.ToString().Trim());
	templateBuilder.Append("', '");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append("')\">回复</a>|\r\n");

	}	//end if


	}	//end if

	templateBuilder.Append("					<a href=\"###\" onclick=\"window.scrollTo(0,0)\">TOP</a>\r\n");
	templateBuilder.Append("				</p>\r\n");
	templateBuilder.Append("				<div id=\"ad_thread1_1\"></div>\r\n");
	templateBuilder.Append("			</div>\r\n");
	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</tbody>\r\n");
	templateBuilder.Append("</table>\r\n");
	templateBuilder.Append("</div>\r\n");

	if (post.Posterid!=-1)
	{

	templateBuilder.Append("<!-- member menu -->\r\n");
	templateBuilder.Append("<div class=\"popupmenu_popup userinfopanel\" id=\"memberinfo_");
	templateBuilder.Append(loopi.ToString());
	templateBuilder.Append("_menu\" style=\"display: none; z-index: 50; filter: progid:dximagetransform.microsoft.shadow(direction=135,color=#cccccc,strength=2); left: 19px; clip: rect(auto auto auto auto); position absolute; top: 253px; width:150px;\" initialized ctrlkey=\"userinfo2\" h=\"209\">\r\n");
	templateBuilder.Append("	<p class=\"recivemessage\"><a href=\"usercppostpm.aspx?msgtoid=");
	templateBuilder.Append(post.Posterid.ToString().Trim());
	templateBuilder.Append("\" target=\"_blank\">发送短消息</a></p>\r\n");

	if (useradminid>0)
	{


	if (admininfo.Allowviewip==1)
	{

	templateBuilder.Append("			<p  class=\"seeip\"><a href=\"getip.aspx?pid=");
	templateBuilder.Append(post.Pid.ToString().Trim());
	templateBuilder.Append("&topicid=");
	templateBuilder.Append(topicid.ToString());
	templateBuilder.Append("\" title=\"查看IP\">查看IP</a></p>\r\n");

	}	//end if


	if (admininfo.Allowbanuser==1)
	{

	templateBuilder.Append("			<p><a href=\"useradmin.aspx?action=banuser&uid=");
	templateBuilder.Append(post.Posterid.ToString().Trim());
	templateBuilder.Append("\" title=\"禁止用户\">禁止用户</a></p>\r\n");

	}	//end if


	}	//end if

	templateBuilder.Append("	<p>\r\n");
	 aspxrewriteurl = this.UserInfoAspxRewrite(topic.Posterid);
	
	templateBuilder.Append("		<a href=\"");
	templateBuilder.Append(aspxrewriteurl.ToString());
	templateBuilder.Append("\" target=\"_blank\">查看公共资料</a></p>\r\n");
	templateBuilder.Append("	<p><a href=\"search.aspx?posterid=");
	templateBuilder.Append(post.Posterid.ToString().Trim());
	templateBuilder.Append("\">查找该会员全部帖子</a></p>\r\n");
	templateBuilder.Append("	<ul class=\"userdetail\">\r\n");
	templateBuilder.Append("		<li><label>UID</label>");
	templateBuilder.Append(post.Posterid.ToString().Trim());
	templateBuilder.Append("</li>\r\n");
	templateBuilder.Append("		<li><label>精华</label>\r\n");

	if (post.Digestposts>0)
	{

	templateBuilder.Append("<a href=\"search.aspx?posterid=");
	templateBuilder.Append(post.Posterid.ToString().Trim());
	templateBuilder.Append("&type=digest\">");
	templateBuilder.Append(post.Digestposts.ToString().Trim());
	templateBuilder.Append("</a>\r\n");

	}
	else
	{
	templateBuilder.Append(post.Digestposts.ToString().Trim());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("</li>\r\n");

	if (score[1].ToString().Trim()!="")
	{

	templateBuilder.Append("		<li><label>" + score[1].ToString().Trim() + "</label>");
	templateBuilder.Append(post.Extcredits1.ToString().Trim());
	templateBuilder.Append(" " + scoreunit[1].ToString().Trim() + "</li>\r\n");

	}	//end if


	if (score[2].ToString().Trim()!="")
	{

	templateBuilder.Append("		<li><label>" + score[2].ToString().Trim() + "</label>");
	templateBuilder.Append(post.Extcredits2.ToString().Trim());
	templateBuilder.Append(" " + scoreunit[2].ToString().Trim() + "</li>\r\n");

	}	//end if


	if (score[3].ToString().Trim()!="")
	{

	templateBuilder.Append("		<li><label>" + score[3].ToString().Trim() + "</label>");
	templateBuilder.Append(post.Extcredits3.ToString().Trim());
	templateBuilder.Append(" " + scoreunit[3].ToString().Trim() + "</li>\r\n");

	}	//end if


	if (score[4].ToString().Trim()!="")
	{

	templateBuilder.Append("		<li><label>" + score[4].ToString().Trim() + "</label>");
	templateBuilder.Append(post.Extcredits4.ToString().Trim());
	templateBuilder.Append(" " + scoreunit[4].ToString().Trim() + "</li>\r\n");

	}	//end if


	if (score[5].ToString().Trim()!="")
	{

	templateBuilder.Append("		<li><label>" + score[5].ToString().Trim() + "</label>");
	templateBuilder.Append(post.Extcredits5.ToString().Trim());
	templateBuilder.Append(" " + scoreunit[5].ToString().Trim() + "</li>\r\n");

	}	//end if


	if (score[6].ToString().Trim()!="")
	{

	templateBuilder.Append("		<li><label>" + score[6].ToString().Trim() + "</label>");
	templateBuilder.Append(post.Extcredits6.ToString().Trim());
	templateBuilder.Append(" " + scoreunit[6].ToString().Trim() + "</li>\r\n");

	}	//end if


	if (score[7].ToString().Trim()!="")
	{

	templateBuilder.Append("		<li><label>" + score[7].ToString().Trim() + "</label>");
	templateBuilder.Append(post.Extcredits7.ToString().Trim());
	templateBuilder.Append(" " + scoreunit[7].ToString().Trim() + "</li>\r\n");

	}	//end if


	if (score[8].ToString().Trim()!="")
	{

	templateBuilder.Append("		<li><label>" + score[8].ToString().Trim() + "</label>");
	templateBuilder.Append(post.Extcredits8.ToString().Trim());
	templateBuilder.Append(" " + scoreunit[8].ToString().Trim() + "</li>\r\n");

	}	//end if

	templateBuilder.Append("		<li><label>状态</label>\r\n");

	if (post.Onlinestate==1)
	{

	templateBuilder.Append("				在线\r\n");

	}
	else
	{

	templateBuilder.Append("				离线\r\n");

	}	//end if

	templateBuilder.Append("		</li>\r\n");
	templateBuilder.Append("	</ul>\r\n");
	templateBuilder.Append("	<ul class=\"tools\">\r\n");

	if (post.Msn!="")
	{

	templateBuilder.Append("		<li>\r\n");
	templateBuilder.Append("			<img src=\"templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/msnchat.gif\" title=\"MSN Messenger: ");
	templateBuilder.Append(post.Msn.ToString().Trim());
	templateBuilder.Append("\" alt=\"MSN Messenger: ");
	templateBuilder.Append(post.Msn.ToString().Trim());
	templateBuilder.Append("\" />\r\n");
	templateBuilder.Append("			<a href=\"mailto:");
	templateBuilder.Append(post.Msn.ToString().Trim());
	templateBuilder.Append("\" target=\"_blank\">");
	templateBuilder.Append(post.Msn.ToString().Trim());
	templateBuilder.Append("</a>\r\n");
	templateBuilder.Append("		</li>\r\n");

	}	//end if


	if (post.Skype!="")
	{

	templateBuilder.Append("		<li>\r\n");
	templateBuilder.Append("			<img src=\"templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/skype.gif\" title=\"Skype: ");
	templateBuilder.Append(post.Skype.ToString().Trim());
	templateBuilder.Append("\" alt=\"Skype: ");
	templateBuilder.Append(post.Skype.ToString().Trim());
	templateBuilder.Append("\" />\r\n");
	templateBuilder.Append("			<a href=\"skype:");
	templateBuilder.Append(post.Skype.ToString().Trim());
	templateBuilder.Append("\" target=\"_blank\">");
	templateBuilder.Append(post.Skype.ToString().Trim());
	templateBuilder.Append("</a>\r\n");
	templateBuilder.Append("		</li>\r\n");

	}	//end if


	if (post.Icq!="")
	{

	templateBuilder.Append("		<li>\r\n");
	templateBuilder.Append("			<img src=\"templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/icq.gif\" alt=\"ICQ: ");
	templateBuilder.Append(post.Icq.ToString().Trim());
	templateBuilder.Append("\" alt=\"ICQ: ");
	templateBuilder.Append(post.Icq.ToString().Trim());
	templateBuilder.Append("\" />\r\n");
	templateBuilder.Append("			<a href=\"http://wwp.icq.com/scripts/search.dll?to=");
	templateBuilder.Append(post.Icq.ToString().Trim());
	templateBuilder.Append("\" target=\"_blank\">");
	templateBuilder.Append(post.Icq.ToString().Trim());
	templateBuilder.Append("</a>\r\n");
	templateBuilder.Append("		</li>\r\n");

	}	//end if


	if (post.Qq!="")
	{

	templateBuilder.Append("		<li>\r\n");
	templateBuilder.Append("			<img src=\"templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/qq.gif\" alt=\"QQ: ");
	templateBuilder.Append(post.Qq.ToString().Trim());
	templateBuilder.Append("\" alt=\"QQ: ");
	templateBuilder.Append(post.Qq.ToString().Trim());
	templateBuilder.Append("\" />\r\n");
	templateBuilder.Append("			<a href=\"http://wpa.qq.com/msgrd?V=1&Uin=");
	templateBuilder.Append(post.Qq.ToString().Trim());
	templateBuilder.Append("&Site=");
	templateBuilder.Append(config.Forumtitle.ToString().Trim());
	templateBuilder.Append("&Menu=yes\" target=\"_blank\">");
	templateBuilder.Append(post.Qq.ToString().Trim());
	templateBuilder.Append("</a>\r\n");
	templateBuilder.Append("		</li>\r\n");

	}	//end if


	if (post.Yahoo!="")
	{

	templateBuilder.Append("				<li>\r\n");
	templateBuilder.Append("			<img src=\"templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/yahoo.gif\" width=\"16\" alt=\"Yahoo Messenger: ");
	templateBuilder.Append(post.Yahoo.ToString().Trim());
	templateBuilder.Append("\"/>\r\n");
	templateBuilder.Append("			<a href=\"http://edit.yahoo.com/config/send_webmesg?.target=");
	templateBuilder.Append(post.Yahoo.ToString().Trim());
	templateBuilder.Append("&.src=pg\" target=\"_blank\">");
	templateBuilder.Append(post.Yahoo.ToString().Trim());
	templateBuilder.Append("</a>\r\n");
	templateBuilder.Append("				</li>\r\n");

	}	//end if

	templateBuilder.Append("	</ul>\r\n");
	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("<!-- member menu -->\r\n");

	}	//end if

	templateBuilder.Append("<!--ntforumbox end-->\r\n");
	templateBuilder.Append("<div class=\"pages_btns\">\r\n");
	templateBuilder.Append("	<span class=\"postbtn\">	\r\n");

	if (userid<0||canposttopic)
	{

	templateBuilder.Append("	    <span onmouseover=\"$('newspecial').id = 'newspecialtmp';this.id = 'newspecial';if($('newspecial_menu').childNodes.length>0)  showMenu(this.id);\" id=\"Span1\" class=\"postbtn\"><a title=\"发新话题\" id=\"A1\" href=\"posttopic.aspx?forumid=");
	templateBuilder.Append(forum.Fid.ToString().Trim());
	templateBuilder.Append("\" onmouseover=\"if($('newspecial_menu').childNodes.length>0)  showMenu(this.id);\"><img alt=\"发新话题\" src=\"templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/newtopic.gif\"/></a></span>\r\n");

	}	//end if


	if (canreply)
	{

	templateBuilder.Append("	    <SPAN class=\"replybtn\"><a href=\"postreply.aspx?topicid=");
	templateBuilder.Append(topicid.ToString());
	templateBuilder.Append("&forumpage=");
	templateBuilder.Append(forumpageid.ToString());
	templateBuilder.Append("\"><img src=\"templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/reply.gif\" border=\"0\" alt=\"回复该主题\" /></a></span>\r\n");

	}	//end if

	templateBuilder.Append("	</span>\r\n");
	templateBuilder.Append("</div>\r\n");

	if (canreply)
	{

	templateBuilder.Append("<!--quickreply-->\r\n");
	bool isenddebate = true;
	


	if (quickeditorad!="")
	{

	templateBuilder.Append("<div class=\"leaderboard\">");
	templateBuilder.Append(quickeditorad.ToString());
	templateBuilder.Append("</div>\r\n");

	}	//end if

	templateBuilder.Append("<script type=\"text/javascript\" src=\"javascript/post.js\"></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\" src=\"javascript/bbcode.js\"></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<form method=\"post\" name=\"postform\" id=\"postform\" action=\"postreply.aspx?topicid=");
	templateBuilder.Append(topicid.ToString());
	templateBuilder.Append("\" enctype=\"multipart/form-data\" onsubmit=\"return validate(this);\">\r\n");
	templateBuilder.Append("<div id=\"quickpost\" class=\"box\">\r\n");
	templateBuilder.Append("	<h4>快速回复帖子</h4>\r\n");
	templateBuilder.Append("	<div class=\"postoptions\">\r\n");
	templateBuilder.Append("		<h5>选项</h5>\r\n");
	templateBuilder.Append("        <p><label><input type=\"checkbox\" value=\"1\" name=\"htmlon\" id=\"htmlon\" \r\n");

	if (usergroupinfo.Allowhtml!=1)
	{

	templateBuilder.Append(" disabled\r\n");

	}	//end if

	templateBuilder.Append("/>使用HTML标签</label></p>\r\n");
	templateBuilder.Append("		<p><label><input type=\"checkbox\" value=\"1\" name=\"parseurloff\" id=\"parseurloff\" \r\n");

	if (parseurloff==1)
	{

	templateBuilder.Append("checked \r\n");

	}	//end if

	templateBuilder.Append(" />禁用</label>网址识别</label></p>\r\n");
	templateBuilder.Append("		<p><label><input type=\"checkbox\" value=\"1\" name=\"smileyoff\" id=\"smileyoff\" \r\n");

	if (smileyoff==1)
	{

	templateBuilder.Append(" checked disabled \r\n");

	}	//end if

	templateBuilder.Append(" />禁用 </label>表情</p>\r\n");
	templateBuilder.Append("		<p><label><input type=\"checkbox\" value=\"1\" name=\"bbcodeoff\" id=\"bbcodeoff\" \r\n");

	if (bbcodeoff==1)
	{

	templateBuilder.Append(" checked disabled \r\n");

	}	//end if

	templateBuilder.Append(" />禁用</label>论坛代码</p>\r\n");
	templateBuilder.Append("		<p><label><input type=\"checkbox\" value=\"1\" name=\"usesig\" id=\"usesig\"\r\n");

	if (usesig==1)
	{

	templateBuilder.Append("checked\r\n");

	}	//end if

	templateBuilder.Append("/>使用个人签名</label></p>\r\n");
	templateBuilder.Append("		<p><label><input type=\"checkbox\" name=\"emailnotify\" id=\"emailnotify\" />发送邮件给楼主</label></p>	\r\n");
	templateBuilder.Append("		<p><label><input type=\"checkbox\" name=\"postreplynotice\" id=\"postreplynotice\" checked />发送回复通知</label></p>	\r\n");
	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("	<div class=\"postform\">\r\n");
	templateBuilder.Append("		<h5><label for=\"subject\">标题</label>\r\n");

	if (isenddebate==false)
	{

	templateBuilder.Append("			<select name=\"debateopinion\" id=\"debateopinion\">\r\n");
	templateBuilder.Append("				<option value=\"0\" selected></option>\r\n");
	templateBuilder.Append("				<option value=\"1\">正方</option>\r\n");
	templateBuilder.Append("				<option value=\"2\">反方</option>\r\n");
	templateBuilder.Append("			</select>\r\n");

	}	//end if

	templateBuilder.Append("			<input type=\"text\" id=\"title\" name=\"title\" size=\"84\" tabindex=\"1\" value=\"\" /><input type=\"hidden\" id=\"postid\" name=\"postid\" value=\"-1\" />\r\n");
	templateBuilder.Append("		</h5>\r\n");
	templateBuilder.Append("		<p><label>内容</label>\r\n");
	templateBuilder.Append("		<textarea rows=\"7\" cols=\"80\" name=\"message\" id=\"message\" onKeyDown=\"ctlent(event,false);\" tabindex=\"2\" class=\"autosave\" style=\"background:url(");
	templateBuilder.Append(quickbgadimg.ToString());
	templateBuilder.Append(") no-repeat 0 0; \" \r\n");

	if (quickbgadlink!="")
	{

	templateBuilder.Append(" onfocus=\"$('adlinkbtn').style.display='';$('closebtn').style.display='';this.onfocus=null;\"\r\n");

	}	//end if

	templateBuilder.Append("></textarea>\r\n");
	templateBuilder.Append("		</p>\r\n");

	if (isseccode)
	{

	templateBuilder.Append("		<p>验证码:\r\n");

	templateBuilder.Append("<input size=\"10\" style=\"width:50px;\" class=\"colorblue\" onfocus=\"this.className='colorfocus';\" onblur=\"this.className='colorblue';\" onkeyup=\"changevcode(this.form, this.value);\" />\r\n");
	templateBuilder.Append("&nbsp;\r\n");
	templateBuilder.Append("<img src=\"tools/VerifyImagePage.aspx?time=");
	templateBuilder.Append(Processtime.ToString());
	templateBuilder.Append("\" class=\"cursor\" id=\"vcodeimg\" onclick=\"this.src='tools/VerifyImagePage.aspx?id=");
	templateBuilder.Append(olid.ToString());
	templateBuilder.Append("&time=' + Math.random();\" />\r\n");
	templateBuilder.Append("<!--<input name=\"reloadvcade\" type=\"button\" class=\"colorblue\" id=\"reloadvcade\" value=\"刷新验证码\" tabindex=\"-1\"  style=\"color:#99cc00; width:75px;\" />-->\r\n");
	templateBuilder.Append("<script type=\"text/javascript\">\r\n");
	templateBuilder.Append("	if (typeof vcodeimgid == 'undefined'){\r\n");
	templateBuilder.Append("		var vcodeimgid = 1;\r\n");
	templateBuilder.Append("	}\r\n");
	templateBuilder.Append("	var actualid = $('vcodeimg').id + vcodeimgid++;\r\n");
	templateBuilder.Append("	$('vcodeimg').id = actualid;\r\n");
	templateBuilder.Append("	var actualobject = $(actualid);\r\n");
	templateBuilder.Append("	actualobject.src='tools/VerifyImagePage.aspx?bgcolor=F5FAFE&time=' + Math.random();\r\n");
	templateBuilder.Append("	var btn = document.createElement(\"INPUT\");\r\n");
	templateBuilder.Append("	btn.type = \"button\";\r\n");
	templateBuilder.Append("	btn.className = \"colorblue\";\r\n");
	templateBuilder.Append("	btn.value=\"刷新验证码\";\r\n");
	templateBuilder.Append("	btn.style.color = \"#99cc00\";\r\n");
	templateBuilder.Append("	btn.style.width = \"75px\";\r\n");
	templateBuilder.Append("	btn.onclick =  function() {\r\n");
	templateBuilder.Append("		actualobject.src = 'tools/VerifyImagePage.aspx?time=' + Math.random();\r\n");
	templateBuilder.Append("	};\r\n");
	templateBuilder.Append("	actualobject.parentNode.appendChild(btn);\r\n");
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


	templateBuilder.Append("</p>\r\n");

	}	//end if

	templateBuilder.Append("		<p class=\"btns\">\r\n");
	templateBuilder.Append("			<a href=\"###\" id=\"closebtn\" style=\"display:none;\" onclick=\"$('message').style.background='';this.style.display='none';$('adlinkbtn').style.display='none';\">关闭广告</a>\r\n");
	templateBuilder.Append("			<a href=\"");
	templateBuilder.Append(quickbgadlink.ToString());
	templateBuilder.Append("\" id=\"adlinkbtn\" style=\"display:none;\" target=\"_blank\" onclick=\"\">进入广告</a>\r\n");
	templateBuilder.Append("			<button type=\"submit\" id=\"postsubmit\" name=\"replysubmit\" value=\"发表帖子\" tabindex=\"3\">发表帖子</button>[可按Ctrl+Enter发布]&nbsp;\r\n");
	templateBuilder.Append("			<input  name=\"topicsreset\" id=\"restoredata\" value=\"清空内容\" tabindex=\"6\" title=\"清空内容\" onclick=\"javascript:document.postform.reset(); return true; \" type=\"reset\" />\r\n");
	templateBuilder.Append("			<input name=\"restoredata\" id=\"restoredata\" value=\"恢复数据\" tabindex=\"5\" title=\"恢复上次自动保存的数据\" onclick=\"loadData();\" type=\"button\" />\r\n");
	templateBuilder.Append("			<input type=\"hidden\" id=\"postbytopictype\" name=\"postbytopictype\" value=\"");
	templateBuilder.Append(forum.Postbytopictype.ToString().Trim());
	templateBuilder.Append("\" tabindex=\"3\" />\r\n");
	templateBuilder.Append("		</p>\r\n");
	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("	<div class=\"smilies\">\r\n");
	templateBuilder.Append("		 <script type=\"text/javascript\">\r\n");
	templateBuilder.Append("					var textobj = $('message');\r\n");
	templateBuilder.Append("					var lang = new Array();\r\n");
	templateBuilder.Append("					if(is_ie >= 5 || is_moz >= 2) {\r\n");
	templateBuilder.Append("						window.onbeforeunload = function () {\r\n");
	templateBuilder.Append("							saveData(textobj.value);\r\n");
	templateBuilder.Append("						};\r\n");
	templateBuilder.Append("						lang['post_autosave_none'] = \"没有可以恢复的数据\";\r\n");
	templateBuilder.Append("						lang['post_autosave_confirm'] = \"本操作将覆盖当前帖子内容，确定要恢复数据吗？\";\r\n");
	templateBuilder.Append("					}\r\n");
	templateBuilder.Append("					else {\r\n");
	templateBuilder.Append("						$('restoredata').style.display = 'none';\r\n");
	templateBuilder.Append("					}\r\n");
	templateBuilder.Append("					var bbinsert = parseInt('1');\r\n");
	templateBuilder.Append("					var smileyinsert = parseInt('1');\r\n");
	templateBuilder.Append("					var editor_id = 'posteditor';\r\n");
	templateBuilder.Append("					var smiliesCount = 9;\r\n");
	templateBuilder.Append("					var colCount = 3;\r\n");
	templateBuilder.Append("					var showsmiliestitle = 0;\r\n");
	templateBuilder.Append("					var smiliesIsCreate = 0;\r\n");
	templateBuilder.Append("					var scrMaxLeft; //表情滚动条宽度\r\n");
	templateBuilder.Append("			var smilies_HASH = {};\r\n");
	templateBuilder.Append("		</");
	templateBuilder.Append("script>\r\n");
	string defaulttypname = string.Empty;
	
	templateBuilder.Append("		<div class=\"navcontrol\">\r\n");
	templateBuilder.Append("			<div class=\"smiliepanel\">\r\n");
	templateBuilder.Append("				<div id=\"scrollbar\" class=\"scrollbar\">\r\n");
	templateBuilder.Append("					<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n");
	templateBuilder.Append("						<tr>\r\n");

	int stype__loop__id=0;
	foreach(DataRow stype in smilietypes.Rows)
	{
		stype__loop__id++;


	if (stype__loop__id==1)
	{

	 defaulttypname = stype["code"].ToString().Trim();
	

	}	//end if

	templateBuilder.Append("							<td id=\"t_s_" + stype__loop__id.ToString() + "\"><div id=\"s_" + stype__loop__id.ToString() + "\" onclick=\"showsmiles(" + stype__loop__id.ToString() + ", '" + stype["code"].ToString().Trim() + "');\" \r\n");

	if (stype__loop__id!=1)
	{

	templateBuilder.Append("style=\"display:none;\"\r\n");

	}
	else
	{

	templateBuilder.Append("class=\"lian\"\r\n");

	}	//end if

	templateBuilder.Append(">" + stype["code"].ToString().Trim() + "</div></td>\r\n");

	}	//end loop

	templateBuilder.Append("						</tr>\r\n");
	templateBuilder.Append("					</table>\r\n");
	templateBuilder.Append("				</div>\r\n");
	templateBuilder.Append("				<div id=\"scrlcontrol\">\r\n");
	templateBuilder.Append("					<img src=\"editor/images/smilie_prev_default.gif\" alt=\"向前\" onmouseover=\"if($('scrollbar').scrollLeft>0)this.src=this.src.replace(/_default|_selected/, '_hover');\" onmouseout=\"this.src=this.src.replace(/_hover|_selected/, '_default');\" onmousedown=\"if($('scrollbar').scrollLeft>0){this.src=this.src.replace(/_hover|_default/, '_selected');this.boder=1;}\" onmouseup=\"if($('scrollbar').scrollLeft>0)this.src=this.src.replace(/_selected/, '_hover');else{this.src=this.src.replace(/_selected|_hover/, '_default');}this.border=0;\" onclick=\"scrollSmilieTypeBar($('scrollbar'), 1-$('t_s_1').clientWidth);\"/>&nbsp;\r\n");
	templateBuilder.Append("					<img src=\"editor/images/smilie_next_default.gif\" alt=\"向后\"  onmouseover=\"if($('scrollbar').scrollLeft<scrMaxLeft)this.src=this.src.replace(/_default|_selected/, '_hover');\" onmouseout=\"this.src=this.src.replace(/_hover|_selected/, '_default');\" onmousedown=\"if($('scrollbar').scrollLeft<scrMaxLeft){this.src=this.src.replace(/_hover|_default/, '_selected');this.boder=1;}\" onmouseup=\"if($('scrollbar').scrollLeft<scrMaxLeft)this.src=this.src.replace(/_selected/, '_hover');else{this.src=this.src.replace(/_selected|_hover/, '_default');}this.border=0;\" onclick=\"scrollSmilieTypeBar($('scrollbar'), $('t_s_1').clientWidth);\" />\r\n");
	templateBuilder.Append("				</div>	\r\n");
	templateBuilder.Append("			</div>\r\n");
	templateBuilder.Append("			<div id=\"showsmilie\"\r\n");

	if (config.Smileyinsert==0)
	{

	templateBuilder.Append(" style=\"display: none;\"\r\n");

	}	//end if

	templateBuilder.Append("><img src=\"images/common/loading_wide.gif\" width=\"90%\" alt=\"表情加载\"/><p>正在加载表情...</p></div>\r\n");
	templateBuilder.Append("			<div id=\"showsmilie_pagenum\">&nbsp;</div>\r\n");
	templateBuilder.Append("		</div>\r\n");
	templateBuilder.Append("		<script type=\"text/javascript\">\r\n");
	templateBuilder.Append("			var firstpagesmilies_json ={ ");
	templateBuilder.Append(firstpagesmilies.ToString());
	templateBuilder.Append(" };\r\n");
	templateBuilder.Append("			showFirstPageSmilies(firstpagesmilies_json, '");
	templateBuilder.Append(defaulttypname.ToString());
	templateBuilder.Append("', 12);\r\n");
	templateBuilder.Append("			function getSmilies(func){\r\n");
	templateBuilder.Append("				var c=\"tools/ajax.aspx?t=smilies\";\r\n");
	templateBuilder.Append("				_sendRequest(c,function(d){var e={};try{e=eval(\"(\"+d+\")\")}catch(f){e={}}var h=e?e:null;func(h);e=null;func=null},false,true)\r\n");
	templateBuilder.Append("			}\r\n");
	templateBuilder.Append("			getSmilies(function(obj){ \r\n");
	templateBuilder.Append("			smilies_HASH = obj; \r\n");
	templateBuilder.Append("			showsmiles(1, '");
	templateBuilder.Append(defaulttypname.ToString());
	templateBuilder.Append("');\r\n");
	templateBuilder.Append("			});\r\n");
	templateBuilder.Append("			window.onload = function() {\r\n");
	templateBuilder.Append("				$('scrollbar').scrollLeft = 10000;\r\n");
	templateBuilder.Append("				scrMaxLeft = $('scrollbar').scrollLeft;\r\n");
	templateBuilder.Append("				$('scrollbar').scrollLeft = 1;	\r\n");
	templateBuilder.Append("				if ($('scrollbar').scrollLeft > 0)\r\n");
	templateBuilder.Append("				{\r\n");
	templateBuilder.Append("					$('scrlcontrol').style.display = '';\r\n");
	templateBuilder.Append("					$('scrollbar').scrollLeft = 0;	\r\n");
	templateBuilder.Append("				}\r\n");
	templateBuilder.Append("			}\r\n");
	templateBuilder.Append("		</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("</form>\r\n");


	templateBuilder.Append("<!--quickreply-->\r\n");

	}	//end if

	templateBuilder.Append("<!--replay-->\r\n");

	if (userid<0||canposttopic)
	{

	templateBuilder.Append("	<ul class=\"popupmenu_popup newspecialmenu\" id=\"newspecial_menu\" style=\"display: none\">\r\n");

	if (forum.Allowspecialonly<=0)
	{

	templateBuilder.Append("		<li><a href=\"posttopic.aspx?forumid=");
	templateBuilder.Append(forum.Fid.ToString().Trim());
	templateBuilder.Append("&forumpage=");
	templateBuilder.Append(forumpageid.ToString());
	templateBuilder.Append("\">发新主题</a></li>\r\n");

	}	//end if

	int specialpost = forum.Allowpostspecial&1;
	

	if (specialpost==1 && usergroupinfo.Allowpostpoll==1)
	{

	templateBuilder.Append("		<li class=\"poll\"><a href=\"posttopic.aspx?forumid=");
	templateBuilder.Append(forum.Fid.ToString().Trim());
	templateBuilder.Append("&forumpage=");
	templateBuilder.Append(forumpageid.ToString());
	templateBuilder.Append("&type=poll\">发布投票</a></li>\r\n");

	}	//end if

	 specialpost = forum.Allowpostspecial&4;
	

	if (specialpost==4 && usergroupinfo.Allowbonus==1)
	{

	templateBuilder.Append("			<li class=\"reward\"><a href=\"posttopic.aspx?forumid=");
	templateBuilder.Append(forum.Fid.ToString().Trim());
	templateBuilder.Append("&forumpage=");
	templateBuilder.Append(forumpageid.ToString());
	templateBuilder.Append("&type=bonus\">发布悬赏</a></li>\r\n");

	}	//end if

	 specialpost = forum.Allowpostspecial&16;
	

	if (specialpost==16 && usergroupinfo.Allowdebate==1)
	{

	templateBuilder.Append("			<li class=\"debate\"><a href=\"posttopic.aspx?forumid=");
	templateBuilder.Append(forum.Fid.ToString().Trim());
	templateBuilder.Append("&forumpage=");
	templateBuilder.Append(forumpageid.ToString());
	templateBuilder.Append("&type=debate\">发起辩论</a></li>\r\n");

	}	//end if

	templateBuilder.Append("	</ul>\r\n");

	}	//end if

	templateBuilder.Append("<div class=\"mainbox\">\r\n");
	templateBuilder.Append("	<h3>标题: ");
	templateBuilder.Append(topictitle.ToString());
	templateBuilder.Append("</h3>\r\n");
	templateBuilder.Append("	<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\r\n");

	int posttreeitem__loop__id=0;
	foreach(DataRow posttreeitem in posttree.Rows)
	{
		posttreeitem__loop__id++;

	templateBuilder.Append("	<tr>\r\n");
	templateBuilder.Append("		<td>\r\n");
	templateBuilder.Append("		" + posttreeitem["spaces"].ToString().Trim() + "\r\n");
	templateBuilder.Append("		·<a href=\"showtree.aspx?topicid=");
	templateBuilder.Append(topicid.ToString());
	templateBuilder.Append("&forumpage=");
	templateBuilder.Append(forumpageid.ToString());
	templateBuilder.Append("&postid=" + posttreeitem["pid"].ToString().Trim() + "\">\r\n");

	if (Utils.StrToInt(posttreeitem["pid"].ToString().Trim(), 0)==postid)
	{

	templateBuilder.Append("			" + posttreeitem["title"].ToString().Trim() + "\r\n");

	}
	else
	{

	templateBuilder.Append("			" + posttreeitem["title"].ToString().Trim() + "\r\n");

	}	//end if

	templateBuilder.Append("		</a>\r\n");
	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("		<td>\r\n");

	if (Utils.StrToInt(posttreeitem["posterid"].ToString().Trim(), 0)==-1)
	{

	templateBuilder.Append("			游客\r\n");

	}
	else
	{

	 aspxrewriteurl = this.UserInfoAspxRewrite(posttreeitem["posterid"].ToString().Trim());
	
	templateBuilder.Append("<a href=\"");
	templateBuilder.Append(aspxrewriteurl.ToString());
	templateBuilder.Append("\">" + posttreeitem["poster"].ToString().Trim() + "</a>\r\n");

	}	//end if

	templateBuilder.Append("		</td>\r\n");
	templateBuilder.Append("		<td>发表于 " + posttreeitem["postdatetime"].ToString().Trim() + "</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");

	}	//end loop

	templateBuilder.Append("	</table>\r\n");
	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("<!--reply-->\r\n");

	if (useradminid>0||usergroupinfo.Raterange!=""||config.Forumjump==1)
	{

	templateBuilder.Append("<!--forumjumping start-->\r\n");
	templateBuilder.Append("<div id=\"footfilter\" class=\"box\">\r\n");

	if (useradminid>0)
	{

	templateBuilder.Append("		<script type=\"text/javascript\">\r\n");
	templateBuilder.Append("			function action_onchange(value,objfrm,postid){\r\n");
	templateBuilder.Append("				if (value != ''){\r\n");
	templateBuilder.Append("					objfrm.operat.value = value;\r\n");
	templateBuilder.Append("					objfrm.postid.value = postid;\r\n");
	templateBuilder.Append("					if(value != 'delpost'){\r\n");
	templateBuilder.Append("						objfrm.submit();\r\n");
	templateBuilder.Append("					}\r\n");
	templateBuilder.Append("					else{\r\n");
	templateBuilder.Append("						$('delpost').submit();\r\n");
	templateBuilder.Append("					}\r\n");
	templateBuilder.Append("				}\r\n");
	templateBuilder.Append("			}\r\n");
	templateBuilder.Append("		</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("		<form id=\"moderate\" name=\"moderate\" method=\"post\" action=\"topicadmin.aspx?action=moderate&forumid=");
	templateBuilder.Append(forumid.ToString());
	templateBuilder.Append("\">\r\n");
	templateBuilder.Append("			<input name=\"forumid\" type=\"hidden\" value=\"");
	templateBuilder.Append(forumid.ToString());
	templateBuilder.Append("\" />\r\n");
	templateBuilder.Append("			<input name=\"topicid\" type=\"hidden\" value=\"");
	templateBuilder.Append(topicid.ToString());
	templateBuilder.Append("\" />\r\n");
	templateBuilder.Append("			<input name=\"postid\" type=\"hidden\" value=\"\" />\r\n");
	templateBuilder.Append("			<input name=\"operat\" type=\"hidden\" value=\"\" />\r\n");
	templateBuilder.Append("			<select id=\"operatSel\" onchange=\"action_onchange(this.options[this.selectedIndex].value,this.form,0);\" name=\"operatSel\">\r\n");
	templateBuilder.Append("				<option value=\"\" selected=\"selected\">管理选项</option>\r\n");
	templateBuilder.Append("				<option value=\"delete\">删除主题</option>\r\n");
	templateBuilder.Append("				<option value=\"banpost\">屏蔽单贴</option>\r\n");
	templateBuilder.Append("				<option value=\"delpost\">批量删帖</option>\r\n");
	templateBuilder.Append("				<option value=\"close\">关闭主题</option>\r\n");
	templateBuilder.Append("				<option value=\"move\">移动主题</option>\r\n");
	templateBuilder.Append("				<option value=\"copy\">复制主题</option>\r\n");
	templateBuilder.Append("				<option value=\"highlight\">高亮显示</option>\r\n");
	templateBuilder.Append("				<option value=\"digest\">设置精华</option>\r\n");
	templateBuilder.Append("				<option value=\"identify\">鉴定主题</option>\r\n");
	templateBuilder.Append("				<option value=\"displayorder\">主题置顶</option>\r\n");
	templateBuilder.Append("				<option value=\"split\">分割主题</option>\r\n");
	templateBuilder.Append("				<option value=\"merge\">合并主题</option>\r\n");
	templateBuilder.Append("				<option value=\"repair\">修复主题</option>\r\n");
	templateBuilder.Append("			</select>		\r\n");
	templateBuilder.Append("		</form>\r\n");

	}
	else if (usergroupinfo.Raterange!="")
	{

	templateBuilder.Append("		<script type=\"text/javascript\">\r\n");
	templateBuilder.Append("			function action_onchange(value,objfrm,postid){\r\n");
	templateBuilder.Append("				if (value != ''){\r\n");
	templateBuilder.Append("					objfrm.operat.value = value;\r\n");
	templateBuilder.Append("					objfrm.postid.value = postid;\r\n");
	templateBuilder.Append("					if(value != 'delpost'){\r\n");
	templateBuilder.Append("						objfrm.submit();\r\n");
	templateBuilder.Append("					}\r\n");
	templateBuilder.Append("					else{\r\n");
	templateBuilder.Append("						$('delpost').submit();\r\n");
	templateBuilder.Append("					}\r\n");
	templateBuilder.Append("				}\r\n");
	templateBuilder.Append("			}\r\n");
	templateBuilder.Append("		</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("		<form id=\"moderate\" name=\"moderate\" method=\"post\" action=\"topicadmin.aspx?action=moderate&forumid=");
	templateBuilder.Append(forumid.ToString());
	templateBuilder.Append("\">\r\n");
	templateBuilder.Append("			<input name=\"forumid\" type=\"hidden\" value=\"");
	templateBuilder.Append(forumid.ToString());
	templateBuilder.Append("\" />\r\n");
	templateBuilder.Append("			<input name=\"topicid\" type=\"hidden\" value=\"");
	templateBuilder.Append(topicid.ToString());
	templateBuilder.Append("\" />\r\n");
	templateBuilder.Append("			<input name=\"postid\" type=\"hidden\" value=\"\" />\r\n");
	templateBuilder.Append("			<input name=\"operat\" type=\"hidden\" value=\"\" />\r\n");
	templateBuilder.Append("		</form>\r\n");

	}	//end if

	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("<!--forumjumping end-->\r\n");

	}	//end if

	templateBuilder.Append("</div>\r\n");

	}
	else
	{


	if (needlogin)
	{


	templateBuilder.Append("<div class=\"box message\">\r\n");
	templateBuilder.Append("	<h1>");
	templateBuilder.Append(config.Forumtitle.ToString().Trim());
	templateBuilder.Append(" 提示信息</h1>\r\n");
	templateBuilder.Append("	<p>您无权进行当前操作，这可能因以下原因之一造成</p>\r\n");
	templateBuilder.Append("	<p><b>");
	templateBuilder.Append(msgbox_text.ToString());
	templateBuilder.Append("</b></p>\r\n");
	templateBuilder.Append("	<p>您还没有登录，请填写下面的登录表单后再尝试访问。</p>\r\n");
	templateBuilder.Append("	<form id=\"formlogin\" name=\"formlogin\" method=\"post\" action=\"login.aspx\" onsubmit=\"submitLogin(this);\">\r\n");
	templateBuilder.Append("		<input type=\"hidden\" value=\"2592000\" name=\"cookietime\"/>\r\n");
	templateBuilder.Append("	<div class=\"box\" style=\"margin: 10px auto; width: 60%;\">\r\n");
	templateBuilder.Append("		<table cellpadding=\"4\" cellspacing=\"0\" width=\"100%\">\r\n");
	templateBuilder.Append("		<thead>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<td colspan=\"2\">会员登录</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("		</thead>\r\n");
	templateBuilder.Append("		<tbody>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<td>用户名</td>\r\n");
	templateBuilder.Append("				<td><input type=\"text\" id=\"username\" name=\"username\" size=\"25\" maxlength=\"40\" tabindex=\"2\" />  <a href=\"register.aspx\" tabindex=\"-1\" accesskey=\"r\" title=\"立即注册 (ALT + R)\">立即注册</a>\r\n");
	templateBuilder.Append("				</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<td>密码</td>\r\n");
	templateBuilder.Append("				<td><input type=\"password\" name=\"password\" size=\"25\" tabindex=\"3\" /> <a href=\"getpassword.aspx\" tabindex=\"-1\" accesskey=\"g\" title=\"忘记密码 (ALT + G)\">忘记密码</a>\r\n");
	templateBuilder.Append("				</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");

	if (config.Secques==1)
	{

	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<td>安全问题</td>\r\n");
	templateBuilder.Append("				<td>\r\n");
	templateBuilder.Append("					<select name=\"questionid\" tabindex=\"4\">\r\n");
	templateBuilder.Append("					<option value=\"0\">&nbsp;</option>\r\n");
	templateBuilder.Append("					<option value=\"1\">母亲的名字</option>\r\n");
	templateBuilder.Append("					<option value=\"2\">爷爷的名字</option>\r\n");
	templateBuilder.Append("					<option value=\"3\">父亲出生的城市</option>\r\n");
	templateBuilder.Append("					<option value=\"4\">您其中一位老师的名字</option>\r\n");
	templateBuilder.Append("					<option value=\"5\">您个人计算机的型号</option>\r\n");
	templateBuilder.Append("					<option value=\"6\">您最喜欢的餐馆名称</option>\r\n");
	templateBuilder.Append("					<option value=\"7\">驾驶执照的最后四位数字</option>\r\n");
	templateBuilder.Append("					</select>\r\n");
	templateBuilder.Append("				</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<td>答案</td>\r\n");
	templateBuilder.Append("				<td><input type=\"text\" name=\"answer\" size=\"25\" tabindex=\"5\" /></td>\r\n");
	templateBuilder.Append("			</tr>\r\n");

	}	//end if

	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<td>&nbsp;</td>\r\n");
	templateBuilder.Append("				<td>\r\n");
	templateBuilder.Append("					<button class=\"submit\" type=\"submit\" name=\"loginsubmit\" id=\"loginsubmit\" value=\"true\" tabindex=\"6\">会员登录</button>\r\n");
	templateBuilder.Append("				</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("		</tbody>\r\n");
	templateBuilder.Append("		</table>\r\n");
	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("	</form>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\">\r\n");
	templateBuilder.Append("	document.getElementById(\"username\").focus();\r\n");
	templateBuilder.Append("	function submitLogin(loginForm)\r\n");
	templateBuilder.Append("	{\r\n");
	templateBuilder.Append("		loginForm.action = 'login.aspx?loginsubmit=true&reurl=' + escape(window.location);\r\n");
	templateBuilder.Append("		loginForm.submit();\r\n");
	templateBuilder.Append("	}\r\n");
	templateBuilder.Append("</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("</div>\r\n");



	}
	else
	{


	templateBuilder.Append("<div class=\"box message\">\r\n");
	templateBuilder.Append("	<h1>出现了");
	templateBuilder.Append(page_err.ToString());
	templateBuilder.Append("个错误</h1>\r\n");
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
	templateBuilder.Append("\\\">返回上一步</a> &nbsp; &nbsp;|&nbsp; &nbsp  \");\r\n");
	templateBuilder.Append("			}\r\n");
	templateBuilder.Append("		</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("		<a href=\"forumindex.aspx\">论坛首页</a>\r\n");

	if (usergroupid==7)
	{

	templateBuilder.Append("		 &nbsp; &nbsp|&nbsp; &nbsp; <a href=\"register.aspx\">注册</a>\r\n");

	}	//end if

	templateBuilder.Append("	</p>\r\n");
	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("</div>\r\n");



	}	//end if


	}	//end if
	templateBuilder.Append(inpostad.ToString());
	templateBuilder.Append("\r\n");


	if (footerad!="")
	{

	templateBuilder.Append("<!--底部广告显示-->\r\n");
	templateBuilder.Append("<div id=\"ad_footerbanner\">");
	templateBuilder.Append(footerad.ToString());
	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("<!--底部广告结束-->\r\n");

	}	//end if

	templateBuilder.Append("<div id=\"footer\">\r\n");
	templateBuilder.Append("	<div class=\"wrap\">\r\n");
	templateBuilder.Append("		<div id=\"footlinks\">\r\n");
	templateBuilder.Append("			<p><a href=\"");
	templateBuilder.Append(config.Weburl.ToString().Trim());
	templateBuilder.Append("\" target=\"_blank\">");
	templateBuilder.Append(config.Webtitle.ToString().Trim());
	templateBuilder.Append("</a>&nbsp; ");
	templateBuilder.Append(config.Linktext.ToString().Trim());
	templateBuilder.Append("\r\n");

	if (config.Sitemapstatus==1)
	{

	templateBuilder.Append("&nbsp;<a href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("tools/sitemap.aspx\" target=\"_blank\" title=\"百度论坛收录协议\">Sitemap</a>\r\n");

	}	//end if

	templateBuilder.Append("				");
	templateBuilder.Append(config.Statcode.ToString().Trim());
	templateBuilder.Append("\r\n");
	templateBuilder.Append("				");
	templateBuilder.Append(config.Icp.ToString().Trim());
	templateBuilder.Append("\r\n");
	templateBuilder.Append("			</p>\r\n");
	templateBuilder.Append("			<p>\r\n");
	templateBuilder.Append("			<a href=\"http://www.comsenz.com/\" target=\"_blank\">Comsenz Technology Ltd</a>\r\n");
	templateBuilder.Append("			- <a href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("archiver/index.aspx\" target=\"_blank\">简洁版本</a>\r\n");
	templateBuilder.Append("			- <span class=\"scrolltop\" onclick=\"window.scrollTo(0,0);\">TOP</span>\r\n");

	if (config.Stylejump==1)
	{


	if (userid!=-1 || config.Guestcachepagetimeout<=0)
	{

	templateBuilder.Append("			- <span id=\"styleswitcher\" class=\"dropmenu\" onmouseover=\"showMenu(this.id)\" onclick=\"window.location.href='");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("showtemplate.aspx'\">界面风格</span>\r\n");
	templateBuilder.Append("				<div id=\"styleswitcher_menu\" class=\"popupmenu_popup\" style=\"display: none;\">\r\n");
	templateBuilder.Append("					<ul>\r\n");
	templateBuilder.Append("						");
	templateBuilder.Append(templatelistboxoptions.ToString());
	templateBuilder.Append("\r\n");
	templateBuilder.Append("					</ul>\r\n");
	templateBuilder.Append("				</div>\r\n");

	}	//end if


	}	//end if

	templateBuilder.Append("			</p>\r\n");
	templateBuilder.Append("		</div>\r\n");
	templateBuilder.Append("		<a title=\"Powered by Discuz!NT\" target=\"_blank\" href=\"http://nt.discuz.net\"><img border=\"0\" alt=\"Discuz!NT\" src=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append("templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/discuznt_logo.gif\"/></a>\r\n");
	templateBuilder.Append("		<p id=\"copyright\">\r\n");
	templateBuilder.Append("			Powered by <strong><a href=\"http://nt.discuz.net\" target=\"_blank\" title=\"Discuz!NT 2.6 (.NET Framework 2.0/3.x)\">Discuz!NT</a></strong> <em>2.6.0</em>\r\n");

	if (config.Licensed==1)
	{

	templateBuilder.Append("				(<a href=\"\" onclick=\"this.href='http://nt.discuz.net/certificate/?host='+location.href.substring(0, location.href.lastIndexOf('/'))\" target=\"_blank\">Licensed</a>)\r\n");

	}	//end if

	templateBuilder.Append("				");
	templateBuilder.Append(config.Forumcopyright.ToString().Trim());
	templateBuilder.Append("\r\n");
	templateBuilder.Append("		</p>\r\n");
	templateBuilder.Append("		<p id=\"debuginfo\">\r\n");

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
	templateBuilder.Append("<ul class=\"popupmenu_popup\" id=\"viewpro_menu\" style=\"display: none\">\r\n");

	if (useravatar!="")
	{

	templateBuilder.Append("		<img src=\"");
	templateBuilder.Append(useravatar.ToString());
	templateBuilder.Append("\"/>\r\n");

	}	//end if

	 aspxrewriteurl = this.UserInfoAspxRewrite(userid);
	
	templateBuilder.Append("	<li class=\"popuser\"><a href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append(aspxrewriteurl.ToString());
	templateBuilder.Append("\">我的资料</a></li>\r\n");

	if (config.Enablespace==1)
	{

	templateBuilder.Append("	 <li class=\"poplink\">\r\n");
	templateBuilder.Append("	<a href=\"");
	templateBuilder.Append(forumurl.ToString());
	templateBuilder.Append(spaceurl.ToString());
	templateBuilder.Append("space/\">我的空间</a>\r\n");
	templateBuilder.Append("	</li>\r\n");

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

	templateBuilder.Append("<div id=\"quicksearch_menu\" class=\"searchmenu\" style=\"display: none;\">\r\n");
	templateBuilder.Append("	<div onclick=\"document.getElementById('keywordtype').value='0';document.getElementById('quicksearch').innerHTML='帖子标题';document.getElementById('quicksearch_menu').style.display='none';\" onmouseover=\"MouseCursor(this);\">帖子标题</div>\r\n");

	if (config.Enablespace==1)
	{

	templateBuilder.Append("	<div onclick=\"document.getElementById('keywordtype').value='2';document.getElementById('quicksearch').innerHTML='空间日志';document.getElementById('quicksearch_menu').style.display='none';\" onmouseover=\"MouseCursor(this);\">空间日志</div>\r\n");

	}	//end if


	if (config.Enablealbum==1)
	{

	templateBuilder.Append("	<div onclick=\"document.getElementById('keywordtype').value='3';document.getElementById('quicksearch').innerHTML='相册标题';document.getElementById('quicksearch_menu').style.display='none';\" onmouseover=\"MouseCursor(this);\">相册标题</div>\r\n");

	}	//end if

	templateBuilder.Append("	<div onclick=\"document.getElementById('keywordtype').value='8';document.getElementById('quicksearch').innerHTML='作&nbsp;&nbsp;者';document.getElementById('quicksearch_menu').style.display='none';\" onmouseover=\"MouseCursor(this);\">作&nbsp;&nbsp;者</div>\r\n");
	templateBuilder.Append("</div>\r\n");




	if (floatad!="")
	{

	templateBuilder.Append("	<script type=\"text/javascript\" src=\"javascript/template_floatadv.js\"></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("	");
	templateBuilder.Append(floatad.ToString());
	templateBuilder.Append("\r\n");
	templateBuilder.Append("	<script type=\"text/javascript\">theFloaters.play();</");
	templateBuilder.Append("script>\r\n");

	}
	else if (doublead!="")
	{

	templateBuilder.Append("	<script type=\"text/javascript\" src=\"javascript/template_floatadv.js\"></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("	");
	templateBuilder.Append(doublead.ToString());
	templateBuilder.Append("\r\n");
	templateBuilder.Append("	<script type=\"text/javascript\">theFloaters.play();</");
	templateBuilder.Append("script>\r\n");

	}	//end if




	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("</body>\r\n");
	templateBuilder.Append("</html>\r\n");



	Response.Write(templateBuilder.ToString());
}
</script>
