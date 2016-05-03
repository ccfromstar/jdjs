<% @ Page Language="C#" Inherits="PageAdmin.hr_1" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="hr_1" />
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>招聘管理</b></td></tr>
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
  <td  width=50% height=25><b>招聘管理</b></td>
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
                  <td height=25 align=center width=5%  class=white >序号</td>
                  <td height=25 align=center width=20%  class=white >招聘职位</td>
                  <td height=25 align=center width=10%  class=white >招聘部门</td>
                  <td height=25 align=center width=10%  class=white >性别要求</td>
                  <td height=25 align=center width=10%  class=white >性质</td>
                  <td height=25 align=center width=10%  class=white >发布日期</td>
                  <td height=25 align=center width=10%  class=white >结束日期</td>
                  <td height=25 align=center width=25%  class=white >操作</td>
                </tr>
                </table>
            </headerTemplate>
             <ItemTemplate>
              <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
               <tr>
                  <td height=25 align=center width=5%  class=tdstyle><%#DataBinder.Eval(Container.DataItem,"xuhao")%></td>
                  <td height=25 align=center width=20% class=tdstyle><%#DataBinder.Eval(Container.DataItem,"zhiwei")%></td>
                  <td height=25 align=center width=10% class=tdstyle><%#DataBinder.Eval(Container.DataItem,"bumen")%></td>
                  <td height=25 align=center width=10% class=tdstyle><%#DataBinder.Eval(Container.DataItem,"xingbie")%></td>
                  <td height=25 align=center width=10% class=tdstyle><%#DataBinder.Eval(Container.DataItem,"xingzhi")%></td>
                  <td height=25 align=center width=10% class=tdstyle><%#DataBinder.Eval(Container.DataItem,"startdate","{0:yyyy-MM-dd}")%></td>
                  <td height=25 align=center width=10%  class=tdstyle><%#DataBinder.Eval(Container.DataItem,"overdate","{0:yyyy-MM-dd}")%></td>
                  <td height=25  width=25%  align=center  class=tdstyle>
<a href="hr_2_1.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id")%>">编辑</a> 
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
</form>

</td>
</tr>
</table>
</center>
</body>
</html>  



