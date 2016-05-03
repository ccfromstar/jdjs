<% @ Page Language="C#" Inherits="PageAdmin.collection_2" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="collection_1" />
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1 align="left"><b>采集规则设置</b></td></tr>
 <tr><td height=10 ></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top  align="left">
<form method="post">
<div id="tabdiv">
<ul>
<li id="tab" name="tab"   onclick="showtab(0,1)" style="font-weight:bold">列表规则</li>
<li id="tab" name="tab"   onclick="showtab(1,1)" >内容规则</li>
<li id="tab" name="tab"   onclick="location.href='collection_3.aspx?id=<%=Request.QueryString["id"]%>&table=<%=Request.QueryString["table"]%>&name=<%=Server.UrlEncode(Request.QueryString["name"])%>'" >开始采集</li>
</ul>
</div>

<div id="tabcontent" name="tabcontent">
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top  align="left">
 <table border=0 cellpadding=5  width=95% align=center>
    <tr>
     <td  align="left"><b>当前采集：</b><%=Request.QueryString["name"]%></td>
    </tr>
    <tr>
     <td  align="left" height="5"></td>
    </tr>
  </table>

 <table border=0 cellpadding=5  width=95% align=center>
    <tr>
     <td  align="left" width=100>目标页编码</td>
       <td  align="left">
         <input type="radio" name="C_encode" id='language1'  value="utf-8" checked/>UTF8 
         <input type="radio" name="C_encode" id='language2'  value="gb2312" <%if(C_encode=="gb2312"){Response.Write(" checked");}%>/>GB2312 
     </tr>
    <tr>
     <td  align="left" width=100>导入顺序</td>
       <td  align="left">
         <input type="radio" name="C_order" id='Order1'  value="1" checked/>与目标页一致
         <input type="radio" name="C_order" id='Order2'  value="0" <%if(C_order=="0"){Response.Write(" checked");}%>/>与目标页相反
     </tr>

    <tr>
     <td  align="left" width=100>采集目标域名</td>
      <td  align="left" title="目标网站域名，如：http://www.pageadmin.net"><input type="text" name="C_list_domain"  maxlength=150 size=50 value="<%=C_list_domain%>"></td>
     </tr>
    <tr>
     <td  align="left" width=100>规则列表网址</td>
      <td  align="left" title="如：http://www.pageadmin.net/article/nav_24_80_*.html,*表示页码">
    <input type="text" name="C_url" id="url" maxlength=150 size=50 value="<%=C_url%>"> 页码可以用*代替
    *从 <input type="text" name="C_url_startpage" id="startpage" style="width:30px" onkeyup="if(!IsNum(this.value)){this.value=''}"  value="<%=C_url_startpage%>"/> 到 <input type="text" name="C_url_endpage" id="endpage" style="width:30px" onkeyup="if(!IsNum(this.value)){this.value=''}" value="<%=C_url_endpage%>" />
   </td>
     </tr>
    <tr>
     <td  align="left" width=100 >不规则列表网址<br><span style='color:#666666'>每行一个网址</span></td>
      <td  align="left"><textarea name="C_urls" id="urls" cols="70" rows="6"><%=C_urls%></textarea></td>
     </tr>
    <tr>
     <td  align="left" width=100 title="无重复开始html代码">列表开始html</td>
      <td  align="left"><textarea name="C_list_starthtml" cols="70" rows="4"><%=C_list_starthtml%></textarea></td>
     </tr>
    <tr>
     <td  align="left" width=100 title="无重复结束html代码">列表结束html</td>
      <td  align="left"><textarea name="C_list_endhtml"  cols="70" rows="4"><%=C_list_endhtml%></textarea></td>
     </tr>
    <tr>
     <td  align="left" width=100>网址规则</td>
      <td  align="left">
         必须包含：<input type="text" name="C_list_urlcontains"  maxlength=150 size=25 value="<%=C_list_urlcontains%>">
         不能包含：<input type="text" name="C_list_urlnotcontains"  maxlength=150 size=25 value="<%=C_list_urlnotcontains%>">
     </td>

     </tr>
     <td  align="left" width=100>远程图片下载</td>
      <td  align="left">
     <input type="radio"  name="C_saveimage"   id="download0" value="0" checked />不处理
     <input type="radio"  name="C_saveimage"   id="download1" value="1" <%if(C_detail_saveimage=="1"){Response.Write(" checked");}%> />保存(耗费资源)
    </td>

    </table>
</td>
</tr>
</table>
</div>

<div id="tabcontent" name="tabcontent" style="display:none">

<asp:Repeater id="P1" runat="server">
 <ItemTemplate>
  <table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
  <tr>
  <td valign=top  align="left">
    <table border=0 cellpadding=0  width=95% align=center>
    <tr>
     <td  align="left" rowspan=4 width=100px><%#DataBinder.Eval(Container.DataItem,"name")%></td>
    </tr>
    <tr>
     <td  align="left" width="80px">采集规则</td><td title="语法：无重复开始html代码{pa:collection}无重复结束html代码"><textarea name="<%#DataBinder.Eval(Container.DataItem,"field")%>_rules"  cols="50" rows="4"><%#HTMLEncode(DataBinder.Eval(Container.DataItem,"c_rules").ToString())%></textarea></td>
    </tr>
    <tr>
     <td  align="left">过滤规则</td><td title="每行一条过滤字符"><textarea name="<%#DataBinder.Eval(Container.DataItem,"field")%>_replace_rules"  cols="50" rows="4"><%#HTMLEncode(DataBinder.Eval(Container.DataItem,"replace_rules").ToString())%></textarea></td>
    </tr>
    </table>
</td>
</tr>
</table>
<br>
 </ItemTemplate>
 <FooterTemplate>
  注：字段采集规则为空则不采集
 </FooterTemplate>
</asp:Repeater>
<asp:PlaceHolder runat="server" id="P2" visible="false">
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
  <tr>
  <td valign=top  align="left" height="40px"><br>请在采集配置中更新一下配置：<a href="collection_4.aspx?id=<%=Request.QueryString["id"]%>&table=<%=Request.QueryString["table"]%>&name=<%=Server.UrlEncode(Request.QueryString["name"])%>">配置文件</a></td>
  </tr>
</table>
</asp:PlaceHolder>
</div>
<br>
<div align=center>
<input type="hidden"  value="yes"  name="tijiao">
<input type="submit"  value="保存"  Class="button">
&nbsp;&nbsp;<input type="button" value="返回" Class="button" OnClick="location.href='collection_1.aspx'">
</div>
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



