<% @ Page Language="C#"  Inherits="PageAdmin.finance_1" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="business_2" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>财务记录</b></td></tr>
 <tr><td height=10 ></td></tr>
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
  <td height=25><b>财务记录</b></td>
 </tr>
</table>

    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
      <tr>
        <td  colspan=2  align="left">
            <table border=0 cellpadding=0 cellspacing=1 width=100% class=tablestyle style="table-layout:fixed;">
                <tr>
                  <td align=center width=10% class=white height=20>事项</td>
                  <td align=center width=10% class=white>金额</td>
                  <td align=center width=20% class=white><asp:DropDownList id="D_fnc_type" runat="server" OnSelectedIndexChanged="Fnc_type_change" AutoPostBack="true"><asp:ListItem value=""> -- </asp:ListItem><asp:ListItem value="rk"> 入款 </asp:ListItem><asp:ListItem value="xf"> 扣款 </asp:ListItem><asp:ListItem value="fk"> 返款 </asp:ListItem></asp:DropDownList></td>
                  <td align=center width=25% class=white>备注</td>
                  <td align=center width=15% class=white>时间</td>
                  <td align=center width=10% class=white>用户</td>
                  <td align=center width=10% class=white>管理</td>
                </tr>
              </table> 
          <asp:Repeater id="P1" runat="server" OnItemDataBound="Data_Bound">    
             <HeaderTemplate>
                 <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle  style="table-layout:fixed;">
             </HeaderTemplate>      
             <ItemTemplate>
                 <tr>
                  <td align=center width=10% class=tdstyle height=20><%#Get_Type(DataBinder.Eval(Container.DataItem,"fnc_type").ToString())%></td>
                  <td align=center width=10% class=tdstyle><b><%#Get_Symbol(DataBinder.Eval(Container.DataItem,"fnc_type").ToString())%><%#DataBinder.Eval(Container.DataItem,"fnc_amount")%></b></td>
                  <td align=center width=20% class=tdstyle><%#DataBinder.Eval(Container.DataItem,"fnc_detail")%></td>
                  <td align=center width=25% class=tdstyle><%#DataBinder.Eval(Container.DataItem,"beizhu")%></td>
                  <td align=center width=15% class=tdstyle><%#DataBinder.Eval(Container.DataItem,"thedate")%></td>
                  <td align=center width=10% class=tdstyle><a href='member_info.aspx?username=<%#DataBinder.Eval(Container.DataItem,"username")%>'><%#DataBinder.Eval(Container.DataItem,"username")%></a></td>
                  <td align=center width=10% class=tdstyle>
                    <asp:Label Id="Lb_type" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"fnc_type")%>' visible="false" />
                    <asp:Label Id="Lb_amount" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"fnc_amount")%>' visible="false" />
                    <asp:LinkButton Id="Delete" runat="server" Text="删除" CommandName='<%#DataBinder.Eval(Container.DataItem,"id")%>' OnCommand="Data_Delete" />
                  </td>
                </tr>
             </ItemTemplate>
             <FooterTemplate>
               </table> 
             </FooterTemplate>
          </asp:Repeater>
<br>
 <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle style="table-layout:fixed;">
                <tr>
                  <td align=center width=13% class=tdstyle height=20>入款总额</td>
                  <td align=center width=20% class=tdstyle><%=rk_total%></td>
                  <td align=center width=13% class=tdstyle>扣款总额</td>
                  <td align=center width=20% class=tdstyle><%=xf_total%></td>
                  <td align=center width=14% class=tdstyle>返款总额</td>
                  <td align=center width=20% class=tdstyle><%=fk_total%></td>
                </tr>
              </table> 
<br>
共<asp:Label id="Lblrecordcount"  Text=0 runat="server" />条记录 
&nbsp;当前页次: <asp:Label id="Lblcurrentpage"  runat="server" />/<asp:Label id="LblpageCount"  runat="server" />&nbsp;
<asp:Button  text="上一页"  id="LblPrev"  class=button runat="server"  CommandName="Prev"   OnCommand="Bt_Click" />&nbsp;
<asp:Button  text="下一页"  id="LblNext"  class=button runat="server"  CommandName="Next"   OnCommand="Bt_Click" />&nbsp;
转到:&nbsp;<asp:DropDownList id="DLpage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Page_Changed"  /> 页&nbsp;

       </td>
    </tr>
   </table>
  </td>
  <tr>
 </table>


<br>
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top align="left">

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
 <tr>
  <td height=25><b>财务记录搜索</b></td>
 </tr>
 <tr>
  <td height="25px">
  每页显示：<asp:TextBox id="Tb_PageSize" runat="server" Text="20" Maxlength="5" size="5" /> 
 </td>
 </tr>
 <tr>
  <td height="25px">
   按会员号查询：<asp:TextBox id="S_name" runat="server" Maxlength="25" size="15" /> 

   按日期查询：从 
<input name="Date_1" id="Date_1"  Maxlength="25" size="15" value="<%=Start_Date_Text%>" ><a href="javascript:open_calendar('Date_1')"><img src=images/calendar_bnt.gif border=0 height=20 hspace=2 align=absbottom></a> 
到 
  <input name="Date_2" id="Date_2"  Maxlength="25" size="15" value="<%=End_Date_Text%>" ><a href="javascript:open_calendar('Date_2')"><img src=images/calendar_bnt.gif border=0 height=20 hspace=2 align=absbottom></a> 
  <asp:Button  Text="搜索" runat="server" class="button" onclick="PageAdmin_Search"/> 
 </td>
 </tr>
</table>
  </td>
  <tr>
 </table>
<br>
<asp:Label Id="Lbl_info"   runat="server" visible="false" />
</form>
</td>
</tr>
</table>
</center>
</body>
</html>  



