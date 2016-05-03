<% @ Page Language="C#" Inherits="PageAdmin.sort_2" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="pasort"/> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>小类设置</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top  align="left">

<form runat="server" >
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  colspan=2 height=25><b><%=Request.QueryString["sort1_name"]%></b></td>
 </tr>
</table>
    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
      <tr>
        <td  colspan=2 height=25>
                 <asp:DataList id="DL1" runat="server" border=0 RepeatLayout="Table" width=100% cellspacing=0 cellpadding=0
                 OnItemDataBound="PageAdmin_Data_Bound"  OnDeleteCommand="PageAdmin_Data_Delete" >  
             <HeaderTemplate>
                 <table border=0 cellpadding=0 cellspacing=1 width=100% class=tablestyle >
                <tr>
                  <td align=center width=30% class=white height=20>大类</td>
                  <td align=center width=30% class=white height=20>小类</td>
                  <td align=center width=10% class=white>序号</td>
                  <td align=center width=30% class=white>管理</td>
                </tr>
              </table>
             </HeaderTemplate>
                    <ItemTemplate>
                      <table border=0 cellpadding=0 cellspacing=0 width=100%  class=tablestyle>
                       <tr>
                  <td align=center width=30%  class=tdstyle>
                    <asp:DropDownList id="Dl_Sort1" runat="server" DataTextField="sort_name"  DataValueField="id" ></asp:DropDownList>
                 </td>
                        <td align=center width=30% class=tdstyle>
                          <asp:TextBox  id="TBsort2" maxlength="50" size="25"  Text='<%#DataBinder.Eval(Container.DataItem,"sort_name")%>' runat="server"/> 
                        </td>
                         <td align=center width=10% class=tdstyle>
<asp:TextBox id="Xuhao" Text='<%#DataBinder.Eval(Container.DataItem,"xuhao")%>' runat="server" Size="5" />
                         </td>
                   <td align=center width=30% class=tdstyle>
<asp:Label   id="Lbid"  Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server"  visible="false" />
<asp:Label   id="Lbparent_id"  Text='<%#DataBinder.Eval(Container.DataItem,"parent_id")%>' runat="server"  visible="false" />
<asp:LinkButton id="Delete" runat="server" Text="删除" CommandName="Delete" />
<a href="javascript:Open_Memberpublish('memberpublish_set.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id")%>&table=sort&type1='+escape('<%#Request.QueryString["sort1_name"]%>')+'&type2='+escape('<%#DataBinder.Eval(Container.DataItem,"sort_name")%>'))">会员发布设置</a>
                        </td>
                      </tr>
                     </table>
                    </ItemTemplate>
                 </asp:DataList>
<br>
        <div align=center>
          <asp:Button  runat="server" Text="修改"  CssClass="button" OnClick="PageAdmin_Data_Update" />
          <input  type="button" onclick="location.href='sort_1.aspx?fid=<%=F_Id%>&table=<%=The_Table%>'" Class="button"  value="返回"/>
       </div>
       </td>
    </tr>
   </table>
  </td>
  <tr>
 </table>
<br>

<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>
    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
    <tr><td  colspan=3 height=25><b>增加"<%=Request.QueryString["sort1_name"]%>"小类</b></td>
    </tr>
      <tr>
        <td  height=25>
小类名称：<asp:TextBox  id="AddSort"  maxlength="50"  size=25  runat="server" />
序号：<asp:TextBox       id="AddXuhao"  text="0" maxlength=5 size=5 runat="server" />
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



