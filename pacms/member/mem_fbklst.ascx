<% @  Control Language="c#" Inherits="PageAdmin.mem_fbklst" %>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1">当前位置：首页 &gt; <a href="/member/index.aspx?language=<%=Request.QueryString["language"]%>">会员中心</a> &gt; 我的留言</li>
<li class="uc_lanmu_site_2">我的留言</li>
</ul>
</div>
<div class="uc_lanmu_content">
<form runat="server">
 <table border="0" cellspacing="0" cellpadding="0" width="98%" align="center">
    <tr>
      <td align=right  height=25px><input type="button" class='m_bt' value="发布留言" onclick="location.href='<%=Get_Url("mem_fbk")%>'"></td> 
    </tr>
   </table> 
 <table border="0" cellspacing="0" cellpadding="0" align="center" class="member_table">
    <tbody>
    <tr>
      <td align=center  class="memlist_header_item" width="10%">类型</td> 
      <td align=center  class="memlist_header_item" width="45%">主题</td> 
      <td align=center  class="memlist_header_item" width="20%">发布日期</td> 
      <td align=center  class="memlist_header_item" width="10%">状态</td>
      <td align=center  class="memlist_header_item_last" width="15%">操作</td>
    </tr>
<asp:Repeater id="P1" runat="server" OnItemDataBound="P1_Bound">      
 <ItemTemplate>
       <tr>
      <td align=center  class="memlist_item"><%#DataBinder.Eval(Container.DataItem,"type")%></td> 
      <td   class="memlist_item"><a href="<%#Get_Url("mem_fbkdtl",DataBinder.Eval(Container.DataItem,"id").ToString())%>"><%#DataBinder.Eval(Container.DataItem,"title")%></a></td> 
      <td align=center  class="memlist_item"><%#DataBinder.Eval(Container.DataItem,"thedate")%></td> 
      <td align=center  class="memlist_item"><%#Get_State(DataBinder.Eval(Container.DataItem,"replay").ToString())%></td>
      <td align=center  class="memlist_item_last">
       <a href="<%#Get_Url("mem_fbkdtl",DataBinder.Eval(Container.DataItem,"id").ToString())%>">详细</a></a>
       <asp:LinkButton Text="删除" id="Delete" runat="server" CommandName='<%#DataBinder.Eval(Container.DataItem,"id")%>' OnCommand="Data_Delete" />
      </td>
    </tr>
 </ItemTemplate>
</asp:Repeater>
   </tbody>
   </table> 

<asp:Panel id="Page_panel" runat="server">
<div class="uc_lanmu_page">
共<asp:Label id="Lblrecordcount"  Text=0 runat="server" />条记录 
&nbsp;当前页次: <asp:Label id="Lblcurrentpage"  runat="server" />/<asp:Label id="LblpageCount"  runat="server" />&nbsp;
         <asp:LinkButton id="First" CssClass="link" CommandName="First"  OnCommand="Page_change"  runat="server" Text="首页"/>&nbsp;
         <asp:LinkButton id="Prev"  CssClass="link"  CommandName="Prev"  OnCommand="Page_change"  runat="server" Text="上一页"/>&nbsp;
         <asp:LinkButton id="Next"  CssClass="link"  CommandName="Next"  OnCommand="Page_change"  runat="server" Text="下一页"/>&nbsp;
         <asp:LinkButton id="Last"  CssClass="link"  CommandName="Last"  OnCommand="Page_change"  runat="server" Text="尾页"/>&nbsp;
       转到：<asp:DropDownList id="Dp_page" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Page_select">
          </asp:DropDownList>页
</div>
</asp:Panel>
</form>
</div>
</div>
