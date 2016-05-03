<% @ Page Language="C#" Inherits="PageAdmin.zdyform_2" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server"  Type="zdyform_1" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>字段管理</b></td></tr>
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
  <td height=25><b>表单</b>：<%=Request.QueryString["fname"]%></td>
  <td align=right>
   <a href="zdyform_3.aspx?&fid=<%=Request.QueryString["fid"]%>&ftable=<%=Request.QueryString["ftable"]%>&fname=<%=Server.UrlEncode(Request.QueryString["fname"])%>">增加字段</a>
  </td>
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
                  <td align=center width=15% class=white height=25px>字段名</td>
                  <td align=center width=10% class=white height=25px>字段</td>
                  <td align=center width=15% class=white height=25px>字段类型</td>
                  <td align=center width=10% class=white height=25px>前台显示</td>
                  <td align=center width=10% class=white height=25px>是否必填</td>
                  <td align=center width=10% class=white height=25px>搜索字段</td>
                  <td align=center width=10% class=white height=25px>采集字段</td>
                  <td align=center width=10% class=white height=25px>序号</td>
                  <td align=center width=10% class=white>管理</td>
                </tr>
              </table>
             </HeaderTemplate>            
             <ItemTemplate>
                <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
                <tr>
                  <td align=center width=15%  class=tdstyle><asp:TextBox id="Tb_Title" Text='<%#DataBinder.Eval(Container.DataItem,"field_title")%>' runat="server" size=12 maxlength=20/></td>
                  
                  <td align=center width=10%  class=tdstyle><asp:Label id="Lb_Field" Text='<%#DataBinder.Eval(Container.DataItem,"field_name")%>' runat="server"/></td>
                  <td align=center width=15%  class=tdstyle><%#Get_Field_type(DataBinder.Eval(Container.DataItem,"field_type").ToString())%>(<%#DataBinder.Eval(Container.DataItem,"value_type")%>)</td>

                  <td align=center width=10%  class=tdstyle>
			<asp:DropDownList id="Dl_Show" runat="server">
			  <asp:ListItem value="1">是</asp:ListItem>
			  <asp:ListItem value="0">否</asp:ListItem>
			</asp:DropDownList>
                  </td>
                  <td align=center width=10%  class=tdstyle>
			<asp:DropDownList id="Dl_Mustfill" runat="server">
			  <asp:ListItem value="1">是</asp:ListItem>
			  <asp:ListItem value="0">否</asp:ListItem>
			</asp:DropDownList>
                  </td>

                 <td align=center width=10%  class=tdstyle>
			<asp:DropDownList id="Dl_Search" runat="server">
			  <asp:ListItem value="0">否</asp:ListItem>
			  <asp:ListItem value="1">模糊匹配</asp:ListItem>
			  <asp:ListItem value="2">精确匹配</asp:ListItem>
			</asp:DropDownList>
                  </td>

                 <td align=center width=10%  class=tdstyle>
			<asp:DropDownList id="Dl_Collection" runat="server">
			  <asp:ListItem value="1">是</asp:ListItem>
			  <asp:ListItem value="0">否</asp:ListItem>
			</asp:DropDownList>
                  </td>
                  <td align=center width=10%  class=tdstyle><asp:TextBox id="Tb_Xuaho" Text='<%#DataBinder.Eval(Container.DataItem,"xuhao")%>' runat="server" size=2 maxlength=3 /></td>
                  <td align=center width=10% class=tdstyle>

                   <asp:Label id="Lb_mustfill" Text='<%#DataBinder.Eval(Container.DataItem,"mustfill")%>' runat="server" visible="false"/>
                   <asp:Label id="Lb_search" Text='<%#DataBinder.Eval(Container.DataItem,"search")%>' runat="server" visible="false"/>
                   <asp:Label id="Lb_collection" Text='<%#DataBinder.Eval(Container.DataItem,"collection")%>' runat="server" visible="false"/>
                   <asp:Label id="Lb_show" Text='<%#DataBinder.Eval(Container.DataItem,"show")%>' runat="server" visible="false"/>
                   <asp:Label id="Lb_id" Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server" visible="false"/>
                   <a href="zdyform_4.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id")%>&fid=<%=Request.QueryString["fid"]%>&ftable=<%=Request.QueryString["ftable"]%>&fname=<%=Server.UrlEncode(Request.QueryString["fname"])%>">编辑</a>
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
  <div align="center">
<asp:Button Text="更新" onclick="PageAdmin_Data_Update" runat="server" cssclass=button/>
<input type="button" class=button  value="返回"  onclick="location.href='zdyform_1.aspx'">
</div>
  </td>
  <tr>
 </table>
<br>
注：第一个字段默认为标题字段

</form>
</td>
</tr>
</table>
</center>
</body>
</html>  



