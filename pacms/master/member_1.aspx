<% @ Page Language="C#"  Inherits="PageAdmin.member_1" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="member_3" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>会员管理</b></td></tr>
 <tr><td height=10 ></td></tr>
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
  <td height=25><b>会员管理</b></td>
 </tr>
</table>

    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
      <tr>
        <td  colspan=2  align="left">
            <table border=0 cellpadding=0 cellspacing=1 width=100% class=tablestyle >
                <tr>
                  <td align=center width=15% class=white height=20>会员名</td>
                  <td align=center width=10% class=white>姓名</td>
                  <td align=center width=15% class=white>联系电话</td>
                  <td align=center width=10% class=white>会员类型</td>
                  <td align=center width=15% class=white>注册时间</td>
                  <td align=center width=15% class=white>最后登陆</td>
                  <td align=center width=20% class=white>管理</td>
                </tr>
              </table> 
          <asp:Repeater id="P1" runat="server" OnItemDataBound="PageAdmin_Data_Bound">    
             <HeaderTemplate>
                 <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
             </HeaderTemplate>      
             <ItemTemplate>
                 <tr>
                  <td align=center width=15% class="tdstyle"><a href='member_info.aspx?username=<%#DataBinder.Eval(Container.DataItem,"username")%>'><%#DataBinder.Eval(Container.DataItem,"username")%></a></td>
                  <td align=center width=10% class="tdstyle"><%#DataBinder.Eval(Container.DataItem,"truename")%></td>
                  <td align=center width=15% class="tdstyle"><%#DataBinder.Eval(Container.DataItem,"tel")%></td>
                  <td align=center width=10% class="tdstyle"><%#Get_Type(DataBinder.Eval(Container.DataItem,"m_type").ToString())%></td>
                  <td align=center width=15% class="tdstyle"><%#DataBinder.Eval(Container.DataItem,"thedate","{0:yyyy-MM-dd}")%></td>
                  <td align=center width=15% class="tdstyle"><%#DataBinder.Eval(Container.DataItem,"lastdate")%></td>
                  <td align=center width=20% class="tdstyle">
                   <asp:Label id="Lb_UserName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"username")%>' visible="false" />
                    <asp:Label id="M_Group" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"m_group")%>' visible="false" />
                    <asp:LinkButton Id="LK_Check" runat="server" ForeColor="#ff0000" Text="开放" CommandName='<%#DataBinder.Eval(Container.DataItem,"id")%>' OnCommand="PageAdmin_Member_Checked" visible='<%#Get_Bool(DataBinder.Eval(Container.DataItem,"checked").ToString())%>' />
                    <asp:HyperLink   id="Permissions_set"    runat="server" Text="权限设置"   visible="false"  NavigateUrl='<%#"admin_permissions.aspx?id="+DataBinder.Eval(Container.DataItem,"id")+"&username="+DataBinder.Eval(Container.DataItem,"username")+"&m_type="+DataBinder.Eval(Container.DataItem,"m_type")%>' />
                    <asp:LinkButton Id="LK_UnCheck" runat="server"  Text="屏蔽" CommandName='<%#DataBinder.Eval(Container.DataItem,"id")%>' OnCommand="PageAdmin_Member_UnChecked" visible='<%#!Get_Bool(DataBinder.Eval(Container.DataItem,"checked").ToString())%>' />
                    <asp:LinkButton Id="Delete" runat="server" Text="删除" CommandName='<%#DataBinder.Eval(Container.DataItem,"username")%>' OnCommand="PageAdmin_Data_Delete" />
                  </td>
                </tr>
             </ItemTemplate>
             <FooterTemplate>
               </table> 
             </FooterTemplate>
          </asp:Repeater>

<br>
共<asp:Label id="Lblrecordcount"  Text=0 runat="server" />条记录 
&nbsp;当前页次: <asp:Label id="Lblcurrentpage"  runat="server" />/<asp:Label id="LblpageCount"  runat="server" />&nbsp;
<asp:Button  text="上一页"  id="LblPrev"  class=button runat="server"  CommandName="Prev"   OnCommand="PageAdmin_Bt_Click" />&nbsp;
<asp:Button  text="下一页"  id="LblNext"  class=button runat="server"  CommandName="Next"   OnCommand="PageAdmin_Bt_Click" />&nbsp;
转到:&nbsp;<asp:DropDownList id="DLpage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="PageAdmin_Page_Changed"  /> 页&nbsp;

       </td>
    </tr>
   </table>
  </td>
  <tr>
 </table>


<br>
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top align="left">

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
 <tr>
  <td height=25><b>会员搜索</b></td>
 </tr>
 <tr>
  <td height="25px">
   
    根据<asp:DropDownList id="S_Type" Runat="server">
        <asp:ListItem Value="username">会员号</asp:ListItem>
        <asp:ListItem Value="truename">姓名</asp:ListItem>
        <asp:ListItem Value="company">公司名称</asp:ListItem>
        <asp:ListItem Value="tel">电话</asp:ListItem>
        <asp:ListItem Value="email">邮箱</asp:ListItem>
        <asp:ListItem Value="qq">qq号</asp:ListItem>
        <asp:ListItem Value="msn">msn号</asp:ListItem>
        <asp:ListItem Value="address">地址</asp:ListItem>
     </asp:DropDownList>
   搜索
   关键字：<asp:TextBox id="S_Keywords" runat="server" Maxlength="25" size="25" />
   <asp:Button  Text="搜索" runat="server" class="button" onclick="PageAdmin_Search"/> 
 </td>
 </tr>
</table>
  </td>
  <tr>
 </table>
<br>
<asp:Label Id="Lbl_info"  Text="<font color=#ff0000>提示：</font>请输入关键字" runat="server" visible="false" />
</form>
</td>
</tr>
</table>
</center>
</body>
</html>  



