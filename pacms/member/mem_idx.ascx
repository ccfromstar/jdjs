<% @  Control Language="c#" Inherits="PageAdmin.mem_idx"%>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1">当前位置：首页 &gt; 会员中心</li>
<li class="uc_lanmu_site_2">会员中心</li>
</ul>
</div>
<div class="uc_lanmu_content">

<div>您好：<span style="color:#ff0000"><%=TrueName%></span>，欢迎您登陆会员中心!</div><br>
<table border=0 cellpadding="5px"  align="center" class="mem_idx_table">
  <tr>
    <td width="15%"  align="right">用户名：</td><td width="35%"><%=UserName%></td>
    <td width="15%"  align="right">会员类别：</td><td width="35%"><%=Mem_type%></td>
  </tr>


  <asp:PlaceHolder  id="P1" runat="server" Visible="false" >
  <tr>
    <td width="15%" align="right">可用金额：</td><td width="35%"><%=Fnc_Ky%>元</td>
    <td width="15%"  align="right">入款总额：</td><td width="35%"><%=Fnc_Rk%>元</td>
  </tr>
  <tr>
    <td width="15%" align="right">消费金额：</td><td width="35%"><%=Fnc_Xf%>元</td>
    <td width="15%"  align="right">返款总额：</td><td width="35%"><%=Fnc_Fk%>元</td>
  </tr>
  </asp:PlaceHolder>

  <asp:PlaceHolder  id="P2" runat="server" Visible="false" >
  <tr>
    <td width="15%" align="right">未付订单数：</td><td width="35%"><%=Order_NoPay%>条</td>
    <td width="15%"  align="right">已付订单数：</td><td width="35%"><%=Order_Pay%>条</td>
  </tr>
  </asp:PlaceHolder>

  <asp:PlaceHolder  id="P3" runat="server" Visible="false" >
  <tr>
    <td width="15%" align="right">待审核产品：</td><td width="35%"><%=Product_NoCheck%>篇</td>
    <td width="15%"  align="right">已审核产品：</td><td width="35%"><%=Product_Checked%>篇</td>
  </tr>
  </asp:PlaceHolder>

  <asp:PlaceHolder  id="P4" runat="server" Visible="false" >
  <tr>
    <td width="15%" align="right">待审核文章：</td><td width="35%"><%=Article_NoCheck%>篇</td>
    <td width="15%"  align="right">已审核文章：</td><td width="35%"><%=Article_Checked%>篇</td>
  </tr>
  </asp:PlaceHolder>

  <asp:PlaceHolder  id="P5" runat="server" Visible="false" >
  <tr>
    <td width="15%" align="right">待复留言：</td><td width="35%"><%=Feedback_NoReplay%>条</td>
    <td width="15%"  align="right">已复留言：</td><td width="35%"><%=Feedback_Replay%>条</td>
  </tr>
  </asp:PlaceHolder>

  <tr>
    <td width="15%" align="right">注册时间：</td><td width="35%"><%=Reg_Date%></td>
    <td width="15%"  align="right">最后登陆时间：</td><td width="35%"><%=Last_Date%></td>
  </tr>
</table> 

</div>
</div>