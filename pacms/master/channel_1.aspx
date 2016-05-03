<% @ Page Language="C#" Inherits="PageAdmin.channel_1" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="network_1" />
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>服务网络管理</b></td></tr>
</table>

<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">

<form runat="server" >
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  width=50% height=25><b>服务网络管理</b></td>
  <td width=50%  height=25 align=right></td>
 </tr>
</table>
    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
      <tr>
        <td  colspan=2 height=25>

          <asp:DataList id="dtl1" runat="server" border=0 RepeatLayout="Table" width=100% cellspacing=0 cellpadding=0 
          OnItemDataBound="PageAdmin_Data_Bound"
           >  
            <headerTemplate>
               <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
                <tr>
                  <td height=25 align=center width=10%  class=white >序号</td>
                  <td height=25 align=center width=45%  class=white >网点名称</td>
                  <td height=25 align=center width=15%  class=white >省份</td>
                  <td height=25 align=center width=15%  class=white >城市</td>
                  <td height=25 align=center width=15%  class=white >操作</td>
                </tr>
                </table>
            </headerTemplate>
             <ItemTemplate>
              <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
               <tr>
                  <td height=25  width=10%  class=tdstyle><%#DataBinder.Eval(Container.DataItem,"xuhao")%></td>
                  <td height=25  width=45%  class=tdstyle><%#DataBinder.Eval(Container.DataItem,"name")%></td>
                  <td height=25  width=15%  align=center class=tdstyle><%#DataBinder.Eval(Container.DataItem,"cprovince")%></td>
                  <td height=25  width=15%  align=center class=tdstyle><%#DataBinder.Eval(Container.DataItem,"city")%></td>
                  <td height=25  width=15%  align=center class=tdstyle >
<a href='channel_2_1.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id")%>'>编辑</a> 
<asp:LinkButton Text="删除"  id="Delete"  OnCommand="Data_Delete"  CommandName='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server" /></td>         
                </tr>
                </table>
             </ItemTemplate>
          </asp:DataList>
<br>

        共<asp:Label id="Lblrecordcount"  Text=0 runat="server" />条记录 
&nbsp;当前页次: <asp:Label id="Lblcurrentpage"  runat="server" />/<asp:Label id="LblpageCount"  runat="server" />&nbsp;
<asp:Button  text="上一页"  id="LblPrev"  class=button runat="server"  CommandName="Prev"   OnCommand="Bt_Click" />&nbsp;
<asp:Button  text="下一页"  id="LblNext"  class=button runat="server"  CommandName="Next"   OnCommand="Bt_Click" />&nbsp;
转到:&nbsp;<asp:DropDownList id="DLpage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Page_Changed"  /> 页&nbsp;
</td>
  <tr>
 </table>
 </td>
 <tr>
</table>
<br>

<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>


<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  colspan=2 height=25><b>网点搜索</b></td>
 </tr>

<tr>
  <td  height=25  width=200 colspan=2>按省份显示：
<asp:DropDownList id="Province"  runat="server" AutoPostBack="true" OnSelectedIndexChanged="List1_Changed">
<asp:ListItem value="" selected>请选择省份</asp:ListItem>
<asp:ListItem value="beijin">北京</asp:ListItem>
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
</asp:DropDownList></td>
</tr>
<tr>
  <td  height=25 width=250px >网点名称：<asp:TextBox id="Sname"  size="20"  Maxlength=40 runat="server" /></td>
  <td  height=25 ><asp:Button  Text="确定" CssClass="button" runat="server" onclick="PageAdmin_Search" /></td>
</tr>
 </td>
 <tr>
</table>
</form>
</td>
</tr>
</table>
<br>
<asp:Label  runat="server" id="LblSearch" />
</td>
</tr>
</table>
</center>
</body>
</html>  



