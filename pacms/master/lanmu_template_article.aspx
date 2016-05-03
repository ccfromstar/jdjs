<% @ Page Language="C#" Inherits="PageAdmin.lanmu_template_article"%>
<% @ Register TagPrefix="aspcn" TagName="uc_fckeditor" src="/incs/fckeditor/fckeditor.ascx" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" />  
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>文章列表模块设置</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top  align="left">

<form runat="server">
<div id="tabdiv">
<ul>
<li id="tab" name="tab"  onclick="showtab(0,1)" style="font-weight:bold">内容设置</li>
<li id="tab" name="tab"  onclick="showtab(1,1)">自定义样式</li>
<li id="tab" name="tab"  onclick="showtab(2,1)">html布局辅助</li>
</ul>
</div>
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  colspan=2 height=25><b>当前模块类别</b>：<%=Request.QueryString["lanmu1"]%> &gt; <%=Request.QueryString["template"]%></td>
 </tr>
</table>
<div name="tabcontent" id="tabcontent">
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  height=25 width=100>调用类别</td>
  <td><asp:DropDownList id="Dl_infor1" DataTextField="sort_name" DataValueField="id" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Infor1_Change" /> 
 <asp:Label id="LbTishi1" Text=" 文章小类 " Visible="false"  runat="server"/>
 <asp:DropDownList id="Dl_infor2" runat="server" Visible="false"  DataTextField="sort_name" DataValueField="id"  />
<asp:CompareValidator Id="cv1" ControlToValidate="Dl_Infor1" ValueToCompare="0" display="Dynamic" type="Integer"  runat="server">
请选择文章类别</asp:CompareValidator>
</td>
 </tr>

<tr>
  <td  height=25>目标窗口</td>
  <td>
  <asp:DropDownList id="Dl_target" runat="server">
     <asp:ListItem value="_self">本窗口</asp:ListItem>
     <asp:ListItem value="_blank">新窗口</asp:ListItem>
   </asp:DropDownList>
 </td>
 </tr>

<tr>
  <td  height=25>显示类型</td>
  <td><asp:DropDownList id="Article_show_type" runat="server">
     <asp:ListItem value="0">默认</asp:ListItem>
     <asp:ListItem value="1">专题文章</asp:ListItem>
   </asp:DropDownList></td>
 </tr>

<tr>
  <td  height=25>排序方式</td>
  <td><asp:DropDownList id="DP_list_order" runat="server">
     <asp:ListItem value="0">按发布时间降序</asp:ListItem>
     <asp:ListItem value="1">按发布时间升序</asp:ListItem>
     <asp:ListItem value="2">按点击数降序</asp:ListItem>
   </asp:DropDownList></td>
 </tr>

<tr>
  <td  height=25>推荐文章置顶</td>
  <td><asp:DropDownList id="Article_show_tj" runat="server">
     <asp:ListItem value="0">否</asp:ListItem>
     <asp:ListItem value="1">是</asp:ListItem>
   </asp:DropDownList>

文章图片宽：<asp:TextBox id="Tb_width"  runat="server"  size="4" maxlength="4"></asp:TextBox> 
文章图片高：<asp:TextBox id="Tb_height"  runat="server"  size="4" maxlength="4"></asp:TextBox>
<asp:RequiredFieldValidator   ControlToValidate="Tb_width" display="Dynamic" type="integer"  runat="server">
宽度不能为空</asp:RequiredFieldValidator>
<asp:RequiredFieldValidator   ControlToValidate="Tb_height" display="Dynamic" type="integer"  runat="server">
高度不能为空</asp:RequiredFieldValidator>

<asp:RangeValidator   ControlToValidate="Tb_width" display="Dynamic" type="integer" MinimumValue="0" MaximumValue="500" runat="server">
宽度请输入0—500之间的数字</asp:RangeValidator>
<asp:RangeValidator   ControlToValidate="Tb_height" display="Dynamic" type="integer" MinimumValue="0" MaximumValue="500" runat="server">
高度请输入0—500之间的数字</asp:RangeValidator>
</td>
 </tr>
<tr>
  <td  height=25>标题显示字数</td>
  <td title="汉字占用2个字节"><asp:TextBox id="Article_title_num" runat="server"  Maxlength=3 size=5/> 个字符 
 <asp:RequiredFieldValidator   ControlToValidate="Article_title_num" display="Dynamic" type="integer"  runat="server">
显示字数不能为空</asp:RequiredFieldValidator>
<asp:RangeValidator   ControlToValidate="Article_title_num" display="Dynamic" type="integer" MinimumValue="1" MaximumValue="200" runat="server">
请输入1—200之间的数字</asp:RangeValidator></td>
 </tr>
<tr>
  <td  height=25>文章显示数</td>
  <td><asp:TextBox id="Article_show_num" runat="server"  Maxlength=3 size=5/> 条记录
 <asp:RequiredFieldValidator   ControlToValidate="Article_show_num" display="Dynamic" type="integer"  runat="server">
文章显示数不能为空</asp:RequiredFieldValidator>
<asp:RangeValidator   ControlToValidate="Article_show_num" display="Static" type="integer" MinimumValue="0" MaximumValue="500" runat="server">
请输入0—500之间的数字</asp:RangeValidator></td>
 </tr>
<tr>
  <td  height=25>是否显示日期</td>
  <td><asp:DropDownList id="Article_date_show" runat="server">
     <asp:ListItem value="0">隐藏日期</asp:ListItem>
     <asp:ListItem value="1">显示日期</asp:ListItem>
     </asp:DropDownList></td>
 </tr>

<tr>
  <td  height=25>左测内容<br>
<a href="javascript:Open_Editor('template','left_content','<%=Request.QueryString["id"]%>','1')"><img src=images/edit.gif width=20 height=20 align=absmiddle vspace=5 hspace=5 border=0 alt="可视化编辑"></a>
</td>
  <td><asp:TextBox runat="server"  id="Tb_content_1" TextMode="multiLine"  columns="75" rows="8"/></td>
 </tr>


<tr>
  <td  height=25>模块布局</td>
  <td>
<asp:RadioButton id="Layout_1" GroupName="site" runat="server" />整行
<asp:RadioButton id="Layout_2" GroupName="site" runat="server" Title="如果需要几个模块同行显示，可以选择靠左" />靠左
<asp:RadioButton id="Layout_3" GroupName="site" runat="server" Title="如果同行中最后一个模块，可以选择靠右"/>靠右 (说明：模块布局只有选择靠左,模块宽度定义有才效)</td>
 </tr>
<tr>
  <td  height=25>模块宽度</td>
  <td><asp:TextBox id="Template_Width" runat="server"  size="3" maxlength="3" />%(百分比)

 <asp:RequiredFieldValidator   ControlToValidate="Template_Width" display="Dynamic" type="integer"  runat="server">
模块宽度百分比不能为空</asp:RequiredFieldValidator>
<asp:RangeValidator   ControlToValidate="Template_Width" display="Dynamic" type="integer" MinimumValue="10" MaximumValue="100" runat="server">
请输入10—100之间的数字</asp:RangeValidator>
</td>
<tr title="相对上一个模块的位置，选择'是'则从新的一行开始显示">
  <td>换行显示</td>
  <td><asp:RadioButton id="Wrap_1" GroupName="wrap" runat="server"  />否
  <asp:RadioButton id="Wrap_2" GroupName="wrap" runat="server" />是
 </tr>
 </tr>
</table>
</div>


<div name="tabcontent" id="tabcontent" style="display:none">
<table border=0 cellpadding=5 cellspacing=2 width=95% align=center>
<tr>
  <td width=80px>默认模块标志</td>
  <td><asp:RadioButton id="RB_Show" GroupName="Hide" runat="server" />显示&nbsp;&nbsp;<asp:RadioButton id="RB_Hide" GroupName="Hide" runat="server" />隐藏</td>
 </tr>
<tr>
  <td>目标地址</td>
  <td><asp:TextBox id="Url" runat="server"  size="60" maxlength="100"/></td>
 </tr>
<tr>
  <td>模块风格</td>
  <td><asp:DropDownList  id="D_Style"  DataTextField="name" DataValueField="id" Runat="server" /></td>
</tr>
<tr>
  <td>自定义头信息</td>
  <td align="left"><asp:TextBox  id="HeadContent"  TextMode="MultiLine"  runat="server" />
      <aspcn:uc_fckeditor Tb_Id="HeadContent" Fck_Height="250" Fck_Style="Basic"  runat="server" />
</td>
 </tr>
</table>
</div>

<div name="tabcontent" id="tabcontent" style="display:none">
<table border=0 cellpadding=5 cellspacing=2 width=95% align=center>
<tr>
  <td width=80px>模块开始HTML</td>
  <td align="left"><asp:TextBox  id="StartHtml"  TextMode="MultiLine"  runat="server" Columns="90" rows="15"/>
</td>
 </tr>
<tr>
  <td>模块结束HTML</td>
  <td align="left"><asp:TextBox  id="EndHtml"  TextMode="MultiLine"  runat="server" Columns="90" rows="15"/>
</td>
 </tr>
</table>
</div>

<br>
<div align=center>
<asp:Button      Cssclass=button   text="提交"   runat="server" onclick="PageAdmin_Data_Update" />
<input type="button" class=button  value="返回"  onclick="location.href='lanmu_1_template.aspx?lanmu1id=<%=Request.QueryString["lanmu1id"]%>&lanmu1=<%=Server.UrlEncode(Request.QueryString["lanmu1"]).Replace("'","\\\'")%>'">
</div>

</td>
</tr>
</table>
<br>
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



