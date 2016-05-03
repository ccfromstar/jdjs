<% @ Page Language="C#" Inherits="PageAdmin.order_1" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="business_1" />
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>订单管理</b></td></tr>
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
  <td  width=50% height=25><b>订单管理</b></td>
  <td width=50%  height=25 align=right></td>
 </tr>
</table>
    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
      <tr>
        <td  colspan=2 height=25>

          <asp:DataList id="dtl1" runat="server" border=0 RepeatLayout="Table" width=100% cellspacing=0 cellpadding=0 
          OnItemDataBound="PageAdmin_Data_Bound">  
            <headerTemplate>
               <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
                <tr>
                  <td height=25 align=center width=5%  class=white >序号</td>
                  <td height=25 align=center width=20%  class=white >订单号</td>
                   <td height=25 align=center width=15%  class=white>会员名</td>
                  <td height=25 align=center width=15%  class=white >付款状态</td>
                  <td height=25 align=center width=15%  class=white >发货状态</td>
                  <td height=25 align=center width=15%  class=white >订购日期</td>
                  <td height=25 align=center width=20%  class=white >操作</td>
                </tr>
                </table>
            </headerTemplate>
             <ItemTemplate>
              <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle>
               <tr>
                  <td height=25  width=5%   align=center  class=tdstyle><%#Xuhao++%></td>
                  <td height=25  width=20%  align=center  class=tdstyle><%#DataBinder.Eval(Container.DataItem,"orderid")%></td>
                  <td height=25  width=15%  align=center  class=tdstyle><a href='member_info.aspx?username=<%#DataBinder.Eval(Container.DataItem,"username")%>'><%#DataBinder.Eval(Container.DataItem,"username")%></a></td>
                  <td height=25  width=15%  align=center  class=tdstyle><%#Get_PayState(DataBinder.Eval(Container.DataItem,"paystate").ToString())%></td></td>
                  <td height=25  width=15%  align=center  class=tdstyle><%#Get_SendState(DataBinder.Eval(Container.DataItem,"sendstate").ToString())%></td></td>
                  <td height=25  width=15%  align=center  class=tdstyle><%#DataBinder.Eval(Container.DataItem,"thedate","{0:yyyy-MM-dd}")%></td>
                  <td height=25  width=20%  align=center class=tdstyle >
<a href='order_2.aspx?orderid=<%#DataBinder.Eval(Container.DataItem,"orderid")%>&username=<%=UserName%>'>查看</a>
<asp:LinkButton Text="删除"  id="Delete"  OnCommand="PageAdmin_Data_Delete"  CommandName='<%#DataBinder.Eval(Container.DataItem,"orderid")%>'  runat="server" />
</td>         
                </tr>
                </table>
             </ItemTemplate>
          </asp:DataList>
<br>

        共<asp:Label id="Lblrecordcount"  Text=0 runat="server" />条记录 
&nbsp;当前页次: <asp:Label id="Lblcurrentpage"  runat="server" />/<asp:Label id="LblpageCount"  runat="server" />&nbsp;
<asp:Button  text="上一页"  id="LblPrev"  class=button runat="server"  CommandName="Prev"   OnCommand="PageAdmin_Bt_Click" />&nbsp;
<asp:Button  text="下一页"  id="LblNext"  class=button runat="server"  CommandName="Next"   OnCommand="PageAdmin_Bt_Click" />&nbsp;
转到:&nbsp;<asp:DropDownList id="DLpage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="PageAdmin_Page_Changed"  /> 页&nbsp;
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
  <td height=25><b>定单搜索</b></td>
 </tr>
<tr>
  <td  height=25 >
定单号：<asp:TextBox id="S_orderid" runat="server" maxlength=50 size="25" />&nbsp;
用户名：<asp:TextBox id="S_name" runat="server" maxlength=50  size="25" />
<asp:Button Text="搜索" runat="server" CssClass="button" OnClick="PageAdmin_Order_Search"/>
</td>
</tr>
</table>

 </td>
 <tr>
</table>
<br><asp:Label id="S_error" runat="server" />
<br>
</form>

</td>
</tr>
</table>
</center>
</body>
</html>  