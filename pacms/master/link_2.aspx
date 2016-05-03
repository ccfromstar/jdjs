<% @ Page Language="C#" Inherits="PageAdmin.link_2" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" />  
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>链接明细管理</b></td></tr>
 <tr><td height=10></td></tr>
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
  <td  colspan=2 height=25><b>链接明细管理</b></td>
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
                  <td align=center width=10% class=white height=25px>类型</td>
                  <td align=center width=20% class=white>名称</td>
                  <td align=center width=25% class=white>图片路径</td>
                  <td align=center width=25% class=white>URL地址</td>
                  <td align=center width=10% class=white>序号</td>
                  <td align=center width=10% class=white>管理</td>
                </tr>
              </table>
             </HeaderTemplate>            
             <ItemTemplate>
                <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
                <tr>
                  <td align=center width=10%  class=tdstyle>
                     <asp:DropDownList id="DL_link1" runat="server" DataTextField="link1" DataValueField="id">
                     </asp:DropDownList>
                  </td>

                  <td align=center width=20%  class=tdstyle>
                    <asp:TextBox Id="Tb_name" Text='<%#DataBinder.Eval(Container.DataItem,"name")%>' runat="server" size="20" MaxLength="50"/>
                   </td>

                  <td align=center width=25%  class=tdstyle>
                    <asp:TextBox Id="Tb_image" Text='<%#DataBinder.Eval(Container.DataItem,"linkimage")%>' runat="server" size="25" MaxLength="100"/>
                   </td>

                   <td align=center width=25%  class=tdstyle>
                    <asp:TextBox Id="Tb_url" Text='<%#DataBinder.Eval(Container.DataItem,"url")%>' runat="server" size="25" MaxLength="100"/>
                   </td>
                  <td align=center width=10%  class=tdstyle>
                    <asp:TextBox Id="Tb_xuhao" Text='<%#DataBinder.Eval(Container.DataItem,"xuhao")%>' runat="server" size="5" MaxLength="5"/>
                   </td>
                  <td align=center width=10% class=tdstyle>
                  <asp:Label id="Lb_link1id" Text='<%#DataBinder.Eval(Container.DataItem,"link1id")%>' runat="server" visible="false"/>
                   <asp:Label id="Lb_id" Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server" visible="false"/>
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
<asp:Button text="修改" Onclick="PageAdmin_Data_Update"  CssClass="button" runat="server" />
<input type="button" value=" 返回 " onclick="location.href='link_1.aspx'" class="button" />
</div>
  </td>
  <tr>
 </table>
<br>
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top align="left">
    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
    <tr><td   height=25><b>增加链接</b></td>
    </tr>
      <tr>
        <td height=25>分类类型：
                      <asp:DropDownList id="Add_link1" runat="server" DataTextField="link1" DataValueField="id"></asp:DropDownList>&nbsp;&nbsp;
                      名称：<asp:TextBox  id="Add_name"   maxlength="45" size="20" runat="server" />&nbsp;&nbsp;序号：<asp:TextBox  id="Add_xuhao" Text="0" maxlength=5 size=5 runat="server" /><br>
                      图片路径：<asp:TextBox  id="Add_image"  maxlength="100" size="20" runat="server" />&nbsp;&nbsp;
                      链接地址：<asp:TextBox   id="Add_url"   Text="http://" maxlength="100" size="25" runat="server" />
                      <div align=center style="height:30px;padding:10px 0 0 0"><asp:button  CssClass="button"  Text="增加" runat="server" OnClick="PageAdmin_Data_Add" /></div>
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



