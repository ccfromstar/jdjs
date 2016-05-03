<% @ Page Language="C#" Inherits="PageAdmin.zdymodel_1" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server"  Type="zdyform_2" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>自定义模型管理</b></td></tr>
 <tr><td height=10></td></tr>
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
  <td  colspan=2 height=25><b>自定义模型管理</b></td>
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
                  <td align=center width=10% class=white height=25px>模型ID</td>
                  <td align=center width=30% class=white height=25px>名称</td>
                  <td align=center width=20% class=white height=25px>调用数据库</td>
                  <td align=center width=20% class=white>序号</td>
                  <td align=center width=20% class=white>管理</td>
                </tr>
              </table>
             </HeaderTemplate>            
             <ItemTemplate>
                <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
                <tr>
                  <td align=center width=10%  class=tdstyle>
                    <asp:TextBox  size="5" Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server" Disabled="false" /></td>

                  <td align=center width=30%  class=tdstyle>
                    <asp:TextBox  id="Tb_Name"  Text='<%#DataBinder.Eval(Container.DataItem,"name")%>' runat="server" /></td>
                  

                  <td align=center width=20%  class=tdstyle>
                     <asp:Label id="Lb_Table" Text='<%#DataBinder.Eval(Container.DataItem,"f_table")%>' runat="server"/>
                   </td>

                  <td align=center width=10%  class=tdstyle>
                    <asp:TextBox Id="Tb_xuhao" Text='<%#DataBinder.Eval(Container.DataItem,"xuhao")%>' runat="server" size="5" MaxLength="5"/>
                   </td>
                  <td align=center width=40% class=tdstyle>
                   <asp:Label id="Lb_id" Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server" visible="false"/>
                     <a href="zdymodel_2.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id")%>&fid=<%#DataBinder.Eval(Container.DataItem,"f_id")%>&ftable=<%#DataBinder.Eval(Container.DataItem,"f_table")%>&name=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"name").ToString())%>">模型设置</a>
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
    <tr><td  colspan=3 height=25><b>增加新模型</b></td>
    </tr>
      <tr>
        <td  height=25>
模型名称：<asp:TextBox    id="Add_Name"     maxlength=50  size=20  runat="server" />&nbsp;
调用数据表：
<asp:DropDownList id="Add_Table" runat="server" DataTextField="tablename" DataValueField="id" />


序号：<asp:TextBox       id="Add_xuhao"  Text="0" maxlength=5 size=5 runat="server" />&nbsp;
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



