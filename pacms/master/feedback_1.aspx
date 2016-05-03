<% @ Page Language="C#" Inherits="PageAdmin.feedback_1"%>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="business_4" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>用户留言管理</b></td></tr>
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
  <td  width=50% height=25><b>用户留言管理</b></td>
  <td width=50%  height=25 align=right></td>
 </tr>
</table>
    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
      <tr>
        <td  colspan=2 height=25>

          <asp:DataList id="dtl1" runat="server" border=0 RepeatLayout="Table" width=100% cellspacing=0 cellpadding=0 
          OnItemDataBound="PageAdmin_Data_Bound">  
            <headerTemplate>
               <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle style="table-layout:fixed;">
                <tr>
                  <td height=25 align=center width=5%  class=white >id</td>
                  <td height=25 align=center width=35%  class=white >留言</td>
                  <td height=25 align=center width=10%  class=white >类型</td>
                  <td height=25 align=center width=10%  class=white >状态</td>
                  <td height=25 align=center width=15%  class=white >反馈日期</td>
                  <td height=25 align=center width=10%  class=white >会员</td>
                  <td height=25 align=center width=15%  class=white >操作</td>
                </tr>
                </table>
            </headerTemplate>
             <ItemTemplate>
              <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle style="table-layout:fixed;">
               <tr>
                  <td height=25  width=5%  align=center class=tdstyle ><%#Xuhao++%></td>
                  <td height=25  width=35% align=left class=tdstyle><a href='feedback_2.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id")%>&username=<%#Request.QueryString["username"]%>&replay=<%#Request.QueryString["replay"]%>'><%#DataBinder.Eval(Container.DataItem,"title")%></a></td>
                  <td height=25  width=10%  align=center class=tdstyle><%#DataBinder.Eval(Container.DataItem,"type")%></td>
                  <td height=25  width=10%  align=center class=tdstyle><%#Get_state(DataBinder.Eval(Container.DataItem,"replay").ToString())%></span></td></td>
                  <td height=25  width=15%  align=center class=tdstyle><%#DataBinder.Eval(Container.DataItem,"thedate","{0:yyyy-MM-dd}")%></td>
                  <td height=25  width=10%  align=center  class=tdstyle ><a href='member_info.aspx?username=<%#DataBinder.Eval(Container.DataItem,"username")%>'><%#DataBinder.Eval(Container.DataItem,"username")%></a></td>
                  <td height=25  width=15%  align=left class=tdstyle >&nbsp;&nbsp;
<a href='feedback_2.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id")%>&username=<%#Request.QueryString["username"]%>&replay=<%#Request.QueryString["replay"]%>'>查看</a>
<asp:LinkButton Text="显示"  Forecolor="#ff0000"  id="Show"  OnCommand="Data_Show"    CommandName='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server" Visible="false" />
<asp:LinkButton Text="隐藏"  id="Hidden"  OnCommand="Data_Hidden"  CommandName='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server" Visible="false" />
<asp:Label id="Lb_username" Text='<%#DataBinder.Eval(Container.DataItem,"username")%>' runat="server" visible="false"/>
<asp:Label id="Lb_show" Text='<%#DataBinder.Eval(Container.DataItem,"show")%>' runat="server" visible="false"/>
<asp:LinkButton Text="删除"  id="Delete"  OnCommand="Data_Delete"  CommandName='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server" />
</td>         
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
  <td height=25><b>按类别显示</b></td>
 </tr>

<tr>
  <td  height=25  width=200>按类别显示：
<asp:DropDownList id="DLtype" AutoPostBack="true" OnSelectedIndexChanged="PageAdmin_DL_Changed"   runat="server">
<asp:ListItem Value="">请选择留言类别</asp:ListItem>
        <asp:ListItem value="咨询"> 咨询 </asp:ListItem>
        <asp:ListItem value="问题"> 问题 </asp:ListItem>
        <asp:ListItem value="建议"> 建议 </asp:ListItem>
        <asp:ListItem value="投诉"> 投诉 </asp:ListItem>
        <asp:ListItem value="合作"> 合作 </asp:ListItem>
        <asp:ListItem value="其他"> 其他 </asp:ListItem>
</asp:DropDownList> 
</td>

</tr>
 </td>
 <tr>
</table>
<br>
</form>

</td>
</tr>
</table>
</center>
</body>
</html>  