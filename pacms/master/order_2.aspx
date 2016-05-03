<% @ Page Language="C#" Inherits="PageAdmin.order_2" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="business_1" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>订单查看</b></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top  align="left">

<form runat="server" >
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  width=50% height=25><b>订单查看</b></td>
  <td width=50%  height=25 align=right></td>
 </tr>
</table>
  <table border=0 cellpadding=5 cellspacing=0 width=95% align=center>
    <tr>
      <td height=25 width=20%>No：</span><asp:Label id="Lblorderid" runat="server"/></span></td>
     <td height=25 width=60% align=center style="font-size:16;font-weight:bold;text-decoration:underline">订 购 单</td>
      <td height=25 width=20% align=right><span style="font-size:13">订单日期：<asp:Label id="Thedate" runat="server" /></td>
    </tr>
  </table>
   <table border=0 cellpadding=5 cellspacing=0 width=95% align=center>
    <tr>
      <td height=25 width=70%>
收款状态：
<asp:DropDownList id="PayState" runat="server">
<asp:ListItem value="0">未付款</asp:ListItem>
<asp:ListItem value="1">已付款</asp:ListItem>
</asp:DropDownList>

发货状态：
<asp:DropDownList id="SendState" runat="server">
<asp:ListItem value="0">待处理</asp:ListItem>
<asp:ListItem value="1">已发货</asp:ListItem>
</asp:DropDownList>
操作员：<asp:TextBox id="ChargeName" runat="server" Size="15"/>
 <asp:RequiredFieldValidator  ControlToValidate="ChargeName" display="Dynamic" type="integer" runat="server">
请输入操作员人姓名</asp:RequiredFieldValidator>
</td>
     <td height=25 width=30% align=center></td>

    </tr>
  </table>
    <table border=0 cellpadding=0 cellspacing=1 width=95% align=center class=tablestyle >
      <tr>
         <td width=25% height=20px align=center class=white>产品名称</td>
         <td width=15% align=center class=white>产品型号</td>
         <td width=10% align=center class=white>订购数量</td>
         <td width=10% align=center class=white>标价</td>
         <td width=10% align=center class=white>会员价</td>
         <td width=15% align=center class=white>总计</td>
         <td width=15% align=center class=white>产品状态</td>
        </tr>
      </table>
<asp:DataList id="DL_1" RepeatLayout="table" RepeatColumns="1" align="center" width="100%"  cellspacing=0 cellpadding=0 runat="server" >
   <ItemTemplate>  
      <table border=0 cellpadding=5 cellspacing=0 width=95% align=center class=tablestyle >
        <tr bgcolor="#ffffff">
         <td width=25% class=tdstyle><a href='/include/search.aspx?keycode=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"pdname").ToString())%>&type=1' target=blank><%#DataBinder.Eval(Container.DataItem,"pdname")%></a></td>
         <td width=15% class=tdstyle><%#DataBinder.Eval(Container.DataItem,"pdxinghao")%></td>
         <td width=10%   align=center class=tdstyle><asp:Label Id="Pdnumber" Text='<%#DataBinder.Eval(Container.DataItem,"pdnumber")%>' runat="server"  /></td>
         <td width=10%   align=center class=tdstyle><asp:TextBox Id="Price" Text='<%#DataBinder.Eval(Container.DataItem,"price")%>' runat="server" size="5" /> 元</td>
         <td width=10%   align=center class=tdstyle><asp:TextBox Id="MPrice" Text='<%#DataBinder.Eval(Container.DataItem,"mprice")%>' runat="server" size="5" /> 元</td>
         <td width=15%   align=center class=tdstyle><%#DataBinder.Eval(Container.DataItem,"tongji")%>元</td>
         <td width=15%   align=center class=tdstyle>
<asp:Label Id="PdId" Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server" visible="false" />
<asp:DropDownList id="PdState" runat="server">
<asp:ListItem value="0">未确定</asp:ListItem>
<asp:ListItem value="-1">缺货</asp:ListItem>
<asp:ListItem value="1">正常</asp:ListItem>
</asp:DropDownList>
</td>
 </tr>
      </table>
      </ItemTemplate> 
</asp:DataList>
<table border=0 cellpadding=5 cellspacing=0 width=95% align=center class=tablestyle>
      <tr>
         <td height=30 class=tdstyle>产品总价：<span  style="color:#ff0000"><asp:Label Id="ProdTongji" runat="server"/>元</span></td>
       </tr>
      <tr>
         <td height=30 class=tdstyle>配送费用：<asp:TextBox Id="SendExpense" runat="server" size="5" /> 元</td>
       </tr>
      <tr>
         <td height=30 class=tdstyle >总费用：<span  style="color:#ff0000"><asp:Label Id="LblTongji" runat="server"/>元</span></td>
       </tr>
</table>
<br>
<table border=0 cellpadding=5 cellspacing=0 width=95% align=center  class=tablestyle>
      <tr>
         <td height=20 class=white colspan=2 align=center>订购人信息</td>
       </tr>
      <tr>
         <td height=20  width=120 class=tdstyle>会员号：</td><td class=tdstyle><a href='member_info.aspx?username=<%=UserName%>'><%=UserName%></a></td>
       </tr>
      <tr>
         <td height=20  width=120 class=tdstyle>联系人姓名：</td><td class=tdstyle><asp:Label id="LbName" runat="server" /></td>
       </tr>
      <tr>
         <td height=20 class=tdstyle>联系人电话：</td><td class=tdstyle><asp:Label id="LbTel" runat="server" /></td>
       </tr>
      <tr>
         <td height=20 class=tdstyle>省份：</td><td class=tdstyle><asp:Label id="LbProvince" runat="server" /></td>
       </tr>
      <tr>
         <td height=20 class=tdstyle>城市：</td><td class=tdstyle><asp:Label id="LbCity" runat="server" /></td>
       </tr>
      <tr>
         <td height=20 class=tdstyle>电子邮件：</td><td class=tdstyle><asp:Label id="LbEmail" runat="server" /></td>
       </tr>
      <tr>
         <td height=20 class=tdstyle>邮编：</td><td class=tdstyle><asp:Label id="LbPostcode" runat="server" /></td>
       </tr>
      <tr>
         <td height=20 class=tdstyle>详细地址：</td><td class=tdstyle><asp:Label id="LbAddress" runat="server" /></td>
       </tr>
      <tr>
         <td height=20 class=tdstyle>备注：</td><td class=tdstyle><asp:Label id="LbBizhu"  runat="server" /></td>
       </tr>
      <tr>
         <td height=20 class=tdstyle>回复：</td><td class=tdstyle><asp:TextBox id="LbBizhu1" TextMode="multiline" Columns="60" rows="4"  runat="server" /></td>
       </tr>
</table>
<br>
<div align=center>
<asp:Button Text="修改" runat="server" CssClass="button" Onclick="PageAdmin_Update_order" />
<input type="button" class=button  value="返回"  onclick="location.href='order_1.aspx?username=<%=Request.QueryString["username"]%>'">

</div>
</form>
</td>
</tr>
</table>
</center>
</body>
</html>  