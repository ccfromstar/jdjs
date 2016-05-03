<% @ Page Language="C#" Inherits="PageAdmin.channel_2" %>
<% @ Register TagPrefix="aspcn" TagName="uc_fckeditor" src="/incs/fckeditor/fckeditor.ascx" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="network_2" />
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>添加网点</b></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
<form runat="server" >
  <td valign=top>
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td height=25><b>添加网点</b></td>
 </tr>
</table>
<table border=0 cellpadding=0 cellspacing=1 width=95% align=center>
 <tr >
    <td width=60px height=25  align=left>网点名称</td><td><asp:TextBox id="Name" Maxlength="45" size="40" runat="server" />
<asp:RequiredFieldValidator ControlToValidate="Name" display="Static" type="integer"  runat="server">
请输入网点名称</asp:RequiredFieldValidator></td>
   </tr>

      <tr >
        <td height=25 align=left>省份</td>
       <td>
<asp:DropDownList id="Province"  runat="server">
<asp:ListItem value="" selected>请选择省份</asp:ListItem>
<asp:ListItem value="beijing">北京</asp:ListItem>
<asp:ListItem value="shanghai">上海</asp:ListItem>
<asp:ListItem value="tianjin">天津</asp:ListItem>
<asp:ListItem value="chongqing">重庆</asp:ListItem>
<asp:ListItem value="guangdong">广东</asp:ListItem>
<asp:ListItem value="zhejiang">浙江</asp:ListItem>
<asp:ListItem value="fujian">福建</asp:ListItem>
<asp:ListItem value="anhui">安徽</asp:ListItem>
<asp:ListItem value="guangxi">广西</asp:ListItem>
<asp:ListItem value="yunnan">云南</asp:ListItem>
<asp:ListItem value="guizhou">贵州</asp:ListItem>
<asp:ListItem value="sichuan">四川</asp:ListItem>
<asp:ListItem value="hubei">湖北</asp:ListItem>
<asp:ListItem value="hunan">湖南</asp:ListItem>
<asp:ListItem value="hainan">海南</asp:ListItem>
<asp:ListItem value="jiangsu">江苏</asp:ListItem>
<asp:ListItem value="jiangxi">江西</asp:ListItem>
<asp:ListItem value="shanxi">陕西</asp:ListItem>
<asp:ListItem value="shandong">山东</asp:ListItem>
<asp:ListItem value="shanxi_1">山西</asp:ListItem>
<asp:ListItem value="hebei">河北</asp:ListItem>
<asp:ListItem value="henan">河南</asp:ListItem>
<asp:ListItem value="heilongjiang">黑龙江</asp:ListItem>
<asp:ListItem value="liaoning">辽宁</asp:ListItem>
<asp:ListItem value="jilin">吉林</asp:ListItem>
<asp:ListItem value="ninxia">宁夏</asp:ListItem>
<asp:ListItem value="qinghai">青海</asp:ListItem>
<asp:ListItem value="xizang">西藏</asp:ListItem>
<asp:ListItem value="xinjiang">新疆</asp:ListItem>
<asp:ListItem value="neimenggu">内蒙古</asp:ListItem>
<asp:ListItem value="gansu">甘肃</asp:ListItem>
<asp:ListItem value="xianggang">香港</asp:ListItem>
<asp:ListItem value="taiwan">台湾</asp:ListItem>
<asp:ListItem value="aomen">澳门</asp:ListItem>
<asp:ListItem value="else">其他</asp:ListItem>
</asp:DropDownList>
<asp:RequiredFieldValidator ControlToValidate="Province" display="Static" type="integer"  runat="server">
请输入所在省份</asp:RequiredFieldValidator></td>
      </td>
     </tr>
      <tr >
        <td height=25  align=left>城市</td><td><asp:TextBox id="City" Maxlength="45" size="40" runat="server" />
<asp:RequiredFieldValidator ControlToValidate="City" display="Static" type="integer"  runat="server">
请输入所在城市,如：中山市</asp:RequiredFieldValidator></td>
     </tr>


      <tr>
        <td align=left>网点介绍</td><td>
<asp:TextBox  id="Content"  TextMode="MultiLine"  runat="server" />
<aspcn:uc_fckeditor  Tb_Id="Content" Fck_Height="400" Fck_Style="Basic" runat="server"/>
</td>
      </tr>
      <tr>
        <td height=25  align=left>序号</td><td><asp:TextBox id="Xuhao" Text="1" Maxlength="5" size="5" runat="server" />
 <asp:RequiredFieldValidator   ControlToValidate="Xuhao" display="Dynamic" type="integer"  runat="server">
序号不能为空</asp:RequiredFieldValidator>
<asp:RangeValidator   ControlToValidate="Xuhao" display="Static" type="integer" MinimumValue="1" MaximumValue="1000" runat="server">
请输入1—1000之间的数字</asp:RangeValidator>
     </tr>
</table>
<table border=0 cellpadding=5 cellspacing=1 width=95% align=center>
      <tr>
        <td height=25 align=center>
          <asp:Button Text="提交" Cssclass="button" Runat="server" onclick="PageAdmin_Data_Add"/>
          <input type="button"    value="返回"     class="button" onclick="location.href='channel_1.aspx'"/>
       </td>
     </tr>
</table>

</td>
</tr>
</form>
</table>

</center>
</body>
</html>  