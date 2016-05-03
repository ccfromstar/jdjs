<% @ Page Language="C#" Inherits="PageAdmin.lanmu_1_zdy"%>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" />
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>局部自定义</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">

<form runat="server" >
<div id="tabdiv">
<ul>
<li id="tab" name="tab"  onclick="showtab(0,1)" style="font-weight:bold">顶部自定义</li>
<li id="tab" name="tab"  onclick="showtab(1,1)">SEO优化</li>
</ul>
</div>

<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top align="left">

<table border=0 cellpadding=0 cellspacing=5 width=95% align=center>
<tr>
  <td  colspan=2 height=25 align="left"><asp:Label id="lbl" runat="server" /></td>
 </tr>
</table>

<div name="tabcontent" id="tabcontent">
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
<tr>
  <td width=100px><b>头信息自定义</b><br></td>
  <td><asp:TextBox  id="Headzdy"  TextMode="MultiLine"  runat="server" columns="75" rows="8" />
  </td>
 </tr>

<tr>
 <td colspan=2 height="30">注:&lt;head&gt;&lt;/head&gt;之间的内容</td>
</tr>


<tr>
  <td width=100px><b>顶部信息自定义</b><br><a href="javascript:Open_Editor('lanmu1','zdy_wztop','<%=FieldId%>')"><img src=images/edit.gif width=20 height=20 align=absmiddle vspace=5 hspace=5 border=0 alt="可视化编辑"></a></td>
  <td><asp:TextBox  id="Wztopzdy"  TextMode="MultiLine"  runat="server" columns="75" rows="8" />
  </td>
 </tr>
<tr>
<tr>
 <td colspan=2 height="30">注:自动替换网站顶部信息，留空则显示默认。</td>
</tr>
<tr>
  <td width=100px><b>栏目自定义</b><br><a href="javascript:Open_Editor('lanmu1','zdy_lanmu','<%=FieldId%>')"><img src=images/edit.gif width=20 height=20 align=absmiddle vspace=5 hspace=5 border=0 alt="可视化编辑"></a></td>
  <td><asp:TextBox  id="Lanmuzdy"  TextMode="MultiLine"  runat="server" columns="75" rows="8" />
  </td>
 </tr>
<tr>
 <td colspan=2 height="30">注:自动替换网站默认栏目条，留空则显示默认。</td>
</tr>

<tr>
  <td width=100px><b>下拉菜单自定义</b></td>
  <td><asp:TextBox  id="Dropmenuzdy"  TextMode="MultiLine"  runat="server" columns="75" rows="8" />
  </td>
 </tr>
<tr>
 <td colspan=2 height="30">注:支持三级下拉，格式为：&lt;ul&gt;&lt;li&gt;&lt;a href="链接"&gt;链接内容&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;,多条下拉可相应增加&lt;li&gt;&lt;/li&gt;记录</td>
</tr>

<tr>
  <td width=100px><b>横幅自定义</b><br><a href="javascript:Open_Editor('lanmu1','banner','<%=FieldId%>')"><img src=images/edit.gif width=20 height=20 align=absmiddle vspace=5 hspace=5 border=0 alt="可视化编辑"></a></td>
  <td><asp:TextBox  id="Banner"  TextMode="MultiLine"  runat="server" columns="75" rows="8" />
  </td>
 </tr>
<tr>
 <td colspan=2 height="30">注:留空则默认通栏Banner，不显示默认banner可以输入&lt;p/&gt;等HTML空白标签</td>
</tr>
<tr>
  <td width=100px><b>小幅banner自定义</b><br><a href="javascript:Open_Editor('lanmu1','smallbanner','<%=FieldId%>')"><img src=images/edit.gif width=20 height=20 align=absmiddle vspace=5 hspace=5 border=0 alt="可视化编辑"></a></td>
  <td><asp:TextBox  id="SmallBanner"  TextMode="MultiLine"  runat="server" columns="75" rows="8" />
  </td>
 </tr>
</table>
</div>

<div name="tabcontent" id="tabcontent"  style="display:none">
<table border=0 cellpadding=5 cellspacing=2 width=95% align=center>
<tr>
  <td align="left"  width=60px>标题</td>
  <td align="left" ><asp:textBox TextMode="singleLine"  id="tb_title" runat="server" size=80 maxlength="150"  />
</td>
 </tr>

<tr>
  <td align="left">关键字</td>
 <td align="left" title="关键字之间用半角逗号分开"><asp:textBox TextMode="singleLine"  id="tb_keywords" runat="server" size=80 maxlength="150"  />
</td>
 </tr>

<tr>
  <td align="left" >描述</td>
 <td align="left" title="控制在250字以内"><asp:TextBox TextMode="multiLine" Columns="70" rows="6"  id="tb_description"    runat="server" onkeyup="if(this.value.length>250)this.value=this.value.substring(0,250)"/>
</td>
 </tr>
</table>
<br>注：首页和无模块栏目不必填写
</div>
</td>
 </tr>
</table>


<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
<td height=25 align=center >
<asp:Button      Cssclass=button   text="提交"   runat="server" onclick="PageAdmin_Data_Update" />
<input type="button" class=button  value="返回"  onclick="location.href='lanmu_1.aspx'">
</td>
 </tr>
</table>

<asp:Label id="LblErr" runat="server" />

</form>

</td>
</tr>
</table>
</center>
</body>
<script language="javascript">
var C_Tab="<%=Request.QueryString["tab"]%>";
if(C_Tab!="")
 {
   showtab(C_Tab,0);
 }   
</script>
</html>  
