<% @ Page Language="C#" Inherits="PageAdmin.slide_2" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>幻灯片设置</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">

<form runat="server" >
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top align="left">

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  colspan=2 height=25><b>名称</b>：<%=Request.QueryString["name"]%></td>
 </tr>
</table>

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  height=25>图片类型</td>
  <td><asp:DropDownList id="Dl_pic_type" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Pic_Type_Change">
     <asp:ListItem value="0">文章图片</asp:ListItem>
     <asp:ListItem value="1">产品图片</asp:ListItem>
     <asp:ListItem value="2">自定义</asp:ListItem>
     </asp:DropDownList></td>
 </tr>
<asp:PlaceHolder id="p_1" runat="server">
<asp:PlaceHolder id="p1" runat="server">
<tr>
  <td  height=25 width=100>文章类别</td>
  <td><asp:DropDownList id="Dl_infor1" DataTextField="sort_name" DataValueField="id" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Infor1_Change"/> 
 <asp:Label id="LbTishi1" Text=" 文章小类 " Visible="false"  runat="server"/>
 <asp:DropDownList id="Dl_infor2" runat="server" Visible="false"  DataTextField="sort_name" DataValueField="id"  />

</td>
 </tr>
</asp:PlaceHolder>
<asp:PlaceHolder id="p2" runat="server">
<tr>
  <td  height=25 width=100>产品类别</td>
  <td><asp:DropDownList id="Dl_prod1" DataTextField="sort_name" DataValueField="id" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="Prod1_Change"/> 
 <asp:Label id="LbTishi2" Text=" 产品小类 " Visible="false"  runat="server"/>
 <asp:DropDownList id="Dl_prod2" runat="server" Visible="false"  DataTextField="sort_name" DataValueField="id"  />

</td>
 </tr>
</asp:PlaceHolder>


<tr>
  <td  height=25>显示类型</td>
  <td><asp:DropDownList id="Dl_show_type" runat="server">
     <asp:ListItem value="0">默认</asp:ListItem>
     <asp:ListItem value="1">专题文章/新品图片</asp:ListItem>
     <asp:ListItem value="2">推荐图片</asp:ListItem>
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
  <td  height=25>标题显示字数</td>
  <td><asp:TextBox id="Pic_title_num" runat="server"  Maxlength="2" size="5"/> 个字符 
 <asp:RequiredFieldValidator   ControlToValidate="Pic_title_num" display="Dynamic" type="integer"  runat="server">
显示字数不能为空</asp:RequiredFieldValidator>
<asp:RangeValidator   ControlToValidate="Pic_title_num" display="Dynamic" type="integer" MinimumValue="0" MaximumValue="100" runat="server">
请输入0—100之间的数字</asp:RangeValidator></td>
 </tr>

<tr>
  <td  height=25>图片总显示数</td>
  <td><asp:TextBox id="Show_num" runat="server"  Maxlength=3 size=5/> 张图片
 <asp:RequiredFieldValidator   ControlToValidate="Show_num" display="Dynamic" type="integer"  runat="server">
不能为空</asp:RequiredFieldValidator>
<asp:RangeValidator   ControlToValidate="Show_num" display="Static" type="integer" MinimumValue="1" MaximumValue="100" runat="server">
请输入1—100之间的数字</asp:RangeValidator></td>
 </tr>
</asp:PlaceHolder>

<asp:PlaceHolder id="p_2" runat="server" Visible="false">
<tr>
  <td  height=25>图片地址</td>
  <td><asp:TextBox id="Zdy_image" runat="server"  TextMode="multiLine"  Columns="70" Rows="5" /> 多个图片请用"|"分开,
 <asp:RequiredFieldValidator   ControlToValidate="zdy_image" display="Dynamic" type="integer"  runat="server">
不能为空</asp:RequiredFieldValidator>
 </tr>
<tr>
  <td  height=25>图片链接</td>
  <td><asp:TextBox id="Zdy_link" runat="server"  TextMode="multiLine"  Columns="70" Rows="5"/> 多个链接请用"|"分开,
 </tr>
<tr>
  <td  height=25>图片标题</td>
  <td><asp:TextBox id="Zdy_title" runat="server"  TextMode="multiLine"  Columns="70" Rows="5"/> 多个链接请用"|"分开,

 </tr>
</asp:PlaceHolder>

<tr>
  <td  height=25>图片边框</td>
  <td><asp:DropDownList id="Dl_border_width" runat="server" >
     <asp:ListItem value="0">无边框</asp:ListItem>
     <asp:ListItem value="1">带边框</asp:ListItem>
     </asp:DropDownList>
边框颜色：<asp:TextBox id="Tb_border_color"  runat="server" size="5" maxlength="8"></asp:TextBox> 
  </td>
 </tr>

<tr>
  <td  height=25>图片尺寸</td>
  <td>宽：<asp:TextBox id="Tb_width"  runat="server"  size="4" maxlength="4"/>px
高：<asp:TextBox id="Tb_height"  runat="server"  size="4" maxlength="4" />px
<asp:RequiredFieldValidator   ControlToValidate="Tb_width" display="Dynamic" type="integer"  runat="server">
宽度不能为空</asp:RequiredFieldValidator>
<asp:RequiredFieldValidator   ControlToValidate="Tb_height" display="Dynamic" type="integer"  runat="server">
高度不能为空</asp:RequiredFieldValidator>

<asp:RangeValidator   ControlToValidate="Tb_width" display="Dynamic" type="integer" MinimumValue="100" MaximumValue="1000" runat="server">
宽度请输入100—1000之间的数字</asp:RangeValidator>
<asp:RangeValidator   ControlToValidate="Tb_height" display="Dynamic" type="integer" MinimumValue="50" MaximumValue="1000" runat="server">
高度请输入50—500之间的数字</asp:RangeValidator>

</td>
 </tr>

<tr>
  <td  height=25 width=100>链接窗口</td>
  <td><asp:RadioButton id="RB_target_1" GroupName="Target" runat="server" />原窗口&nbsp;&nbsp;<asp:RadioButton id="RB_target_2" GroupName="Target" runat="server" />新窗口</td>
</tr>
</table>
<br>
<div align=center>
<asp:Button   Text="提交" CssClass="button" Runat="server" OnClick="PageAdmin_Data_Update"/>
<input type="button" class=button  value="返回"  onclick="location.href='slide_1.aspx'">
</div>

</td>
</tr>
</table>
<br>
注意："链接窗口"仅对JS幻灯片有效,flash幻灯片只能为jpg格式。

<asp:Label id="LblErr" runat="server" />
</form>
</td>
</tr>
</table>
</center>
</body>
</html>  



