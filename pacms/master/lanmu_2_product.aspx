<% @ Page Language="C#" Inherits="PageAdmin.lanmu_2_product"%>
<% @ Register TagPrefix="aspcn" TagName="uc_fckeditor" src="/incs/fckeditor/fckeditor.ascx" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" />
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>产品列表设置</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">
<form runat="server" >
<div id="tabdiv">
<ul>
<li id="tab" name="tab"  onclick="showtab(0,1)" style="font-weight:bold">内容设置</li>
<li id="tab" name="tab"  onclick="showtab(1,1)">自定义样式</li>
</ul>
</div>
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  colspan=2 height=25><b>当前栏目</b>：<%=Request.QueryString["lanmu1"]%> > <%=Request.QueryString["lanmu2"]%></td>
 </tr>
</table>

<div name="tabcontent" id="tabcontent">
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  height=25 width=100>调用类别</td>
  <td><asp:DropDownList id="Dl_prod1" DataTextField="sort_name" DataValueField="id" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Prod1_Change" /> 
 <asp:Label id="LbTishi1" Text=" 产品小类 " Visible="false"  runat="server"/>
 <asp:DropDownList id="Dl_prod2" runat="server" Visible="false"  DataTextField="sort_name" DataValueField="id"  />

</td>
 </tr>

<tr>
  <td  height=25>目标窗口</td>
  <td>
  <asp:DropDownList id="DL_target" runat="server">
     <asp:ListItem value="_self">本窗口</asp:ListItem>
     <asp:ListItem value="_blank">新窗口</asp:ListItem>
   </asp:DropDownList>
 </td>
 </tr>

<tr>
  <td  height=25>滚动效果</td>
  <td><asp:DropDownList id="Dl_Marquee" runat="server">
     <asp:ListItem value="0">关闭</asp:ListItem>
     <asp:ListItem value="1">启用</asp:ListItem>
     </asp:DropDownList>
滚动区高度：<asp:TextBox id="Box_height"  runat="server"  size="4" maxlength="3"></asp:TextBox>
<asp:RequiredFieldValidator   ControlToValidate="Box_height" display="Dynamic" type="integer"  runat="server">
高度不能为空</asp:RequiredFieldValidator>
<asp:RangeValidator   ControlToValidate="Box_height" display="Dynamic" type="integer" MinimumValue="0" MaximumValue="1000" runat="server">
高度请输入0—1000之间的数字</asp:RangeValidator>

</td>
 </tr>


<tr>
  <td  height=25>显示样式</td>
  <td><asp:DropDownList id="Dl_show_style" runat="server">
     <asp:ListItem value="0">仅显示产品名称</asp:ListItem>
     <asp:ListItem value="1">显示产品名称+产品图片</asp:ListItem>
   </asp:DropDownList>&nbsp;
图片宽：<asp:TextBox id="Tb_width"  runat="server"  size="4" maxlength="4"></asp:TextBox> 
图片高：<asp:TextBox id="Tb_height"  runat="server"  size="4" maxlength="4"></asp:TextBox>
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
  <td  height=25>显示类型</td>
  <td><asp:DropDownList id="Dl_show_type" runat="server">
     <asp:ListItem value="0">默认</asp:ListItem>
     <asp:ListItem value="1">新产品</asp:ListItem>
     <asp:ListItem value="2">推荐品</asp:ListItem>
   </asp:DropDownList></td>
 </tr>

<tr>
  <td  height=25>排序方式</td>
  <td><asp:DropDownList id="DP_list_order" runat="server">
     <asp:ListItem value="0">按发布时间降序</asp:ListItem>
     <asp:ListItem value="1">按发布时间升序</asp:ListItem>
   </asp:DropDownList></td>
 </tr>

<tr>
  <td  height=25>产品名称显示字数</td>
  <td title="汉字占用2个字节"><asp:TextBox id="Tb_title_num" runat="server" Value="26" Maxlength=3 size=5/> 个字符 
<asp:RangeValidator   ControlToValidate="Tb_title_num" display="Static" type="integer" MinimumValue="0" MaximumValue="200" runat="server">
请输入0—200之间的数字</asp:RangeValidator></td>
 </tr>
<tr>
  <td  height=25>产品显示数</td>
  <td><asp:TextBox id="Tb_show_num" runat="server" Value="5" Maxlength="3" size=5/> 条记录
<asp:RangeValidator   ControlToValidate="Tb_show_num" display="Static" type="integer" MinimumValue="1" MaximumValue="50" runat="server">
请输入1—50之间的数字</asp:RangeValidator></td>
 </tr>

</table>
</div>


<div name="tabcontent" id="tabcontent" style="display:none">
<table border=0 cellpadding="0" cellspacing="1" width="95%" align=center>
<tr>
  <td  height=25 width="100px">默认导航标志</td>
  <td align="left"><asp:RadioButton id="RB_Show" GroupName="Hide" runat="server" />显示&nbsp;&nbsp;<asp:RadioButton id="RB_Hide" GroupName="Hide" runat="server" />隐藏</td>
 </tr>
 <tr>
  <td  height=25>目标地址</td>
  <td align="left"><asp:TextBox id="Url" runat="server"  size="60" maxlength="100"/></td>
 </tr>
<tr>
  <td  height=25>导航风格</td>
  <td align="left"><asp:DropDownList  id="D_Style"  DataTextField="name" DataValueField="id" Runat="server" /></td>
</tr>
<tr>
  <td  height=25>自定义头信息</td>
  <td align="left"><asp:TextBox  id="HeadContent"  TextMode="MultiLine"  runat="server" />
      <aspcn:uc_fckeditor Tb_Id="HeadContent" Fck_Height="250" Fck_Style="Basic" runat="server" /></td>
 </tr>
<tr>
  <td  height=40>导航应用</td>
  <td align="left">
模块页：<asp:DropDownList  id="D_Nav_used_template"  Runat="server">
<asp:ListItem value="1">显示</asp:ListItem>
<asp:ListItem value="0" style="color:#ff0000">隐藏</asp:ListItem>
</asp:DropDownList>&nbsp;
子栏目页：<asp:DropDownList  id="D_Nav_used_lanmu"  Runat="server">
<asp:ListItem value="1">显示</asp:ListItem>
<asp:ListItem value="0" style="color:#ff0000">隐藏</asp:ListItem>
</asp:DropDownList>&nbsp;
详细页：<asp:DropDownList  id="D_Nav_used_detail"  Runat="server">
<asp:ListItem value="1">显示</asp:ListItem>
<asp:ListItem value="0" style="color:#ff0000">隐藏</asp:ListItem>
</asp:DropDownList>
</td>
</tr>
</table>
</div>

<br>
<div align=center>
<asp:Button      Cssclass=button   text="提交"   runat="server" onclick="PageAdmin_Data_Update" />
<input type="button" class=button  value="返回"  onclick="location.href='lanmu_2.aspx?lanmu1id=<%=Request.QueryString["lanmu1id"]%>&lanmu1=<%=Server.UrlEncode(Request.QueryString["lanmu1"])%>&thetype=<%=Request.QueryString["thetype"]%>'">
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



