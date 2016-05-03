<% @ Page Language="C#" Inherits="PageAdmin.comments_1" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server"  /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>评论管理</b></td></tr>
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
  <td  width=50% height=25><b>评论管理</b></td>
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
                  <td height=25 align=center width=80%  class=white >评论</td>
                  <td height=25 align=center width=10%  class=white >状态</td>
                  <td height=25 align=center width=10%  class=white >操作</td>
                </tr>
                </table>
            </headerTemplate>
             <ItemTemplate>
              <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
               <tr>
                  <td height=25  width=80%  class=tdstyle style="padding:5px 5px 10px 5px">
<%#ubb(DataBinder.Eval(Container.DataItem,"content").ToString())%>
<div align=right style="color:#999999">
<br>主题：<%#Get_Title(DataBinder.Eval(Container.DataItem,"cid").ToString())%>
<%#DataBinder.Eval(Container.DataItem,"username")%> 时间：<%#DataBinder.Eval(Container.DataItem,"thedate","{0:yyyy-MM-dd HH:mm:ss}")%> IP:<%#DataBinder.Eval(Container.DataItem,"ip")%></div>
</td>
                  <td height=25  width=10%  align=center class=tdstyle><%#Get_state(DataBinder.Eval(Container.DataItem,"show").ToString())%></span></td></td>
                  <td height=25  width=10%  align=left class=tdstyle >
<asp:LinkButton Text="显示"  Forecolor="#ff0000"  id="Show"  OnCommand="Data_Show"    CommandName='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server" Visible="false" />
<asp:LinkButton Text="隐藏"  id="Hidden"  OnCommand="Data_Hidden"  CommandName='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server" Visible="false" />
<asp:Label id="Lb_show" Text='<%#DataBinder.Eval(Container.DataItem,"show")%>' runat="server" visible="false"/>
<asp:LinkButton Text="删除"  id="Delete"  OnCommand="Data_Delete"  CommandName='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server" />
</td>         
                  <td>
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

</form>

</td>
</tr>
</table>
</center>
</body>
</html>  