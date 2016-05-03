<% @ Page Language="C#" Inherits="PageAdmin.lanmu_1" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="lanmu_1"  /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>栏目设置</b></td></tr>
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
  <td  colspan=2 height=25><b>栏目管理</b></td>
 </tr>
</table>

    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
      <tr>
        <td  colspan=2  align="left">
          <asp:DataList id="lanmulist" runat="server" border=0 RepeatLayout="Table" width=100% cellspacing=0 cellpadding=0
          OnItemDataBound="PageAdmin_Data_Bound"  OnDeleteCommand="PageAdmin_Data_Delete" >
             <HeaderTemplate>
                 <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
                <tr>
                  <td align=center width=15% class=white height=20>栏目名称</td>
                  <td align=center width=10% class=white>栏目类型</td>
                  <td align=center width=20% class=white>自定义链接</td>
                  <td align=center width=10% class=white>链接目标</td>
                  <td align=center width=10% class=white>显示</td>
                  <td align=center width=5% class=white>序号</td>
                  <td align=center width=30% class=white>栏目管理</td>
                </tr>
              </table>
             </HeaderTemplate>            
             <ItemTemplate>
                <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
                <tr>
                  <td align=center width=15%  class=tdstyle>
                    <asp:TextBox   id="Tb_Lanmu"  Text='<%#DataBinder.Eval(Container.DataItem,"lanmu1")%>' runat="server" size="12" maxlength="100"/></td>
                  <td align=center width=10%  class=tdstyle>
                    <asp:DropDownList id="DL_LanmuType" runat="server" >
                     <asp:listItem value="index" style="color:#ff0000">首页</asp:ListItem>
                     <asp:listItem value="normal">普通栏目</asp:ListItem>
                    </asp:DropDownList>
            </td>
                  <td align=center width=20%  class=tdstyle>
                    <asp:TextBox id="Tb_Url" Text='<%#DataBinder.Eval(Container.DataItem,"url")%>' runat="server" size=18  maxlength="100" />
                   </td>

                  <td align=center width=10%  class=tdstyle>
                     <asp:DropDownList id="DL_Target" runat="server" >
                     <asp:listItem value="_self">本窗口</asp:ListItem>
                     <asp:listItem value="_blank" style="color:#ff0000">新窗口</asp:ListItem>
                     </asp:DropDownList>
                   </td>

                  <td align=center width=10%  class=tdstyle>
                     <asp:DropDownList id="DL_Show" runat="server" >
                     <asp:listItem value="1">显示</asp:ListItem>
                     <asp:listItem value="0" style="color:#ff0000">隐藏</asp:ListItem>
                     </asp:DropDownList>
                   </td>

                <td align=center width=5%  class=tdstyle>
                    <asp:TextBox id="Xuhao" Text='<%#DataBinder.Eval(Container.DataItem,"xuhao")%>' runat="server" size="2" maxlength="3" />
                </td>

                  <td align=left width=30% class=tdstyle>
                    <asp:Label  id="Id" Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server" visible="false" />
                    <asp:Label  id="Lb_Lanmu" Text='<%#DataBinder.Eval(Container.DataItem,"lanmu1")%>' runat="server" visible="false" />
                    <asp:Label  id="Lb_LanmuType" Text='<%#DataBinder.Eval(Container.DataItem,"thetype")%>' runat="server" visible="false" />
                    <asp:Label  id="Lb_LanmuShow" Text='<%#DataBinder.Eval(Container.DataItem,"show")%>' runat="server" visible="false" />
                    <asp:Label  id="Lb_Target" Text='<%#DataBinder.Eval(Container.DataItem,"target")%>' runat="server" visible="false" />
                   <asp:LinkButton  id="Delete" CommandName="Delete" runat="server" Text="删除" />
                   <asp:Hyperlink   id="Edit"  runat="server" Text="导航设置"  visible="false" NavigateUrl='<%#"lanmu_2.aspx?lanmu1id="+DataBinder.Eval(Container.DataItem,"id")+"&lanmu1="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"lanmu1").ToString())+"&thetype="+DataBinder.Eval(Container.DataItem,"thetype")%>' />
                   <asp:Hyperlink   id="Edit_Template"  runat="server" Text="模块设置"  visible="true" NavigateUrl='<%#"lanmu_1_template.aspx?lanmu1id="+DataBinder.Eval(Container.DataItem,"id")+"&lanmu1="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"lanmu1").ToString())+"&thetype="+DataBinder.Eval(Container.DataItem,"thetype")%>' />
                   <asp:Hyperlink   id="Edit_Zdy"   runat="server"  NavigateUrl='<%#"lanmu_1_zdy.aspx?&id="+DataBinder.Eval(Container.DataItem,"id")+"&lanmu1="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"lanmu1").ToString())%>'  Text="局部自定义" />
                  </td>
                </tr>
              </table>
             </ItemTemplate>
          </asp:DataList>
<br>
        <div align=center><asp:Button  runat="server" Text="修改"  CssClass="button" OnClick="PageAdmin_Data_Update" />
       </td>
    </tr>
   </table>
  </td>
  <tr>
 </table>
<br>
<div style="margin:0 0 5px 0;height:20px;"><span style="color:#ff0000;">说明：</span>网站基本结构在导航设置和模块设置中设置</div>
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top align="left">
    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
    <tr><td  colspan=3 height=25><b>增加栏目</b></td>
    </tr>
      <tr>
        <td  height=25>栏目名称：<asp:TextBox  id="AddLanmu"   maxlength="100" size="20"  runat="server" />
                      栏目类型：
                   <asp:DropDownList id="AddLanmuType" runat="server" >
                     <asp:listItem value="index" style="color:#ff0000">首页</asp:ListItem>
                     <asp:listItem value="normal" Selected=true>普通栏目</asp:ListItem>
                    </asp:DropDownList>
                      序号：<asp:TextBox       id="AddXuhao"  Text="0" maxlength=5 size=5 runat="server" />
                      <asp:button  CssClass="button"  Text="增加" runat="server" OnClick="PageAdmin_Data_Add" />
        </td>
    </tr>
   </table>
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
</html>  



