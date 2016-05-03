<% @ Page Language="C#" Inherits="PageAdmin.zdyform_1" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server"  Type="zdyform_1" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>自定义表单管理</b></td></tr>
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
  <td  colspan=2 height=25><b>自定义表单管理</b></td>
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
                  <td align=center width=20% class=white height=25px>表单名称</td>
                  <td align=center width=15% class=white height=25px>数据库名</td>
                  <td align=center width=15% class=white>验证码</td>
                  <td align=center width=10% class=white>序号</td>
                  <td align=center width=40% class=white>管理</td>
                </tr>
              </table>
             </HeaderTemplate>            
             <ItemTemplate>
                <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
                <tr>
                  <td align=center width=20%  class=tdstyle>
                    <asp:TextBox  id="Tb_Name"  Text='<%#DataBinder.Eval(Container.DataItem,"name")%>' runat="server" /></td>
                  
                  <td align=center width=15%  class=tdstyle><asp:Label id="Lb_Table" Text='<%#DataBinder.Eval(Container.DataItem,"tablename")%>' runat="server"/></td>


                  <td align=center width=15%  class=tdstyle>
                    <asp:DropDownList id="D_Code" runat="server"><asp:Listitem value="1">开启</asp:Listitem><asp:Listitem value="0">关闭</asp:Listitem></asp:DropDownList>
                   </td>

                  <td align=center width=10%  class=tdstyle>
                    <asp:TextBox Id="Tb_xuhao" Text='<%#DataBinder.Eval(Container.DataItem,"xuhao")%>' runat="server" size="5" MaxLength="5"/>
                   </td>
                  <td align=center width=40% class=tdstyle>
                   <asp:Label id="Lb_id" Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server" visible="false"/>
                   <asp:Label id="Lb_code" Text='<%#DataBinder.Eval(Container.DataItem,"showcode")%>' runat="server" visible="false"/>
                     <a href="zdyform_2.aspx?fid=<%#DataBinder.Eval(Container.DataItem,"id")%>&ftable=<%#DataBinder.Eval(Container.DataItem,"tablename")%>&fname=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"name").ToString())%>">字段管理</a>
                     <a  href="zdyform_view.aspx?fid=<%#DataBinder.Eval(Container.DataItem,"id")%>&fcode=<%#DataBinder.Eval(Container.DataItem,"showcode")%>&ftable=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"tablename").ToString())%>&fname=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"name").ToString())%>&language=<%#DataBinder.Eval(Container.DataItem,"planguage")%>">获取前台表单</a>
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
    <tr><td  colspan=3 height=25><b>增加新表单</b></td>
    </tr>
      <tr>
        <td  height=25>
表单名称：<asp:TextBox    id="Add_Name"     maxlength=50 size=20  runat="server" />&nbsp;
数据库名：zdyform_<asp:TextBox    id="Add_Table" value="01"  maxlength=5 size=5  runat="server" />&nbsp;
前台验证码:<asp:DropDownList id="Add_Code" runat="server"><asp:Listitem value="1">开启</asp:Listitem><asp:Listitem value="0">关闭</asp:Listitem></asp:DropDownList>&nbsp;
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



