<% @ Page Language="C#" Inherits="PageAdmin.feedback_2" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="business_4"  /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>留言查看</b></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top  align="left">
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
<form runat="server" >
  <td valign=top>
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  width=50% height=25><b>留言反馈查看</b></td>
  <td width=50%  height=25 align=right></td>
 </tr>
</table>

<table border=0 cellpadding="5px" cellspacing="0" width=95% align=center class=tablestyle style="table-layout:fixed;">
      <tr>
         <td height=20 class=white colspan=2 class="tdstyle">主题：<asp:Label id="Lbtitle" runat="server" /></td>
       </tr>
</table>
<table border=0 cellpadding="5px" cellspacing="0" width=95% align=center class=tablestyle style="table-layout:fixed;">
       <tr> 
         <td  class="tdstyle" height=20 align=left width="120px">用户资料：</td>
         <td  class="tdstyle">
         会员：<asp:Label id="Username" runat="server" /> &nbsp;&nbsp;
         联系人：<asp:Label id="Name" runat="server" /> &nbsp;&nbsp;
         电话：<asp:Label id="Tel" runat="server" /> &nbsp;&nbsp;
         Email：<asp:Label id="Email" runat="server" /> &nbsp;&nbsp;
        </td>
       </tr>
      <tr>
        <td  class="tdstyle" align=let width="120px"><asp:Label id="Type" runat="server" />：</td>
        <td class="tdstyle"><asp:Label id="Content" runat="server" />
          <div align=right>发布时间：<asp:Label id="TheDate" runat="server" />&nbsp;</div></td>
      </tr>
</table>

<br>

<asp:Repeater id="P1" runat="server"  OnItemDataBound="P1_Bind">
     <ItemTemplate>
     <table border=0 cellpadding=5 cellspacing=0 width=95% align=center class="tablestyle" style="table-layout:fixed;">
      <tr>
        <td  align=let width="120px" class="tdstyle"><%#DataBinder.Eval(Container.DataItem,"replayuser")%></td>
        <td class="tdstyle" style="padding:5px 5px 5px 5px">
           <%#ubb(DataBinder.Eval(Container.DataItem,"replay").ToString())%>
           <div align=right>
<asp:LinkButton runat="server"  CommandName='<%#DataBinder.Eval(Container.DataItem,"id")%>' onCommand="PageAdmin_Replay_Edit" >[修改]</asp:LinkButton>&nbsp;
<asp:LinkButton runat="server" CommandName='<%#DataBinder.Eval(Container.DataItem,"id")%>' id="Delete" onCommand="PageAdmin_Replay_Delete" >[删除]</asp:LinkButton>&nbsp;
发布时间：<%#DataBinder.Eval(Container.DataItem,"thedate")%>&nbsp;
</div>
        </td>
      </tr>
     </table><br>
     </ItemTemplate>
</asp:Repeater>

<table border=0 cellpadding=5 cellspacing=0 width=95% align=center class=tablestyle style="table-layout:fixed;">
      <tr>
        <td  align=lett width="120px" class="tdstyle">用户回复：</td>
       <td   align=center class="tdstyle"><asp:TextBox id="Replay" TextMode="MultiLine" runat="server" columns=80 rows=5/><asp:Label id="Lbl_id" runat="server" Visible="false"/>
</td>
      </tr>
</table>

<table border=0 cellpadding=5 cellspacing=1 width=95% align=center>
      <tr>
        <td height=25  align=center>
          <asp:Button Text=" 修改 " Cssclass="button" Runat="server" id="Bt_Update" onclick="PageAdmin_Data_Update" Visible="false" />
          <asp:Button Text=" 取消 " Cssclass="button" Runat="server" id="Bt_Cancel" onclick="PageAdmin_Data_Cancel" Visible="false" />
          <asp:Button Text=" 提交 " Cssclass="button" Runat="server" id="Bt_Add"  onclick="PageAdmin_Data_Add"    Visible="true"/>
          <input type="button"    value="返回"     class="button" onclick="location.href='feedback_1.aspx?username=<%=Request.QueryString["username"]%>&replay=<%=Request.QueryString["replay"]%>'"/>
       </td>
     </tr>
</table>

</td>
</tr>
</form>
</table>

</center>
</body>
</html> 