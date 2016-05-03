<% @ Page Language="C#"  Inherits="PageAdmin.member_type" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="member_2" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>会员类别设置</b></td></tr>
 <tr><td height=10 ></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">
<form runat="server" >

<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top align="left">
     <table border=0 cellpadding=0 cellspacing=0 width=95%  class=tablestyle align=center>
       <tr>
                  <td height=25 align=center width=20%  class=white >会员类别</td>
                  <td height=25 align=center width=15%  class=white >注册权限</td>
                  <td height=25 align=center width=15%  class=white >注册审核</td>
                  <td height=25 align=center width=20%  class=white >说明</td>
                   <td height=25 align=center width=10%  class=white >序号</td>
                  <td height=25 align=center width=20%  class=white >操作</td>
        </tr>
       <asp:Repeater id="List1" runat="server" OnItemDataBound="Data_Bound">  
            <ItemTemplate>
                <tr>
                  <td height=25 align=center width=20%  class="tdstyle"><asp:TextBox id="Tb_type" Text='<%#DataBinder.Eval(Container.DataItem,"m_type")%>'  size="15" Runat="server" /></td>
                  <td height=25 align=center width=15%  class="tdstyle">
                    <asp:DropDownList id="DL_Reg" runat="server" >
                     <asp:listItem value="1" >开放注册</asp:ListItem>
                     <asp:listItem value="0" style="color:#ff0000">禁止注册</asp:ListItem>
                    </asp:DropDownList>
                  </td>

                  <td height=25 align=center width=15%  class="tdstyle">
                    <asp:DropDownList id="DL_Check" runat="server" >
                     <asp:listItem value="1" >需审核</asp:ListItem>
                     <asp:listItem value="0" style="color:#0066FF">无需审核</asp:ListItem>
                    </asp:DropDownList>
                  </td>

                  <td height=25 align=center width=20%  class="tdstyle"><asp:TextBox id="Tb_beizhu" Text='<%#DataBinder.Eval(Container.DataItem,"beizhu")%>'  Runat="server"  size="15" maxlength="100" /></td>
                  <td height=25 align=center width=10%  class="tdstyle"><asp:TextBox id="Tb_xuhao" Text='<%#DataBinder.Eval(Container.DataItem,"xuhao")%>'  Runat="server" size="3" maxlength="5"/></td>
                  <td height=25 align=center width=20%  class="tdstyle">
                   <asp:Label  id="Lb_Group"   Text='<%#DataBinder.Eval(Container.DataItem,"m_group")%>' Runat="server" Visible="false" />
                   <asp:Label  id="Lb_id"   Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' Runat="server" Visible="false" />
                   <asp:Label  id="Lb_reg"   Text='<%#DataBinder.Eval(Container.DataItem,"m_reg")%>' Runat="server" Visible="false" />
                   <asp:Label  id="Lb_check"   Text='<%#DataBinder.Eval(Container.DataItem,"m_check")%>' Runat="server" Visible="false" />
                   <a href="member_center_set.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id")%>&m_type=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"m_type").ToString())%>">会员中心设置</a>
                   <asp:LinkButton  id="Delete" CommandName='<%#DataBinder.Eval(Container.DataItem,"id")%>' OnCommand="Data_Delete" runat="server" Text="删除"  />
                  </td>
                </tr>
            </ItemTemplate>
       </asp:Repeater>
    </table>
<br>
<div align=center><asp:Button  runat="server" Text="修改"  CssClass="button" OnClick="PageAdmin_Data_Update" />
  </td>
  <tr>
 </table>

<br>

<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top align="left">

    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
    <tr>
    <td height=25><b>增加会员类别</b></td>
   </tr>
    </table>
    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
    <tr>
    <td height=25>
   会员类别：<asp:TextBox  id="Add_Type"     maxlength="50" size="20"  runat="server" />
   注册权限：                <asp:DropDownList id="Add_Reg" runat="server" >
                     <asp:listItem value="1" >开放注册</asp:ListItem>
                     <asp:listItem value="0">禁止注册</asp:ListItem>
                    </asp:DropDownList>
   注册审核： <asp:DropDownList id="Add_Check" runat="server" >
                     <asp:listItem value="1">需审核</asp:ListItem>
                     <asp:listItem value="0">无需审核</asp:ListItem>
                    </asp:DropDownList>
   序号：<asp:TextBox  id="Add_Xuhao"   Text="0"  maxlength="5" size="3"  runat="server" />
   <asp:button  CssClass="button"  Text="增加"  runat="server" OnClick="PageAdmin_Data_Add" />
    </td>
   </tr>
    </table>
  </td>
  <tr>
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



