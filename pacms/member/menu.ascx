<% @ Control  language="c#"  Inherits="PageAdmin.mem_menu" %>
<asp:PlaceHolder id="P_meminfo" runat="server" Visible="false">
<div class="nav_box"  style="margin:0 0 5px 0">
<div class="nav_title"><span class="nav_sign">用户资料</span></div>
<div class="nav_content">
会员名：<%=UserName%><br>
类&nbsp;&nbsp;别：<%=Member_Type%><br>
<a href="<%=Get_Url("index")%>" class="logined_href">会员中心</a>&nbsp;&nbsp;<%if(Request.Cookies["order"]!=null){%><a href='/order/order.aspx?language=cn' class='logined_href' target="order">我的购物车</a>&nbsp;&nbsp;<%}%><a href="<%=Get_Url("exit")%>" class="logined_href">注销退出</a>
</div>
</div>
</asp:PlaceHolder>

<div class="nav_box">
<div class="nav_title"><span class="nav_sign">会员菜单</span></div>
<div class="nav_menu">
 <ul>
  <asp:PlaceHolder  id="P_message" runat="server" Visible="false">
  <li class="nav_menu_list"><a href="<%=Get_Url("mem_msg")%>" class="nav_menu_href">站内信息</a></li>
  </asp:PlaceHolder>

  <asp:PlaceHolder  id="P_order" runat="server" Visible="false" >
  <li class="nav_menu_list"><a href="<%=Get_Url("mem_odidx")%>" class="nav_menu_href">我的订单</a></li>
  </asp:PlaceHolder>

  <asp:PlaceHolder  id="P_pricelist" runat="server" Visible="false" >
  <li class="nav_menu_list"><a href="<%=Get_Url("mem_pricelist")%>" class="nav_menu_href">价格总览</a> </li>
  </asp:PlaceHolder>

  <asp:PlaceHolder  id="P_fnc" runat="server" Visible="false" >
  <li class="nav_menu_list"><a href="<%=Get_Url("mem_fncidx")%>" class="nav_menu_href">我的财务</a> </li>
  </asp:PlaceHolder>

  <asp:PlaceHolder  id="P_onlinepay" runat="server" Visible="false" >
   <li class="nav_menu_list"><a href="<%=Get_Url("mem_pay")%>" class="nav_menu_href">在线支付</a></li>
  </asp:PlaceHolder>

  <asp:PlaceHolder  id="P_prod" runat="server" Visible="false" >
  <li class="nav_menu_list"><a href="<%=Get_Url("mem_prodlst")%>" class="nav_menu_href">我的产品</a></li>
  </asp:PlaceHolder>

  <asp:PlaceHolder  id="P_article" runat="server" Visible="false" >
  <li class="nav_menu_list"><a href="<%=Get_Url("mem_articlelst")%>" class="nav_menu_href">我的文章</a></li>
  </asp:PlaceHolder>

  <asp:Repeater id="P_zdyform" runat="server" Visible="false">
  <ItemTemplate>
     <li class="nav_menu_list"><a href="<%#Get_Url("mem_fmlst",DataBinder.Eval(Container.DataItem,"id").ToString())%>" class=left><%#DataBinder.Eval(Container.DataItem,"name")%></a><br></span>
  </ItemTemplate>
  </asp:Repeater>

  <asp:PlaceHolder  id="P_fbk" runat="server" Visible="false" >
  <li class="nav_menu_list"><a href="<%=Get_Url("mem_fbklst")%>"  class="nav_menu_href">我的留言</a></li>
 </asp:PlaceHolder>

  <asp:PlaceHolder  id="P_mdy" runat="server" Visible="false" >
  <li class="nav_menu_list"><a href="<%=Get_Url("pass_mdy")%>" class="nav_menu_href">重设密码</a></li>
  <li class="nav_menu_list"><a href="<%=Get_Url("mem_mdy")%>" class="nav_menu_href">资料修改</a></li>
 </asp:PlaceHolder>

 <asp:PlaceHolder  id="P_reg" runat="server">
  <li class="nav_menu_list"><a href="<%=Get_Url("reg")%>" class="nav_menu_href">会员注册</a></li>
  <li class="nav_menu_list"><a href="<%=Get_Url("login")%>" class="nav_menu_href">会员登陆</a></li>
  <li class="nav_menu_list"><a href="<%=Get_Url("find_pass")%>" class="nav_menu_href">找回密码</a></li>
 </asp:PlaceHolder>

 </ul>
</div>

</div>

