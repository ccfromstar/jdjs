<% @  Control Language="c#" Inherits="PageAdmin.order_idx" %>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1">当前位置：首页 &gt; <a href="/member/index.aspx?language=<%=Request.QueryString["language"]%>">会员中心</a> &gt; 我的订单</li>
<li class="uc_lanmu_site_2">我的订单</li>
</ul>
</div>
<div class="uc_lanmu_content">

<form runat="server">
 <table border="0" cellspacing="0" cellpadding="0" align="center" class="member_table">
    <tr>
      <td align=center  class="memlist_header_item" width="5%">序号</td> 
      <td align=center  class="memlist_header_item" width="35%">订单号</td> 
      <td align=center  class="memlist_header_item" width="10%">付款状态</td> 
      <td align=center  class="memlist_header_item" width="10%">发货状态</td> 
      <td align=center  class="memlist_header_item" width="20%">订购日期</td>
      <td align=center  class="memlist_header_item_last" width="20%">操作</td>
    </tr>
<asp:Repeater id="P1" runat="server" OnItemDataBound="P1_Bound">
 <ItemTemplate>
   <tr>
      <td align=center height="25px" class="memlist_item"><%=i++%></td> 
      <td align=center class="memlist_item"><a href='/order/orderview.aspx?orderid=<%#DataBinder.Eval(Container.DataItem,"orderid")%>' target='orderview'><%#DataBinder.Eval(Container.DataItem,"orderid")%></a></td> 
      <td align=center class="memlist_item"><asp:Image src="/images/public/state_1.gif" title="付款状态:已付款" runat="server" CssClass="order_state_image" visible='<%#Get_State(DataBinder.Eval(Container.DataItem,"paystate").ToString())%>'/>  <asp:Image  title="付款状态:未付款"  src="/images/public/state_0.gif" runat="server" CssClass="order_state_image"   visible='<%#!Get_State(DataBinder.Eval(Container.DataItem,"paystate").ToString())%>'/></td> 
      <td align=center class="memlist_item"><asp:Image src="/images/public/state_1.gif" title="发货状态:已发货" runat="server" CssClass="order_state_image"  visible='<%#Get_State(DataBinder.Eval(Container.DataItem,"sendstate").ToString())%>'/> <asp:Image title="发货状态:未发货" src="/images/public/state_0.gif" runat="server" CssClass="order_state_image"  visible='<%#!Get_State(DataBinder.Eval(Container.DataItem,"sendstate").ToString())%>'/></td> 
      <td align=center class="memlist_item"><%#DataBinder.Eval(Container.DataItem,"thedate","{0:yyyy-MM-dd}")%></td>
      <td align=center class="memlist_item_last">
     <asp:HyperLink Text="管理" id="Hy_List" runat="server" NavigateUrl='<%#Get_Url("mem_odlst",DataBinder.Eval(Container.DataItem,"orderid").ToString())%>' />&nbsp;
     <asp:LinkButton Text="删除" id="Delete" runat="server" CommandName='<%#DataBinder.Eval(Container.DataItem,"orderid")%>' OnCommand="Data_Delete" />
     <asp:Label Id="Lb_Paystate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"paystate")%>' Visible="false" />
    </td>
    </tr>
 </ItemTemplate>
</asp:Repeater>
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
