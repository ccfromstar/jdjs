<% @  Control Language="c#" Inherits="PageAdmin.mem_fbkdtl" %>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1">当前位置：首页 &gt; <a href="/member/index.aspx?language=<%=Request.QueryString["language"]%>">会员中心</a> &gt; 留言查看</li>
<li class="uc_lanmu_site_2">留言查看</li>
</ul>
</div>
<div class="uc_lanmu_content">
<form runat="server">
<table border="0" cellpadding="0" cellspacing="0" width="98%" align="center">
 <tr>
  <td><b>主题：</b><asp:Label id="Lb_fd_title" runat="server" /></td>
 </tr>
</table>
 <table border="0" cellpadding="0" cellspacing="0" align="center"  class="member_table">
 <tr>
  <td width="130px" class="feedback_detail_item"><asp:Label id="Lb_fd_username" runat="server" /><p><asp:Label id="Lb_fd_date" runat="server" /></p></td>
  <td class="feedback_detail_item_last"><asp:Label id="Lb_feedback" runat="server" /></td>
 </tr>
<asp:Repeater id="P1" runat="server">
 <ItemTemplate>
  <tr>
   <td   class="feedback_replay_item"><%#DataBinder.Eval(Container.DataItem,"replayuser")%><p><%#DataBinder.Eval(Container.DataItem,"thedate")%></p></td>
   <td   class="feedback_replay_item_last"><%#ubb(DataBinder.Eval(Container.DataItem,"replay").ToString())%></td>
 </tr>
 </ItemTemplate>
</asp:Repeater>
 </table>
<br>

<table border=0 cellpadding=0 cellspacing=0 align=center class="member_table">
  <tr>
   <td width="130px" class="feedback_replay_style" align="center">反馈补充<br><asp:RequiredFieldValidator id="rfv4" ControlToValidate="Tb_Replay" display="Dynamic" type="integer"  runat="server">请输入内容!</asp:RequiredFieldValidator></td></td>
   <td  class="feedback_replay_style_last">
     <asp:TextBox id="Tb_Replay" Textmode="multiLine" Columns="55" rows="6" runat="server" />
 </tr>
  <tr>
    <td colspan="2" class="feedback_replay_style_1"  align="center">
    <asp:Button CssClass="bt" Text="提交" Onclick="PageAdmin_Data_Add" runat="server" />
    <input type="button"  class="bt" value="返回" onclick="location.href='<%=Get_Url("mem_fbklst")%>'">
   </td>
   </tr>
 </table>
<br>
</form>
</div>
</div>
