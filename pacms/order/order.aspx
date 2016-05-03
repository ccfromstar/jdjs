<% @ Page language="c#"  Inherits="PageAdmin.order" %>
<% @ Register TagPrefix="aspcn" TagName="uc_top" src="~/incs/web_top.ascx" %>
<% @ Register TagPrefix="aspcn" TagName="uc_banner" src="~/incs/banner.ascx" %>
<% @ Register TagPrefix="aspcn" TagName="uc_bottom" src="~/incs/web_bottom.ascx" %>
<aspcn:uc_top    runat="server" />
<aspcn:uc_banner  runat="server" id="default" thetype="default"/>
<div class="lanmu_box" id="sublanmu_box">
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1">购物车</li>
<li class="uc_lanmu_site_2">当前位置：首页 &gt; 购物车</li>
</ul>
</div>
<div class="uc_lanmu_content">
<form runat="server">

 <table border=0 cellpadding=0 cellspacing=0 width="98%" align="center">
        <tr>
         <td height=30 style="font-size:13px;font-weight:bold"><img src="/images/public/order.gif" width="30" height="25" align="absmiddle">以下是您当前订购的产品</td>
        </tr>
    </table>

    <table border=0 cellpadding=0 cellspacing=0 width="98%" align="center" class="order_header">
      <tr>
         <td height=30 width=25% align="center" class="order_header_text">产品名称</td>
         <td width=10% align="center"  class="order_header_text">产品型号</td>
         <td width=10% align="center"  class="order_header_text">标价</td>
         <td width=10% align="center"  class="order_header_text">您的价格</td>
         <td width=10% align="center"  class="order_header_text">订购数量</td>
         <td width=15% align="center"  class="order_header_text">总计</td>
         <td width=20% align="center"  class="order_header_text">操作</td>
        </tr>
      </table>

<asp:DataList id="DL_1" RepeatLayout="table" RepeatColumns="1" align="center" width="98%"  cellspacing="0" cellpadding="0" runat="server" 
 OnItemDataBound="dtl_Bind" OnEditCommand="Update_Number">
   <ItemTemplate>  
      <table border=0 cellpadding="5" cellspacing="0" width=100% align="center" style="border-collapse:collapse">
        <tr>
         <td height=25 width=25% Class="order_style" ><a href='/include/search.aspx?keycode=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"pdname").ToString())%>&type=1&language=<%#Request.QueryString["language"]%>' target=blank><%#DataBinder.Eval(Container.DataItem,"pdname")%></a></td>
         <td width=10% align="center" Class="order_style" ><%#DataBinder.Eval(Container.DataItem,"pdxinghao")%></td>
         <td width=10%  align="center" Class="order_style" ><asp:Label Id="Price" Text='<%#DataBinder.Eval(Container.DataItem,"price")%>' runat="server" /></td>
         <td width=10%  align="center" Class="order_style" ><asp:Label Id="MPrice" Text='<%#DataBinder.Eval(Container.DataItem,"mprice")%>' runat="server" /></td>
         <td width=10%  align="center" Class="order_style" ><asp:TextBox id="TbPdnumber" maxlength="4" size="4"  Text='<%#DataBinder.Eval(Container.DataItem,"pdnumber")%>' runat="server" /></td>
         <td width=15%  align="center" Class="order_style" ><%#DataBinder.Eval(Container.DataItem,"tongji")%></td>
         <td width=20%  align="center" Class="order_style" >
<asp:Label Id="CurrentId" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' Visible="false" />
<asp:LinkButton Text="修改数量"  id="Edit"    CommandName="Edit"    runat="server" style="Text-decoration:underline"/>&nbsp;
<asp:LinkButton Text="删除"      id="Delete"   OnCommand="Data_Delete"   CommandName='<%#DataBinder.Eval(Container.DataItem,"id")%>'  runat="server" style="Text-decoration:underline"/> 
</td>
      </table>
      </ItemTemplate> 
</asp:DataList>

<asp:Panel id="Panel1" runat="server" >
<table border=0 cellpadding=5 cellspacing=0 width="98%" align="center" >
      <tr>
         <td height=25 width=100% class="table_style" align="center" >您的购物车中还没有订购记录。</td>
       </tr>
</table>
</asp:Panel>

<table border=0 cellpadding=5 cellspacing=0 width="98%" align="center" >
      <tr>
         <td height=20 width=65% class="table_style"><b>总计：</b></td>
         <td width=15% align="center" class="table_style1" style="color:#ff0000;font-weight:bold"><asp:Label Id="LblTongji" runat="server"/>元</td>
         <td width=20% align="center" class="table_style1"> &nbsp;</td>
       </tr>
</table>
<br>
<asp:Panel id="Panel2" runat="server" >

<table border=0 cellpadding=5 cellspacing=0 width="98%" align="center" >
<tr><td height=25 width=100% align=right>
<input type="button" value=" 继续订购 " onclick="location.href='/index.aspx'" class="bt1"> &nbsp;
<asp:Button  Text=" 提交订单 "  Id="Tijiao"   onclick="Show_Info"   runat="server" CssClass="bt1" />&nbsp;
</tr>
</table>
</asp:Panel>
</form>
</div>
</div>
</div>
<aspcn:uc_bottom   id="uc_bottom" runat="server" />