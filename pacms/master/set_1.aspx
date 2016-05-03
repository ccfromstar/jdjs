<% @ Page Language="C#"  Inherits="PageAdmin.set_1" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<% @ Register TagPrefix="aspcn" TagName="uc_fckeditor" src="/incs/fckeditor/fckeditor.ascx"%>
<aspcn:uc_head runat="server"  Type="basic_1"  /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td align="left"  height=10></td></tr>
 <tr><td align="left"  class=table_style1><b>基本参数设置</b></td></tr>
 <tr><td align="left"  height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td align="left"  valign=top class=table_style2>
  
<form runat="server">
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td align="left"   colspan=2  height=30><b>网站配置</b></td>
 </tr>
<tr>
  <td align="left"  width=100px>url重写</td>
 <td align="left" >
<asp:DropDownList id="UrlRewrite" runat="server">
<asp:ListItem value="0">未开启</asp:ListItem>
<asp:ListItem value="1">.aspx扩展名</asp:ListItem>
<asp:ListItem value="2">.html扩展名</asp:ListItem>
</asp:DropDownList> 注:.html扩展名重写需要配置IIS
</td>
</tr>
<tr>
  <td align="left"  width=100px>数据库类型</td>
 <td align="left" >
<asp:DropDownList id="DbType" runat="server" >
<asp:ListItem value="0">Access</asp:ListItem>
<asp:ListItem value="1">Mssql Server</asp:ListItem>
</asp:DropDownList>
</td>
</tr>
<tr>
  <td align="left"  width=100px>Access数据库路径</td>
 <td align="left" ><asp:TextBox id="DBPath"  runat="server" size=40 maxlength="100" />
</td>
</tr>
<tr style="display:<%=Show_Sql%>">
  <td align="left"  width=100px>sql连接字符串</td>
 <td align="left" ><asp:TextBox id="Sqlconnection"  runat="server" size="80" maxlength="200"/></td>
</tr>
<tr>
  <td align="left"  width=100px>流量统计</td>
 <td align="left" >
<asp:DropDownList id="IpTongji" runat="server">
<asp:ListItem value="0">关闭</asp:ListItem>
<asp:ListItem value="1">启用</asp:ListItem>
</asp:DropDownList>
</td>
</tr>
<tr>
  <td align="left"  width=100px>选择风格<a href="template_edit.aspx?template=<%=Template_path%>/lanmu.css"><img src=images/edit.gif width=20 height=20 align=absmiddle vspace=5 hspace=5 border=0 alt="编辑模板"></a></td>
 <td align="left">
 <asp:DropDownList id="D_Template" runat="server">
  <asp:ListItem value="0">请选择一个风格</asp:ListItem>
 </asp:DropDownList>
 <asp:RequiredFieldValidator  ControlToValidate="D_Template" display="Static" type="integer"  runat="server">
请选择一个风格</asp:RequiredFieldValidator>
</td>
</tr>
</table>
<br><br>

<table border=0 cellpadding=0 cellspacing=5 width=95% align=center>
<tr>
  <td align="left"   colspan=2 height=30px><b>网站信息</b></td>
 </tr>

 <tr>
  <td align="left"  width=100px>网站名称</td>
  <td align="left" ><asp:textBox TextMode="singleLine" id="wz_name" runat="server"  size=80 maxlength="150" /></td>
 </tr>
 <tr>
  <td align="left"  width=100px>网站标题</td>
  <td align="left" ><asp:textBox TextMode="singleLine"  id="wz_title" runat="server" size=80 maxlength="150"  />
</td>
 </tr>

<tr>
  <td align="left" >网站关键字</td>
 <td align="left" ><asp:textBox TextMode="multiLine" Columns="70" rows="3" id="wz_keyword" runat="server" onkeyup="if(this.value.length>240)this.value=this.value.substring(0,240)"/>
</td>
 </tr>

<tr>
  <td align="left" >网站描述</td>
 <td align="left" ><asp:TextBox TextMode="multiLine" Columns="70" rows="3"  id="wz_description"    runat="server" onkeyup="if(this.value.length>240)this.value=this.value.substring(0,240)"/>
</td>
 </tr>

<tr>
  <td align="left" >Logo路径</td>
 <td align="left" ><asp:TextBox id="wz_logo"    runat="server" size="45" maxlength="90" />
Logo位置：<asp:RadioButton id="wz_logo_site1" GroupName="wz_logo_site" runat="server" />顶部
<asp:RadioButton id="wz_logo_site2" GroupName="wz_logo_site" runat="server" />左侧
</td>
 </tr>
<tr  title="Banner图片只能为图片格式文件">
  <td align="left">通栏Banner图片</td>
 <td align="left" ><asp:TextBox id="banner_image"    runat="server" size="45" maxlength="50" />
&nbsp;宽：<asp:TextBox id="banner_image_width" runat="server" size=5 maxlength=5 />&nbsp;高：<asp:TextBox id="banner_image_height"    runat="server" size=5 maxlength=5 />

</td>
 </tr>
<tr  title="Banner动画只能为.swf文件格式">
  <td align="left">通栏Banner动画</td>
 <td align="left" ><asp:TextBox id="banner_swf"    runat="server" size="45" maxlength="50" />
&nbsp;宽：<asp:TextBox id="banner_swf_width" runat="server" size=5 maxlength=5 />&nbsp;高：<asp:TextBox id="banner_swf_height"    runat="server" size=5 maxlength=5 />

</td>
 </tr>
<tr>
  <td align="left" >通栏Banner自定义</td>
 <td align="left" ><a href="javascript:Open_Editor('webset','zdy_banner','<%=FieldId%>','0')"><img src=images/edit.gif width=20 height=20 align=absmiddle vspace=5 hspace=5 border=0 alt="Banner自定义编辑"></a>注：通过这里自定义可以替换Banner图片和Banner动画，主要用于制作个性化效果。
</td>
 </tr>

</table>
<br>
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td align="left"   colspan=2  height=30><b>图片上传设置</b></td>
 </tr>
<tr>
  <td align="left" width=100px>缩略图功能</td>
  <td align="left">
<input type="radio" name="Thumbnail_open" id="Thumbnail_0" value=0 checked>关闭   <input type="radio" name="Thumbnail_open" id="Thumbnail_1" value=1 >开启 
</td>
</tr>
<tr>
  <td align="left">缩略图质量</td>
  <td align="left">
  <select name="Thumbnail_quality" id="Thumbnail_quality">
	<option value="10">1</option>
	<option value="20">2</option>
	<option value="30">3</option>
	<option value="40">4</option>
	<option value="50">5</option>
	<option value="60">6</option>
	<option value="70">7</option>
	<option value="80">8</option>
	<option value="90">9</option>
	<option value="100">10</option>
    </select>
</td>
</tr>
<tr>
  <td align="left">缩略图生成条件</td>
  <td align="left">
     图片宽大于<input type="textbox" name="Thumbnail_MinWidth"   size="4" maxlength=4 value="<%=Thumbnail_MinWidth%>">px
     图片高大于<input type="textbox" name="Thumbnail_MinHeight"  size="4" maxlength=4 value="<%=Thumbnail_MinHeight%>">px
</td>
</tr>
<tr>
  <td align="left">水印功能</td>
  <td align="left">
<input type="radio" name="Watermark_open" id="Watermark_0" value=0 checked>关闭   <input type="radio" name="Watermark_open" id="Watermark_1" value=1 >开启
</td>
<td align="left" rowspan=8>
<table width="190" height="154" border="0" background="images/flower.gif" title="设置水印位置"><tr><td width="33%" align="center" style="vertical-align:middle;"><input type="radio" id="watermark_site" name="watermark_site" value="1" ><b>#1</b></td><td width="33%" align="center" style="vertical-align:middle;"><input type="radio" id="watermark_site" name="watermark_site" value="2" ><b>#2</b></td><td width="33%" align="center" style="vertical-align:middle;"><input type="radio" id="watermark_site" name="watermark_site" value="3" ><b>#3</b></td></tr><tr><td width="33%" align="center" style="vertical-align:middle;"><input type="radio" id="watermark_site" name="watermark_site" value="4" ><b>#4</b></td><td width="33%" align="center" style="vertical-align:middle;"><input type="radio" id="watermark_site" name="watermark_site" value="5" ><b>#5</b></td><td width="33%" align="center" style="vertical-align:middle;"><input type="radio" id="watermark_site" name="watermark_site" value="6" ><b>#6</b></td></tr><tr><td width="33%" align="center" style="vertical-align:middle;"><input type="radio" id="watermark_site" name="watermark_site" value="7" checked><b>#7</b></td><td width="33%" align="center" style="vertical-align:middle;"><input type="radio" id="watermark_site" name="watermark_site" value="8" ><b>#8</b></td><td width="33%" align="center" style="vertical-align:middle;"><input type="radio" id="watermark_site" name="watermark_site" value="9" ><b>#9</b></td></tr></table>
</td>
<tr>
  <td align="left">水印透明度</td>
  <td align="left">
  <select name="Watermark_alpha" id="Watermark_alpha">
	<option value="25">1</option>
	<option value="50">2</option>
	<option value="76">3</option>
	<option value="102">4</option>
	<option value="128">5</option>
	<option value="153">6</option>
	<option value="179">7</option>
	<option value="204">8</option>
	<option value="230">9</option>
	<option value="255">10</option>
    </select>
    </td>
</tr>
<tr>
  <td align="left">水印文字</td>
  <td align="left"><input type="text"   size="40" maxlength="50" name="Watermark_font" id="Watermark_font" value="<%=Font_Text%>" /></td>
</tr>
<tr>
  <td align="left">水印字体颜色</td>
  <td align="left"><input type="text"   size="7" maxlength="8" name="Watermark_font_color" id="Watermark_font_color"  value="<%=Font_Color%>" /><a href="javascript:foreColor('Watermark_font_color','')"><img src=images/color.gif border=0 height=21 align=absbottom></a></td>
</tr>
<tr>
  <td align="left">水印字体样式</td>
  <td align="left"><select name="Watermark_font_style" id="Watermark_font_style">
	<option value="1">普通字体</option>
	<option value="2">粗体</option>
	<option value="3">粗斜体</option>
</tr>

<tr>
  <td align="left">水印字体大小</td>
  <td align="left"><input type="text" size="7" maxlength="2" name="Watermark_font_size" value="<%=Font_Size%>" />px</td>
</tr>
</tr>
  <td align="left">水印字体类型</td>
   <td align="left">
      <select name="Watermark_font_type" id="Watermark_font_type" onChange="C_Font_Type(this.options[this.selectedIndex].value)">
	<option value="Arial">Arial</option>
	<option value="Arial Black">Arial Black</option>
	<option value="Batang">Batang</option>
	<option value="BatangChe">BatangChe</option>
	<option value="Comic Sans MS">Comic Sans MS</option>
	<option value="Courier New">Courier New</option>
	<option value="Dotum">Dotum</option>
	<option value="DotumChe">DotumChe</option>
	<option value="Estrangelo Edessa">Estrangelo Edessa</option>
	<option value="Franklin Gothic Medium">Franklin Gothic Medium</option>
	<option value="Gautami">Gautami</option>
	<option value="Georgia">Georgia</option>
	<option value="Gulim">Gulim</option>
	<option value="GulimChe">GulimChe</option>
	<option value="Gungsuh">Gungsuh</option>
	<option value="GungsuhChe">GungsuhChe</option>
	<option value="Impact">Impact</option>
	<option value="Latha">Latha</option>
	<option value="Lucida Console">Lucida Console</option>
	<option value="Lucida Sans Unicode">Lucida Sans Unicode</option>
	<option value="Mangal">Mangal</option>
	<option value="Marlett">Marlett</option>
	<option value="Microsoft Sans Serif">Microsoft Sans Serif</option>
	<option value="MingLiU">MingLiU</option>
	<option value="MS Gothic">MS Gothic</option>
	<option value="MS Mincho">MS Mincho</option>
	<option value="MS PGothic">MS PGothic</option>
	<option value="MS PMincho">MS PMincho</option>
	<option value="MS UI Gothic">MS UI Gothic</option>
	<option value="MV Boli">MV Boli</option>
	<option value="Palatino Linotype">Palatino Linotype</option>
	<option value="PMingLiU">PMingLiU</option>
	<option value="Raavi">Raavi</option>
	<option value="Shruti">Shruti</option>
	<option value="Sylfaen">Sylfaen</option>
	<option value="Symbol">Symbol</option>
	<option value="Tahoma">Tahoma</option>
	<option value="Times New Roman">Times New Roman</option>
	<option value="Trebuchet MS">Trebuchet MS</option>
	<option value="Tunga">Tunga</option>
	<option value="Verdana">Verdana</option>
	<option value="Webdings">Webdings</option>
	<option value="Wingdings">Wingdings</option>
	<option value="仿宋_GB2312">仿宋_GB2312</option>
	<option value="宋体">宋体</option>
	<option value="新宋体">新宋体</option>
	<option value="楷体_GB2312">楷体_GB2312</option>
	<option value="黑体">黑体</option>
</select>

        <span id="Watermark_font_style_view" style="font-family:Arial Black">Arial Black</span>
    </td>
 </tr>
<tr>
  <td align="left">增加水印条件</td>
  <td align="left">
     图片宽大于<input type="textbox" name="Watermark_MinWidth"   size="4" maxlength=4  value="<%=WaterMark_MinWidth%>">px
     图片高大于<input type="textbox" name="Watermark_MinHeight"  size="4" maxlength=4 value="<%=WaterMark_MinHeight%>">px
</td>
</tr>
</table>
<script language=javascript>

function C_Font_Type(str)
 {
   document.getElementById("Watermark_font_style_view").innerText=document.getElementById("Watermark_font").value;
   document.getElementById("Watermark_font_style_view").style.fontFamily=str;
 }
var  Thumbnail_Open,WaterMark_Open,Font_Site;
Thumbnail_Open="<%=Thumbnail_Open%>"
if(Thumbnail_Open=="1")
 {
  document.getElementById("Thumbnail_1").checked=true;
 }
document.getElementById("Thumbnail_quality").value="<%=Thumbnail_Quality%>";

WaterMark_Open="<%=WaterMark_Open%>"
if(WaterMark_Open=="1")
 {
  document.getElementById("Watermark_1").checked=true;
 }
document.getElementById("Watermark_alpha").value="<%=Font_Alpha%>";
document.getElementById("Watermark_font_style").value="<%=Font_Style%>";
document.getElementById("Watermark_font_type").value="<%=Font_Type%>";
Font_Site=<%=Font_Site%>;
document.getElementsByName("watermark_site")[Font_Site-1].checked=true;
</script>
<br>
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td align="left"   colspan=2  height=30><b>邮件发送帐号信息</b></td>
 </tr>
<tr>
  <td align="left" >系统发件邮箱</td>
 <td align="left" ><asp:textBox TextMode="singleLine" id="em_add" runat="server" size=30 maxlength=45 /> 如：pageadmin@sohu.com
</td>
 </tr>

<tr>
  <td align="left" >邮箱密码</td>
 <td align="left" ><asp:textBox TextMode="Password" id="em_pass"  runat="server" size=30 maxlength=45 /> 不修改密码则留空。 
</td>
 </tr>
<tr>
  <td align="left" >发件方名称</td>
 <td align="left" ><asp:textBox TextMode="singleLine" id="em_from" runat="server" size=30 maxlength=45 /> 如:PageAdmin
</td>
 </tr>
<tr>

 <tr>
  <td align="left"  width=100px>邮箱服务器</td>
  <td align="left" ><asp:textBox TextMode="singleLine" id="em_server" runat="server" size=30 maxlength=45 /> 如：smtp.sohu.com
</td>
 </tr>
 <tr>
  <td align="left"  width=100px>发送方式</td>
  <td align="left" >
    <asp:DropDownList id="SendWay" runat="server">
     <asp:ListItem Value="0"> Jmail组件</asp:ListItem>
     <asp:ListItem Value="1"> Net.Mail </asp:ListItem>
    </asp:DropDownList>
  </td>
 </tr>
<tr>
  <td align="left" >定单接收邮箱</td>
 <td align="left" ><asp:textBox TextMode="singleLine" id="em_order" runat="server" size=30 maxlength=45 />
</td>
 </tr>
<tr>
  <td align="left" >留言反馈接收邮箱</td>
 <td align="left" ><asp:textBox TextMode="singleLine" id="em_feedback" runat="server" size=30 maxlength=45 />
</td>
 </tr>
<tr>
  <td align="left" >应聘信息接收邮箱</td>
 <td align="left" ><asp:textBox TextMode="singleLine" id="em_hr" runat="server" size=30 maxlength=45 />
</td>
 </tr>
<tr>
 <td align="left" >邮件签名</td>
 <td align="left" ><asp:textBox TextMode="multiLine" id="em_sign" runat="server" columns="50" rows="5" />
</td>
 </tr>
</table>
<br>
<br>
<table border=0 cellpadding=0 cellspacing=5 width=95% align=center>
<tr>
  <td align="left"   colspan=2 height=30><b>底部信息设置</b></td>
 </tr>
<tr>
  <td align="left"  width=100px width=100px>网站顶部信息</td>
 <td align="left" >
<asp:TextBox id="wz_top"  TextMode="multiLine"  runat="server" />
<aspcn:uc_fckeditor  Tb_Id="wz_top" Fck_Height="250" Fck_Style="Basic" runat="server"/>
</td>
 </tr>
<tr>
  <td align="left"  width=100px width=100px>网站底部信息</td>
 <td align="left" >
<asp:TextBox id="wz_bottom"  TextMode="multiLine"  runat="server" />
<aspcn:uc_fckeditor  Tb_Id="wz_bottom" Fck_Height="250" Fck_Style="Basic" runat="server"/>
</td>
 </tr>
</table>
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
<td align="center"  height=25 align=center >
<asp:Label  id="lbl"  runat="server" />
<asp:Button class=button   text="提交"  Id="Bt_Submit"  Onclick="PageAdmin_Data_update" runat="server" />
</td>
 </tr>
</table>

</form>
</td>
</tr>
</table>
</center>
</body>
</html>  



