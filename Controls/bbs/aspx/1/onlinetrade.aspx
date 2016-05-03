<%@ Page language="c#" AutoEventWireup="false" EnableViewState="false" Inherits="Discuz.Mall.Pages.onlinetrade" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="Discuz.Common" %>
<%@ Import namespace="Discuz.Forum" %>
<%@ Import namespace="Discuz.Entity" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by Discuz!NT Template Engine at 2009/9/29 9:13:06.
		本页面代码由Discuz!NT模板引擎生成于 2009/9/29 9:13:06. 
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


	if (ispay)
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

	templateBuilder.Append("<script language=\"javascript\" src=\"javascript/template_trade.js\"></");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\">\r\n");
	templateBuilder.Append("zoomstatus = parseInt(1);\r\n");
	templateBuilder.Append("</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("	<form method=\"post\" id=\"tradepost\" name=\"tradepost\" action=\"onlinetrade.aspx?goodstradelogid=");
	templateBuilder.Append(goodstradelogid.ToString());
	templateBuilder.Append("\">\r\n");
	templateBuilder.Append("	<input id=\"operation\" name=\"operation\" type=\"hidden\" value=\"\" />\r\n");
	templateBuilder.Append("	<div class=\"mainbox tradeinfo\">\r\n");
	templateBuilder.Append("		<h2>支付宝在线交易</h2>\r\n");
	templateBuilder.Append("		<table summary=\"支付宝在线交易\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n");
	templateBuilder.Append("	        <tr>\r\n");
	templateBuilder.Append("				<th>状态</th>\r\n");
	templateBuilder.Append("				<td> \r\n");

	if (goodstradelog.Status<=0)
	{

	templateBuilder.Append("				    未生效的交易\r\n");

	}	//end if


	if (goodstradelog.Status==1)
	{

	templateBuilder.Append("				    等待买家付款\r\n");

	}	//end if


	if (goodstradelog.Status==2)
	{

	templateBuilder.Append("				    交易已创建, 等待卖家确认\r\n");

	}	//end if


	if (goodstradelog.Status==3)
	{

	templateBuilder.Append("				    确认买家付款中,暂勿发货\r\n");

	}	//end if


	if (goodstradelog.Status==4)
	{

	templateBuilder.Append("				    买家已付款,等待卖家发货\r\n");

	}	//end if


	if (goodstradelog.Status==5)
	{

	templateBuilder.Append("				    卖家已发货,买家确认中\r\n");

	}	//end if


	if (goodstradelog.Status==6)
	{

	templateBuilder.Append("				    买家确认收到货,等待支付宝打款给卖家\r\n");

	}	//end if


	if (goodstradelog.Status==7)
	{

	templateBuilder.Append("				    交易成功结束\r\n");

	}	//end if


	if (goodstradelog.Status==8)
	{

	templateBuilder.Append("				    交易中途关闭(未完成)\r\n");

	}	//end if


	if (goodstradelog.Status==10)
	{

	templateBuilder.Append("				    等待卖家同意退款\r\n");

	}	//end if


	if (goodstradelog.Status==11)
	{

	templateBuilder.Append("				    卖家拒绝买家条件，等待买家修改条件\r\n");

	}	//end if


	if (goodstradelog.Status==12)
	{

	templateBuilder.Append("				    卖家同意退款，等待买家退货\r\n");

	}	//end if


	if (goodstradelog.Status==13)
	{

	templateBuilder.Append("				    等待卖家收货\r\n");

	}	//end if


	if (goodstradelog.Status==17)
	{

	templateBuilder.Append("				    退款成功\r\n");

	}	//end if

	templateBuilder.Append("				(");
	templateBuilder.Append(goodstradelog.Lastupdate.ToString().Trim());
	templateBuilder.Append(")</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");

	if (goodstradelog.Status<=0)
	{

	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th>支付宝交易单</th>\r\n");
	templateBuilder.Append("				<td>\r\n");

	if (isbuyer)
	{

	templateBuilder.Append("				    <button type=\"button\" name=\"\" onclick=\"window.open('onlinetrade.aspx?goodstradelogid=");
	templateBuilder.Append(goodstradelogid.ToString());
	templateBuilder.Append("&pay=yes','','');\">使用支付宝在线支付</button>\r\n");

	}	//end if


	if (isseller)
	{

	templateBuilder.Append("		    	    <button type=\"button\" name=\"\" onclick=\"window.open('https://www.alipay.com/trade/query_trade_detail.htm?trade_no=");
	templateBuilder.Append(goodstradelog.Tradeno.ToString().Trim());
	templateBuilder.Append("', '', '');\">查看并确认支付宝交易单状态</button>\r\n");

	}	//end if

	templateBuilder.Append("				</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");

	}	//end if


	if (goodstradelog.Status==7)
	{

	templateBuilder.Append("		    <tr>\r\n");
	templateBuilder.Append("				<th>\r\n");

	if (israted)
	{

	templateBuilder.Append("您已发表过评价\r\n");

	}
	else
	{

	templateBuilder.Append("&nbsp;\r\n");

	}	//end if

	templateBuilder.Append("</th>\r\n");
	templateBuilder.Append("				<td>\r\n");

	if (!israted)
	{

	templateBuilder.Append("				    <button type=\"button\" onclick=\"window.open('goodsrate.aspx?goodstradelogid=");
	templateBuilder.Append(goodstradelog.Id.ToString().Trim());
	templateBuilder.Append("', '', '')\">评价</button>\r\n");

	}
	else
	{

	templateBuilder.Append("                    &nbsp;				    \r\n");

	}	//end if

	templateBuilder.Append("				</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");

	}	//end if


	if (goodstradelog.Status==17)
	{

	templateBuilder.Append("		    <tr>\r\n");
	templateBuilder.Append("				<th>\r\n");

	if (israted)
	{

	templateBuilder.Append("您已发表过评价\r\n");

	}
	else
	{

	templateBuilder.Append("&nbsp;\r\n");

	}	//end if

	templateBuilder.Append("</th>\r\n");
	templateBuilder.Append("				<td>\r\n");

	if (!israted)
	{

	templateBuilder.Append("				    <button type=\"button\" onclick=\"window.open('goodsrate.aspx?goodstradelogid=");
	templateBuilder.Append(goodstradelog.Id.ToString().Trim());
	templateBuilder.Append("', '', '')\">评价</button>\r\n");

	}
	else
	{

	templateBuilder.Append("                    &nbsp;				    \r\n");

	}	//end if

	templateBuilder.Append("				</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");

	}	//end if

	templateBuilder.Append("		</table>\r\n");
	templateBuilder.Append("	</div>\r\n");
	templateBuilder.Append("    <div class=\"mainbox\">\r\n");
	templateBuilder.Append("		    <h2>交易单</h2>\r\n");
	templateBuilder.Append("		<table summary=\"确认购买信息\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th>支付总额</th>\r\n");
	templateBuilder.Append("				<td><strong id=\"caculate\"></strong>&nbsp;元</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");

	if (isseller)
	{

	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th>买家</th>\r\n");
	 aspxrewriteurl = this.UserInfoAspxRewrite(goodstradelog.Buyerid);
	
	templateBuilder.Append("				<td><a href=\"");
	templateBuilder.Append(aspxrewriteurl.ToString());
	templateBuilder.Append("\" target=\"_blank\">");
	templateBuilder.Append(goodstradelog.Buyer.ToString().Trim());
	templateBuilder.Append("</a>\r\n");
	templateBuilder.Append("				&nbsp;<a href=\"usercppostpm.aspx?msgtoid=");
	templateBuilder.Append(goodstradelog.Buyerid.ToString().Trim());
	templateBuilder.Append("\" target=\"_blank\">[发短消息]</a>					</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th>卖家</th>\r\n");
	 aspxrewriteurl = this.UserInfoAspxRewrite(goodstradelog.Sellerid);
	
	templateBuilder.Append("				<td><a href=\"");
	templateBuilder.Append(aspxrewriteurl.ToString());
	templateBuilder.Append("\" target=\"_blank\">");
	templateBuilder.Append(goodstradelog.Seller.ToString().Trim());
	templateBuilder.Append("</a>\r\n");
	templateBuilder.Append("				 <a href=\"https://www.alipay.com/trade/i_credit.do?email=");
	templateBuilder.Append(goodstradelog.Selleraccount.ToString().Trim());
	templateBuilder.Append("\" style=\"vertical-align: middle;\" target=\"_blank\"><img src=\"templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/alipaysmall.gif\" border=\"0\" alt=\"支付宝账户信用信息\" /></a>										</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th>商品名称</th>\r\n");
	 aspxrewriteurl = this.ShowGoodsAspxRewrite(goodstradelog.Goodsid);
	
	templateBuilder.Append("				<td><a href=\"");
	templateBuilder.Append(aspxrewriteurl.ToString());
	templateBuilder.Append("\" target=\"_blank\">");
	templateBuilder.Append(goodstradelog.Subject.ToString().Trim());
	templateBuilder.Append("</a></td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th><label for=\"newprice\">商品现价</label></th>\r\n");
	templateBuilder.Append("				<td>");
	templateBuilder.Append(goodstradelog.Price.ToString().Trim());
	templateBuilder.Append(" 元</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th><label for=\"newnumber\">购买数量</label></th>\r\n");
	templateBuilder.Append("				<td>");
	templateBuilder.Append(goodstradelog.Number.ToString().Trim());
	templateBuilder.Append("</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th>物流方式</th>\r\n");
	templateBuilder.Append("				<td>\r\n");

	if (goodstradelog.Transportpay==0)
	{

	templateBuilder.Append("						虚拟物品或无需邮递 \r\n");

	}	//end if


	if (goodstradelog.Transportpay==1)
	{

	templateBuilder.Append("						卖家承担运费\r\n");

	}	//end if


	if (goodstradelog.Transportpay==2)
	{

	templateBuilder.Append("						买家承担运费\r\n");

	}	//end if


	if (goodstradelog.Transportpay==3)
	{

	templateBuilder.Append("						买家收到货物后直接支付给物流公司\r\n");

	}	//end if


	if (goodstradelog.Sellerid==userid)
	{

	templateBuilder.Append("						运费 \r\n");

	if (goodstradelog.Status<=0)
	{

	templateBuilder.Append("							<input type=\"text\" id=\"fee\" name=\"fee\"  value=\"");
	templateBuilder.Append(goodstradelog.Transportfee.ToString().Trim());
	templateBuilder.Append("\">\r\n");

	}
	else
	{

	templateBuilder.Append("							");
	templateBuilder.Append(goodstradelog.Transportfee.ToString().Trim());
	templateBuilder.Append("  \r\n");

	}	//end if

	templateBuilder.Append("						元\r\n");

	}	//end if

	templateBuilder.Append("				</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th><label for=\"newbuyername\">收货人姓名</label></th>\r\n");
	templateBuilder.Append("				<td>");
	templateBuilder.Append(goodstradelog.Buyername.ToString().Trim());
	templateBuilder.Append("</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th><label for=\"newbuyercontact\">收货地址</label></th>\r\n");
	templateBuilder.Append("				<td>");
	templateBuilder.Append(goodstradelog.Buyercontact.ToString().Trim());
	templateBuilder.Append("</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th><label for=\"newbuyerzip\">收货人邮编</label></th>\r\n");
	templateBuilder.Append("				<td>");
	templateBuilder.Append(goodstradelog.Buyerzip.ToString().Trim());
	templateBuilder.Append("</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th><label for=\"newbuyerphone\">收货人电话</label></th>\r\n");
	templateBuilder.Append("				<td>");
	templateBuilder.Append(goodstradelog.Buyerphone.ToString().Trim());
	templateBuilder.Append("</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th><label for=\"newbuyermobile\">收货人手机</label></th>\r\n");
	templateBuilder.Append("				<td>");
	templateBuilder.Append(goodstradelog.Buyermobile.ToString().Trim());
	templateBuilder.Append("</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th><label for=\"newbuyermsg\">备注信息</label></th>\r\n");
	templateBuilder.Append("				<td>");
	templateBuilder.Append(goodstradelog.Buyermsg.ToString().Trim());
	templateBuilder.Append("</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");

	}	//end if


	if (isbuyer)
	{

	templateBuilder.Append("	        <tr>\r\n");
	templateBuilder.Append("				<th>买家</th>\r\n");
	 aspxrewriteurl = this.UserInfoAspxRewrite(goodstradelog.Buyerid);
	
	templateBuilder.Append("				<td><a href=\"");
	templateBuilder.Append(aspxrewriteurl.ToString());
	templateBuilder.Append("\" target=\"_blank\">");
	templateBuilder.Append(goodstradelog.Buyer.ToString().Trim());
	templateBuilder.Append("</a></td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th>卖家</th>\r\n");
	 aspxrewriteurl = this.UserInfoAspxRewrite(goodstradelog.Sellerid);
	
	templateBuilder.Append("				<td><a href=\"");
	templateBuilder.Append(aspxrewriteurl.ToString());
	templateBuilder.Append("\" target=\"_blank\">");
	templateBuilder.Append(goodstradelog.Seller.ToString().Trim());
	templateBuilder.Append("</a>\r\n");
	templateBuilder.Append("				 &nbsp;<a href=\"usercppostpm.aspx?msgtoid=");
	templateBuilder.Append(goodstradelog.Sellerid.ToString().Trim());
	templateBuilder.Append("\" target=\"_blank\">[发短消息]</a>					\r\n");
	templateBuilder.Append("				 <a href=\"https://www.alipay.com/trade/i_credit.do?email=");
	templateBuilder.Append(goodstradelog.Selleraccount.ToString().Trim());
	templateBuilder.Append("\" style=\"vertical-align: middle;\" target=\"_blank\"><img src=\"templates/");
	templateBuilder.Append(templatepath.ToString());
	templateBuilder.Append("/images/alipaysmall.gif\" border=\"0\" alt=\"支付宝账户信用信息\" /></a>\r\n");
	templateBuilder.Append("				 </td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th>商品名称</th>\r\n");
	 aspxrewriteurl = this.ShowGoodsAspxRewrite(goodstradelog.Goodsid);
	
	templateBuilder.Append("				<td><a href=\"");
	templateBuilder.Append(aspxrewriteurl.ToString());
	templateBuilder.Append("\" target=\"_blank\">");
	templateBuilder.Append(goodstradelog.Subject.ToString().Trim());
	templateBuilder.Append("</a></td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th><label for=\"newprice\">商品现价</label></th>\r\n");
	templateBuilder.Append("				<td>");
	templateBuilder.Append(goodstradelog.Price.ToString().Trim());
	templateBuilder.Append(" 元</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th><label for=\"number\">购买数量</label></th>\r\n");
	templateBuilder.Append("				<td>");
	templateBuilder.Append(goodstradelog.Number.ToString().Trim());
	templateBuilder.Append("</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th>物流方式</th>\r\n");
	templateBuilder.Append("				<td>\r\n");

	if (goodstradelog.Transportpay==0)
	{

	templateBuilder.Append("					    虚拟物品或无需邮递 \r\n");

	}	//end if


	if (goodstradelog.Transportpay==1)
	{

	templateBuilder.Append("					    卖家承担运费\r\n");

	}	//end if


	if (goodstradelog.Transportpay==2)
	{

	templateBuilder.Append("					    买家承担运费\r\n");

	}	//end if


	if (goodstradelog.Transportpay==3)
	{

	templateBuilder.Append("					    买家收到货物后直接支付给物流公司\r\n");

	}	//end if

	templateBuilder.Append("					运费 ");
	templateBuilder.Append(goodstradelog.Transportfee.ToString().Trim());
	templateBuilder.Append("  元\r\n");
	templateBuilder.Append("				</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th><label for=\"buyername\">收货人姓名</label></th>\r\n");
	templateBuilder.Append("				<td>\r\n");

	if (goodstradelog.Status<=0)
	{

	templateBuilder.Append("				        <input type=\"text\" id=\"buyername\" name=\"buyername\" maxlength=\"50\" value=\"");
	templateBuilder.Append(goodstradelog.Buyername.ToString().Trim());
	templateBuilder.Append("\" />\r\n");

	}
	else
	{

	templateBuilder.Append("				        ");
	templateBuilder.Append(goodstradelog.Buyername.ToString().Trim());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("				   </td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th><label for=\"buyercontact\">收货地址</label></th>\r\n");
	templateBuilder.Append("				<td>\r\n");

	if (goodstradelog.Status<=0)
	{

	templateBuilder.Append("				        <input type=\"text\" id=\"buyercontact\" name=\"buyercontact\" maxlength=\"100\" size=\"80\" value=\"");
	templateBuilder.Append(goodstradelog.Buyercontact.ToString().Trim());
	templateBuilder.Append("\" />\r\n");

	}
	else
	{

	templateBuilder.Append("				        ");
	templateBuilder.Append(goodstradelog.Buyercontact.ToString().Trim());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("				</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th><label for=\"buyerzip\">收货人邮编</label></th>\r\n");
	templateBuilder.Append("				<td>\r\n");

	if (goodstradelog.Status<=0)
	{

	templateBuilder.Append("				    <input type=\"text\" id=\"buyerzip\" name=\"buyerzip\" maxlength=\"10\" value=\"");
	templateBuilder.Append(goodstradelog.Buyerzip.ToString().Trim());
	templateBuilder.Append("\" />\r\n");

	}
	else
	{

	templateBuilder.Append("				        ");
	templateBuilder.Append(goodstradelog.Buyercontact.ToString().Trim());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("				</td>    \r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th><label for=\"buyerphone\">收货人电话</label></th>\r\n");
	templateBuilder.Append("				<td>\r\n");

	if (goodstradelog.Status<=0)
	{

	templateBuilder.Append("				    <input type=\"text\" id=\"buyerphone\" name=\"buyerphone\" maxlength=\"20\" value=\"");
	templateBuilder.Append(goodstradelog.Buyerphone.ToString().Trim());
	templateBuilder.Append("\" />\r\n");

	}
	else
	{

	templateBuilder.Append("				        ");
	templateBuilder.Append(goodstradelog.Buyercontact.ToString().Trim());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("				</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th><label for=\"buyermobile\">收货人手机</label></th>\r\n");
	templateBuilder.Append("				<td>\r\n");

	if (goodstradelog.Status<=0)
	{

	templateBuilder.Append("				    <input type=\"text\" id=\"buyermobile\" name=\"buyermobile\" maxlength=\"20\" value=\"");
	templateBuilder.Append(goodstradelog.Buyermobile.ToString().Trim());
	templateBuilder.Append("\" />\r\n");

	}
	else
	{

	templateBuilder.Append("				        ");
	templateBuilder.Append(goodstradelog.Buyercontact.ToString().Trim());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("				</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");
	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th><label for=\"buyermsg\">备注信息</label><div class=\"tips\">200 字以内</div></th>\r\n");
	templateBuilder.Append("				<td>\r\n");

	if (goodstradelog.Status<=0)
	{

	templateBuilder.Append("					<textarea id=\"buyermsg\" name=\"buyermsg\" style=\"width: 95%\" rows=\"3\">");
	templateBuilder.Append(goodstradelog.Buyermsg.ToString().Trim());
	templateBuilder.Append("</textarea>\r\n");

	}
	else
	{

	templateBuilder.Append("				        ");
	templateBuilder.Append(goodstradelog.Buyercontact.ToString().Trim());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append("				</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");

	}	//end if


	if (goodstradelog.Status==0)
	{

	templateBuilder.Append("			<tr>\r\n");
	templateBuilder.Append("				<th>&nbsp;</th>\r\n");
	templateBuilder.Append("				<td>\r\n");
	templateBuilder.Append("					<button type=\"submit\" name=\"tradesubmit\" value=\"true\"  >更新交易单</button>\r\n");
	templateBuilder.Append("				</td>\r\n");
	templateBuilder.Append("			</tr>\r\n");

	}	//end if

	templateBuilder.Append("		</table>\r\n");
	templateBuilder.Append("	    </div>\r\n");
	templateBuilder.Append("</form>\r\n");
	templateBuilder.Append("<script type=\"text/javascript\">\r\n");
	templateBuilder.Append("function calcsum() {\r\n");
	templateBuilder.Append("	$('caculate').innerHTML = parseFloat(");
	templateBuilder.Append(goodstradelog.Number.ToString().Trim());
	templateBuilder.Append(" * ");
	templateBuilder.Append(goodstradelog.Price.ToString().Trim());
	templateBuilder.Append(" \r\n");

	if (goodstradelog.Transportpay==2)
	{

	templateBuilder.Append(" + ");
	templateBuilder.Append(goodstradelog.Transportfee.ToString().Trim());
	templateBuilder.Append("\r\n");

	}	//end if

	templateBuilder.Append(").toFixed(2);\r\n");
	templateBuilder.Append("}\r\n");
	templateBuilder.Append("calcsum();\r\n");
	templateBuilder.Append("</");
	templateBuilder.Append("script>\r\n");
	templateBuilder.Append("</div>\r\n");

	}	//end if


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
