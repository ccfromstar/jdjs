<% @  Control Language="c#" Inherits="PageAdmin.order_lst" %>
<form runat="server">
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1">当前位置：首页 &gt; <a href="/member/index.aspx?language=<%=Request.QueryString["language"]%>">会员中心</a> &gt; 订单明细</li>
<li class="uc_lanmu_site_2">订单明细</li>
</ul>
</div>
<div class="uc_lanmu_content">


 <table border="0" cellspacing="0" cellpadding="0" width="98%" align="center">
    <tr>
      <td height=25px style="font-weight:bold" > 订单号：<%=Request.QueryString["detailid"]%>[<a href='/order/orderview.aspx?orderid=<%=Request.QueryString["detailid"]%>' target='orderview'>查看</a>]</td> 
    </tr>
 </table>

 <table border="0" cellspacing="0"  align="center" class="member_table">
    <tr>
      <td align=center  class="memlist_header_item" width="5%">序号</td> 
      <td align=center  class="memlist_header_item" width="20%">产品名称</td> 
      <td align=center  class="memlist_header_item" width="10%">产品型号</td> 
      <td align=center  class="memlist_header_item" width="10%">订购数量</td> 
      <td align=center  class="memlist_header_item" width="10%">标价</td>
      <td align=center  class="memlist_header_item" width="10%">您的价格</td>
      <td align=center  class="memlist_header_item" width="10%">总计</td>
      <td align=center  class="memlist_header_item" width="10%">状态</td>
      <td align=center  class="memlist_header_item_last" width="10%">操作</td>
    </tr>
<asp:Repeater id="P1" runat="server" OnItemDataBound="P1_Bound">
 <ItemTemplate>
   <tr>
      <td align=center height="25px" class="memlist_item"><%#ItemIndex+1%></td> 
      <td align=center  class="memlist_item"><a href='/include/search.aspx?keycode=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"pdname").ToString())%>&type=1&language=<%#Request.QueryString["language"]%>' target="_blank"><%#DataBinder.Eval(Container.DataItem,"pdname")%></a>&nbsp;</td> 
      <td align=center  class="memlist_item"><%#DataBinder.Eval(Container.DataItem,"pdxinghao")%>&nbsp;</td> 
      <td align=center  class="memlist_item"><asp:TextBox id="Tb_Num" Text='<%#DataBinder.Eval(Container.DataItem,"pdnumber")%>' runat="server" size="3" maxlength="10"/></td> 
      <td align=center  class="memlist_item"><asp:Label id="Lb_Price" Text='<%#DataBinder.Eval(Container.DataItem,"price")%>' runat="server" /></td>
      <td align=center  class="memlist_item"><asp:Label id="Lb_MPrice" Text='<%#DataBinder.Eval(Container.DataItem,"mprice")%>' runat="server" /></td>
      <td align=center  class="memlist_item"><%#DataBinder.Eval(Container.DataItem,"tongji")%></td>
      <td align=center  class="memlist_item"><%#Get_PdState(DataBinder.Eval(Container.DataItem,"state").ToString())%></td>
      <td align=center class="memlist_item_last">
     <asp:LinkButton Text="修改" id="Edit" runat="server" CommandName='<%#ItemIndex%>'  OnCommand="Data_Update" />
     <asp:LinkButton Text="删除" id="Delete" runat="server" CommandName='<%#DataBinder.Eval(Container.DataItem,"id")%>' OnCommand="Data_Delete" />
     <asp:Label Id="Lb_Paystate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"paystate")%>' Visible="false" />
     <asp:Label Id="Lb_Id" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' Visible="false" />
    </td>
    </tr>
 </ItemTemplate>
</asp:Repeater>
 </table>
 <table border="0" cellspacing="0" cellpadding="0" width="98%" align="center">
   <tr>
      <td height=40px   align="left"> 配送费：￥<asp:Label id="Lb_send" runat="server" style="color:#ff0000;Font-Size:15px;font-weight:bold"/>元 &nbsp;&nbsp;&nbsp;总计：￥<asp:Label id="Lb_Tj"  runat="server"  style="color:#ff0000;Font-Size:15px;font-weight:bold"/>元
      &nbsp;<asp:Button Text="付 款" id="PayOrder" onclick="Pay_Order"  runat="server" cssclass="bt" /> 
  </td> 
   </tr>
   <tr>
      <td   align="center"><asp:label id="Lb_Empty" Text="此订单为空！" runat="server" visible="false" /></td> 
   </tr>
 </table>


</div>
</div>
</form>