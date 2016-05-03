﻿function sendRequest(action, isendpage, templatepath, redirect) {
	var oForm = $("quickpostform");
	if (!isendpage || !isendpage == true){
		oForm.submit();
		return;
	}
	//var redirect = (event.ctrlKey && event.altKey && event.keyCode == 13);
	var sBody = getRequestBody(oForm);
	var oXmlHttp = createXMLHttp();
	oXmlHttp.open("post", (action && action != '') ? action : oForm.action, true);
	oXmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	oXmlHttp.onreadystatechange = function () {
		if (oXmlHttp.readyState == 4) {
			if (oXmlHttp.status == 200) {
				saveResult(oXmlHttp.responseXML, templatepath, redirect);
				oForm.replysubmit.disabled = false;
				if ($("reloadvcade")){
					$("reloadvcade").click();
				}
				//bind current post;
			} else {
				alert("An error occurred: " + oXmlHttp.statusText);
			}
		}
	};
	oXmlHttp.send(sBody);
	$('validatemessage').innerHTML='';
}
function getRequestBody(oForm) {
	var aParams = new Array();
	for (var i=0 ; i < oForm.elements.length; i++) {
		if (oForm.elements[i].type == "checkbox" && oForm.elements[i].checked == false)
			continue;
		var sParam = encodeURIComponent(oForm.elements[i].name);
		sParam += "=";
		sParam += encodeURIComponent(oForm.elements[i].value);
		aParams.push(sParam);
	}
	return aParams.join("&");
}

function ajaxctlent(event, objfrm, topicid, isendpage, templatepath) {
	if(postSubmited == false && (event.ctrlKey && event.keyCode == 13) || (event.altKey && event.keyCode == 83)) {
		var redirect = (event.ctrlKey && event.altKey && event.keyCode == 13);
		ajaxreply(objfrm, topicid, isendpage, templatepath, redirect);
	}
}

function ajaxreply(objfrm, topicid, isendpage, templatepath, redirect) {
		if (!$("quickpostsubmit").disabled){
			if (fastvalidate(objfrm, false, false)) {
				sendRequest('tools/ajax.aspx?topicid=' + topicid + '&postid=' + $('quickpostform').postid.value + '&postreplynotice=' + $('quickpostform').postreplynotice.checked + '&t=quickreply', isendpage, templatepath, redirect);			
				window.setTimeout(function(){
					if ($("quickpostsubmit").disabled){
						var message = $("quickpostmessage").innerHTML;
						$("quickpostmessage").innerHTML = "提交时间似乎比平时要长，请耐心等待...";
						window.setTimeout(function(){$("quickpostmessage").innerHTML = $("quickpostsubmit").disabled ? message: ""}, 1000);
					}
				}, 1000);
			}
		}else{
			alert('正在提交, 请稍候...');
		}
}

function getStars(n, t, path) {
	var s = '';
	for (var i = 3; i > 0; i--) {
		var level = parseInt(n / Math.pow(t, i-1));
		n = n % Math.pow(t, i-1);
		for (var j = 0; j < level; j++) {
			s += '<img src="templates/' + path + '/images/star_level' + i + '.gif" />';
		}
	}
	return s;
}

function getInPostad(index){
	try{
		if (inpostad){
				var adstr = '';
				adstr += "<div class=\"line category\"><div style='float: left;'>[广告]&nbsp;</div><div>";
				var tempstr = inpostad[index];
				var ad = tempstr.split("\\r\\n");
				for (var i = 0; i < ad.length; i++)
				{
					adstr += ("\r\n" + ad[i]);
				}
				adstr += "\r\n</div></div>";
				return adstr;
			}
		}catch(e){}
	return "";
}
String.prototype.trim = function(){return this.replace(/(^[\s\t\xa0\u3000]+)|([\u3000\xa0\s\t]+$)/g, "")};
function saveResult(doc, templatepath, redirect){
	var err = doc.getElementsByTagName('error');
	if (err[0] != null && err[0] != undefined){
		if (err[0].childNodes.length > 1) {
		    alert(err[0].childNodes[1].nodeValue);
		} else {
		    alert(err[0].firstChild.nodeValue);    		
		}
		return;
	}


	var invisible = getSingleNodeValue(doc, 'invisible');
	if (invisible == 1){
		alert("回复成功，请等待审核");
		return;
	}

	var ismoder = getSingleNodeValue(doc, 'ismoder');
	var adindex = getSingleNodeValue(doc, 'adindex');
	var status = getSingleNodeValue(doc, 'status');
	var stars = getSingleNodeValue(doc, 'stars');
	var id = getSingleNodeValue(doc, 'id');
	var fid = getSingleNodeValue(doc, 'fid');
	
	var ip = getSingleNodeValue(doc, 'ip');
	var lastedit = getSingleNodeValue(doc, 'lastedit');
	var layer = getSingleNodeValue(doc, 'layer');
	var message = escape(getSingleNodeValue(doc, 'message'));
	var parentid = getSingleNodeValue(doc, 'parentid');
	var pid = getSingleNodeValue(doc, 'pid');
	var postdatetime = getSingleNodeValue(doc, 'postdatetime');
	var poster = getSingleNodeValue(doc, 'poster');
	var posterid = getSingleNodeValue(doc, 'posterid');
	var smileyoff = getSingleNodeValue(doc, 'smileyoff');
	var topicid = getSingleNodeValue(doc, 'topicid');
	var title = getSingleNodeValue(doc, 'title');
	var usesig = getSingleNodeValue(doc, 'usesig');
	var uid = getSingleNodeValue(doc, 'uid');
	var accessmasks = getSingleNodeValue(doc, 'accessmasks');
	var adminid = getSingleNodeValue(doc, 'adminid');
	//var avatar = getSingleNodeValue(doc, 'avatar');
	var avatarheight = getSingleNodeValue(doc, 'avatarheight');
	var avatarshowid = getSingleNodeValue(doc, 'avatarshowid');
	var avatarwidth = getSingleNodeValue(doc, 'avatarwidth');
	var credits = getSingleNodeValue(doc, 'credits');
	var digestposts = getSingleNodeValue(doc, 'digestposts');
	var email = getSingleNodeValue(doc, 'email');
	var score1 = getSingleNodeValue(doc, 'score1');
	var score2 = getSingleNodeValue(doc, 'score2');
	var score3 = getSingleNodeValue(doc, 'score3');
	var score4 = getSingleNodeValue(doc, 'score4');
	var score5 = getSingleNodeValue(doc, 'score5');
	var score6 = getSingleNodeValue(doc, 'score6');
	var score7 = getSingleNodeValue(doc, 'score7');
	var score8 = getSingleNodeValue(doc, 'score8');
	var scoreunit1 = getSingleNodeValue(doc, 'scoreunit1');
	var scoreunit2 = getSingleNodeValue(doc, 'scoreunit2');
	var scoreunit3 = getSingleNodeValue(doc, 'scoreunit3');
	var scoreunit4 = getSingleNodeValue(doc, 'scoreunit4');
	var scoreunit5 = getSingleNodeValue(doc, 'scoreunit5');
	var scoreunit6 = getSingleNodeValue(doc, 'scoreunit6');
	var scoreunit7 = getSingleNodeValue(doc, 'scoreunit7');
	var scoreunit8 = getSingleNodeValue(doc, 'scoreunit8');
	var extcredits1 = getSingleNodeValue(doc, 'extcredits1');
	var extcredits2 = getSingleNodeValue(doc, 'extcredits2');
	var extcredits3 = getSingleNodeValue(doc, 'extcredits3');
	var extcredits4 = getSingleNodeValue(doc, 'extcredits4');
	var extcredits5 = getSingleNodeValue(doc, 'extcredits5');
	var extcredits6 = getSingleNodeValue(doc, 'extcredits6');
	var extcredits7 = getSingleNodeValue(doc, 'extcredits7');
	var extcredits8 = getSingleNodeValue(doc, 'extcredits8');
	var extgroupids = getSingleNodeValue(doc, 'extgroupids');
	var gender = getSingleNodeValue(doc, 'gender');
	var bday = getSingleNodeValue(doc, 'bday');
	var icq = getSingleNodeValue(doc, 'icq');
	var joindate = getSingleNodeValue(doc, 'joindate');
	var lastactivity = getSingleNodeValue(doc, 'lastactivity');
	var medals = getSingleNodeValue(doc, 'medals');
	var nickname = getSingleNodeValue(doc, 'nickname');
	var oltime = getSingleNodeValue(doc, 'oltime');
	var onlinestate = getSingleNodeValue(doc, 'onlinestate');
	var showemail = getSingleNodeValue(doc, 'showemail');
	var signature = getSingleNodeValue(doc, 'signature');
	var sigstatus = getSingleNodeValue(doc, 'sigstatus');
	var skype = getSingleNodeValue(doc, 'skype');
	var website = getSingleNodeValue(doc, 'website');
	var yahoo = getSingleNodeValue(doc, 'yahoo');
	var qq = getSingleNodeValue(doc, 'qq');
	var msn = getSingleNodeValue(doc, 'msn');
	var posts = getSingleNodeValue(doc, 'posts');
	var footerad = getSingleNodeValue(doc, 'ad_thread1');
	var topad = getSingleNodeValue(doc, 'ad_thread2');
	var rightad = getSingleNodeValue(doc, 'ad_thread3');

	var theLocation = getSingleNodeValue(doc, 'location');

	var showavatars = getSingleNodeValue(doc, 'showavatars');
	var userstatusby = getSingleNodeValue(doc, 'userstatusby');
	var starthreshold = getSingleNodeValue(doc, 'starthreshold');
	var forumtitle = getSingleNodeValue(doc, 'forumtitle');
	var showsignatures = getSingleNodeValue(doc, 'showsignatures');
	var maxsigrows = getSingleNodeValue(doc, 'maxsigrows');
	var enablespace = getSingleNodeValue(doc, 'enablespace');
	var enablealbum = getSingleNodeValue(doc, 'enablealbum');
    var medals=getSingleNodeValue(doc, 'medals');
	var debateopinion = getSingleNodeValue(doc, 'debateopinion');
	var onlyauthor=getSingleNodeValue(doc, 'onlyauthor');
	var olimg=getSingleNodeValue(doc, 'olimg');
	var container = $("postsContainer");
	var divDetailnav = document.createElement("DIV");
	
	//var divDetailnav2 = document.createElement("DIV");
	//var divmenu = document.createElement("DIV");

	container.appendChild(divDetailnav);
	//container.appendChild(divDetailnav2);
	//container.appendChild(divmenu);

	divDetailnav.className = 'viewthread';
	//divDetailnav2.className = 'threadline';
	//divmenu.className = 'menuwindow';
	//divmenu.id = 'memberinfo_' + id + '_menu';
	//divmenu.style.display = 'none';
	//divmenu.style.width = '177px';
	
	var html = '';
	html += '		<table cellpadding="0" cellspacing="0" border="0" id="'+pid+'">';
	html += '			<tbody>';
	html += '			<tr>';
	html += '			<td class="postauthor" id="' + pid + '">';	
	
	html += '		<div class="popupmenu_popup userinfopanel" id="' + posterid + ''+id+'" style="display:none; clip: rect(auto auto auto auto); position absolute;" initialized ctrlkey="userinfo2">';
	html +='		  <div class="popavatar">';
	html +='			<div id="' + posterid + ''+id+'_ma"></div>';
	html +='				<ul class="profile_side">';
	html +='					<li class="post_pm"><a href="usercppostpm.aspx?msgtoid=' + posterid + '" target="_blank">发送短消息</a></li>';
    html +='			    </ul>';
    html +='			</div>';
    html +='			<div class="popuserinfo">';
/*     html +='			    <p>';
    html +='				<a target="_blank" href="###">'+poster+'</a>';
    html +='					<em>当前在线</em>';
    html +='				</p>'; */
    html +='			    <dl class="s_clear">';
    html +='					<dt>UID</dt><dd>' + posterid + '</dd>';
    html +='					<dt>精华</dt>';
    html +='	                <dd>';
	if (digestposts>0){
		html += '						<a href="search.aspx?posterid=' + posterid + '&type=digest">' + digestposts + '</a>'
	}else{
		html += digestposts;
	}								
    html +='					</dd>';
	if (score1 != "")
		html += '<dt>'+score1 + '</dt><dd>' + extcredits1 + ' ' + scoreunit1 + '</dd>';
	if (score2 != "")
		html += '<dt>'+score2 + '</dt><dd>' + extcredits2 + ' ' + scoreunit2 + '</dd>';
	if (score3 != "")
		html += '<dt>'+score3 + '</dt><dd>' + extcredits3 + ' ' + scoreunit3 + '</dd>';
	if (score4 != "")
		html += '<dt>'+score4 + '</dt><dd>' + extcredits4 + ' ' + scoreunit4 + '</dd>';
	if (score5 != "")
		html += '<dt>'+score5 + '</dt><dd>' + extcredits5 + ' ' + scoreunit5 + '</dd>';
	if (score6 != "")
		html += '<dt>'+score6 + '</dt><dd>' + extcredits6 + ' ' + scoreunit6 + '</dd>';
	if (score7 != "")
		html += '<dt>'+score7 + '</dt><dd>' + extcredits7 + ' ' + scoreunit7 + '</dd>';
	if (score8 != "")
		html += '<dt>'+score8 + '</dt><dd>' + extcredits8 + ' ' + scoreunit8 + '</dd>';
	if(theLocation!='')
	{
    html +='					<dt>来自</dt><dd>' + theLocation+ '</dd>';
	}
    html +='				</dl>';
    html +='				<div class="imicons s_clear">';
	if (msn !=''){
    html +='					<a href="mailto:' + msn + '" target="_blank" class="msn">' + msn + '</a>';
	}
	if (skype !=''){
    html +='					<a href="skype:' + skype + '" target="_blank" class="skype">' + skype + '</a>';
	}
	if (icq !=''){
    html +='					<a href="http://wwp.icq.com/scripts/search.dll?to=' + icq + '" target="_blank" class="icq">' + icq + '</a>';
	}
	if (qq !=''){
    html +='					<a href="http://wpa.qq.com/msgrd?V=1&Uin=' + qq + '&Site=' + forumtitle + '&Menu=yes" target="_blank" class="qq">' + qq + '</a>';
	}
	if (yahoo !=''){
    html +='					<a href="http://edit.yahoo.com/config/send_webmesg?.target=' + yahoo + '&.src=pg" target="_blank" class="yahoo">' + yahoo + '</a>';
	}
    html +='				</div>';
    html +='			</div>';
    html +='		</div>';
	
	html += '					<cite><span class="onlineyes">';
	html +=	poster;
	html += '					</span></cite>';
	html += '					<div id="'+posterid+''+id+'_a">';
	html += '				<div class="avatar">';
	html += '	<img class="avatar" onerror="this.onerror=null;this.src=\'templates/' + templatepath + '/images/noavatar_medium.gif\';" src="tools/avatar.aspx?uid=' + posterid + '&size=medium" onmouseover="showauthor(this,\''+posterid+''+id+'\')" id="memberinfo_' + id + '"/>';
	html += '				</div>';
	if (nickname != ""){
		html += '			<p><em>';
		html += nickname;
		html += '			</em></p>';
	}
	html += '				</div><p>';
	html += getStars(stars, starthreshold, templatepath);
	html += '				</p>';
	
	
	html += '				<ul class="otherinfo">';
	if (userstatusby == 1){
		html += '				<li><label>组别</label>' + status +'</li>';
	}
	html += '					<li><label>性别</label>' + displayGender(gender) + '</li>';
	if (bday.trim() != ''){
		html += '				<li><label>生日</label>' + bday + '</li>';
	}
	html += '					<li><label>积分</label>' + credits + '</li>';
	html += '					<li><label>帖子</label>' + posts + '</li>';
	html += '					<li><label>注册时间</label>' + new Date(joindate.replace(/-/ig,'/')).format("yyyy-MM-dd")+ '</li>';
	html += '				</ul>';
	if (enablespace == 1 || enablealbum == 1){
		html += '						<ul class="plug">';
	}
	if (enablespace == 1){
		html += '<li class="space"><a href="space/?uid=' + posterid + '">个人空间</a></li>';
	}
	if (enablealbum == 1){
		html += '<li class="album"><a href="showalbumlist.aspx?uid=' + posterid + '">相册</a></li>';
	}
	if (enablespace == 1 || enablealbum == 1){
		html += '				</ul>';
	}
    html += '                       <div class="medals">';
	html += medals;                    
    html += '                       </div>';
	html += '			</td>';
	html += '			<td class="postcontent">';
	html += ' <div class="postinfo">';
	html += ' 	<em class="hidden"></em>';
	html += ' 	<em>' + olimg +'   ' + postdatetime + '</em>	';	
    var link='';
	if (onlyauthor==1)
	{
	link='<a href="showtopic.aspx?topicid='+topicid+'&onlyauthor=1">只看楼主</a>'; 
	}
	else
	{
		link='<a href="showtopic.aspx?topicid='+topicid+'&onlyauthor=2&posterid='+posterid+'">只看该用户</a>'
	}
	html += '   <em>|'+link+'</em>'
	html += ' 	<span class="right">';
	html += ' 	<a href="###" class="bold" title="复制帖子链接到剪贴板" onclick="setcopy(window.location.toString().replace(/#(.*?)$/ig, \'\') + \'#' + pid + '\', \'已经复制到剪贴板\')">';
	html += 	     id + '<sup>#</sup>';
	html += ' 	</a>';
	html += ' 	</span>';
	html += ' 	<div class="msgfsize right">';
	html += ' 		<label>字体大小: </label>';
	html += ' 		<small title="正常" onclick="$(\'message' + pid + '\').className=\'t_msgfont\'"><b>t</b></small>';
	html += ' 		<big title="放大" onclick="$(\'message' + pid + '\').className=\'t_bigfont\'"><b>T</b></big>';
	html += ' 	</div>';
	html += '   <div class="change_topic right"></div>';
	html += ' </div>	';

	html += ' <div id="ad_thread2_' + id + '"></div>';
	html += ' <div id="ad_thread3_' + id + '"></div>';
	html += ' <div class="postmessage defaultpost">';
	html += ' 		<h2>'+title+'</h2><div id="topictag"></div>';
	html += ' 		<div id="message' + pid + '" class="t_msgfont">' + unescape(message) + '</div>';
	html += ' </div>';
		

	if (debateopinion == 1){
		html += '正方';
	}else if (debateopinion == 2){
		html += '反方';
	}
	html += '			</div>';
	if (usesig == 1 && signature != "" && showsignatures == 1){
		html += '			<div class="postertext">';
		if (maxsigrows > 0){
			var ieheight = maxsigrows*12;
			html += '			<div class="t_signature" style="overflow: hidden; max-height: ' + maxsigrows*1.6 + 'em;maxHeightIE:'+ieheight+'px;">'+signature+'</div>';
		}else
			html += signature;
		html += '			</div>';
	}
	html += '			</td>';
	html += '			</tr>';
	html += '			</tbody>';
	html += '			<tbody>';
	html += '			<tr>';
	html += '			<td class="postauthor">';
	html += '				&nbsp';
	html += '			</td>';
	html += '			<td class="postcontent postactions">';
	html += '			    <div id="ad_thread1_' + id + '"></div>';
	html += '<em>';
	html += '	<a class="fastreply" onclick="replyToFloor(\'' + id + '\', \'' + poster + '\', \'' + pid + '\')" href="###">回复</a>';
	html += '	<a onclick="floatwin(\'open_reply\', this.href, 600, 410, \'600,0\');doane(event);" class="repquote" href="postreply.aspx?topicid=' + topicid + '&postid=' + pid + '&forumpage=1&quote=yes">引用</a>';
	html += '	<a class="editpost" onclick="floatwin(\'open_edit\', this.href, 600, 410, \'600,0\');doane(event);" href="editpost.aspx?topicid=' + topicid + '&postid=' + pid + '&forumpage=1&pageid=1">编辑</a>';
	html += '</em>';
	html += '                   <a href="###" onclick="window.scrollTo(0,0)">TOP</a></p>';
	html += '			</td>';
	html += '			</tr>';
	html += '			</tbody>';
	html += '			<tr class="threadad">';
	html += '			    <td class="postauthor"></td>';
	html += '			    <td class="adcontent"></td>';
	html += '           </tr>';
	divDetailnav.innerHTML = html;

	//divDetailnav2.innerHTML = '&nbsp;';

/* 	var divmenu = document.createElement("div");
	$(''+pid+'').appendChild(divmenu);
	divmenu.className = 'menuwindow';
	divmenu.id = 'memberinfo_' + id;
	divmenu.style.display = 'none';
	divmenu.innerHTML = html; */

	try{		
		document.getElementById("quickpostform").reset();
	}catch (e){
		alert(e.message);
	}
	if (redirect == true){
		$("message").innerHTML = "正在跳转到主题列表...";
		window.location = "showforum.aspx?forumid=" + fid;
	}
	delete doc;
}

function getSingleNodeValue(doc, tagname){
	try{
		var oNodes = doc.getElementsByTagName(tagname);
		if (oNodes[0] != null && oNodes[0] != undefined){
			if (oNodes[0].childNodes.length > 1) {
				return oNodes[0].childNodes[1].nodeValue;
			} else {
				return oNodes[0].firstChild.nodeValue;    		
			}
		}
	}
	catch(e){}
	return '';
}