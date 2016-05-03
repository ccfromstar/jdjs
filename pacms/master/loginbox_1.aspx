<% @ Page Language="C#" Inherits="PageAdmin.loginbox_1" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="js_1" />
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1 align="left"><b>会员登陆调用</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top  align="left">

<form runat="server" >
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top  align="left">

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  colspan=2 height=25  align="left"><b>会员登陆调用管理</b></td>
 </tr>
</table>

    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
      <tr>
        <td  colspan=2 height=25>
          <asp:DataList id="DL_1" runat="server" border=0 RepeatLayout="Table" width=100% cellspacing=0 cellpadding=0
          OnItemDataBound="PageAdmin_Data_Bound"    OnDeleteCommand="PageAdmin_Data_Delete" >
             <HeaderTemplate>
                 <table border=0 cellpadding=0 cellspacing=1 width=100% class=tablestyle >
                <tr>
                  <td align=center width=25% class=white height=25px>名称</td>
                  <td align=center width=20% class=white>显示方式</td>
                  <td align=center width=20% class=white>验证码</td>
                  <td align=center width=15% class=white>序号</td>
                  <td align=center width=20% class=white>管理</td>
                </tr>
              </table>
             </HeaderTemplate>            
             <ItemTemplate>
                <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
                <tr>
                  <td align=center width=20%  class=tdstyle>
                    <asp:TextBox  id="Tb_name" maxlength="45" Text='<%#DataBinder.Eval(Container.DataItem,"name")%>' runat="server" /></td>

                  <td align=center width=20%  class=tdstyle>
                    <asp:DropDownList id="Dl_Style" runat="server">
                      <asp:ListItem Value="0">纵向排列</asp:ListItem>
                      <asp:ListItem Value="1" style="color:#ff0000">横向排列</asp:ListItem>
                    </asp:DropDownList>
                   </td>

                  <td align=center width=20%  class=tdstyle>
                    <asp:DropDownList id="Dl_Code" runat="server">
                      <asp:ListItem Value="0">隐藏验证码</asp:ListItem>
                      <asp:ListItem Value="1" style="color:#ff0000">显示验证码</asp:ListItem>
                    </asp:DropDownList>
                   </td>

                  <td align=center width=15%  class=tdstyle>
                    <asp:TextBox Id="Tb_xuhao" Text='<%#DataBinder.Eval(Container.DataItem,"xuhao")%>' runat="server" size="5" MaxLength="5"/>
                   </td>
                  <td align=center width=35% class=tdstyle>
                   <asp:Label id="Lb_id" Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server" visible="false"/>
                   <asp:Label id="Lb_style" Text='<%#DataBinder.Eval(Container.DataItem,"style")%>' runat="server" visible="false"/>
                   <asp:Label id="Lb_code" Text='<%#DataBinder.Eval(Container.DataItem,"code")%>' runat="server" visible="false"/>
                   <a href="loginbox_2.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id")%>&name=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"name").ToString())%>">界面设置</a>
                    <a href="javascript:slide_Js_Code('<%#DataBinder.Eval(Container.DataItem,"id")%>','0','loginbox')">生成JS代码</a>
                   <asp:LinkButton id="Delete" runat="server" Text="删除" CommandName="Delete" />
                  </td>
                </tr>
              </table>
             </ItemTemplate>
         </asp:DataList>
       </td>
    </tr>
   </table>
    <br>
  <div align="center"><asp:Button text="修改" Onclick="PageAdmin_Data_Update"  CssClass="button" runat="server" /></div>
  </td>
  <tr>
 </table>
<br>

<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>
    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
    <tr><td  colspan=3 height=25><b>增加会员登陆调用</b></td>
    </tr>
      <tr>
        <td  height=25 align="left">名称：<asp:TextBox      id="Add_Name"   maxlength="45"  size=20  runat="server" />
                     选项类型：<asp:DropDownList id="Add_Style" runat="server">
                      <asp:ListItem Value="0">纵向排列</asp:ListItem>
                      <asp:ListItem Value="1" style="color:#ff0000">横向排列</asp:ListItem>
                    </asp:DropDownList>

 &nbsp;&nbsp;验证码：<asp:DropDownList id="Add_Code" runat="server">
                      <asp:ListItem Value="0">隐藏验证码</asp:ListItem>
                      <asp:ListItem Value="1" style="color:#ff0000">显示验证码</asp:ListItem>
                    </asp:DropDownList>
                      序号：<asp:TextBox       id="Add_xuhao"  Text="0" maxlength=5 size=5 runat="server" />
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



