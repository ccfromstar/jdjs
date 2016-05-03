<% @  Control Language="c#" Inherits="PageAdmin.mem_pricelist" %>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1">当前位置：首页 &gt; <a href="/member/index.aspx?language=<%=Request.QueryString["language"]%>">会员中心</a> &gt; 产品价格</li>
<li class="uc_lanmu_site_2">产品价格</li>
</ul>
</div>
<div class="uc_lanmu_content">
<form runat="server">

 <table border="0" cellspacing="0" cellpadding="0" width="98%" align="center">
    <tr><td align=right height=25px>分类显示：<asp:DropDownList id="DLprod1" AutoPostBack="true"  OnSelectedIndexChanged="DLprod1_Change" DataTextField="sort_name"  DataValueField="id"   runat="server" />
<asp:DropDownList id="DLprod2" AutoPostBack="true"  OnSelectedIndexChanged="DLprod2_Change"  DataTextField="sort_name"  DataValueField="id"   runat="server" visible="false" />
    </td></tr>
   </table> 

 <table border="0" cellspacing="0" cellpadding="0" align="center" class="member_table">
    <tr>
      <td align=center  class="memlist_header_item" width="30%">品名</td> 
      <td align=center  class="memlist_header_item" width="15%">型号</td> 
      <td align=center  class="memlist_header_item" width="20%">标价</td> 
      <td align=center  class="memlist_header_item" width="20%">您的价格</td>
      <td align=center  class="memlist_header_item_last" width="15%">订购</td>
    </tr>
<asp:Repeater id="P1" runat="server">
 <ItemTemplate>
   <tr>
      <td align=center class="memlist_item"><a href='<%#GetUrl(DataBinder.Eval(Container.DataItem,"lanmu1id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu3id").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString())%>' target="_blank"><%#Server.HtmlEncode(DataBinder.Eval(Container.DataItem,"name").ToString())%></a></td> 
      <td align=center class="memlist_item"><%#Server.HtmlEncode(DataBinder.Eval(Container.DataItem,"xinghao").ToString())%></td> 
      <td align=center class="memlist_item"><%#DataBinder.Eval(Container.DataItem,"price")%> <%#DataBinder.Eval(Container.DataItem,"price_unit")%></td> 
      <td align=center class="memlist_item"><%#Get_Price(DataBinder.Eval(Container.DataItem,"mprice").ToString(),DataBinder.Eval(Container.DataItem,"price").ToString())%><%#DataBinder.Eval(Container.DataItem,"price_unit")%></td>
      <td align=center class="memlist_item_last"><a href='/order/order.aspx?prodid=<%#DataBinder.Eval(Container.DataItem,"id")%>&language=<%#DataBinder.Eval(Container.DataItem,"planguage")%>' target="order">订购</a></td>
    </tr>
 </ItemTemplate>
</asp:Repeater>
 </table>

<asp:Panel id="Page_panel" runat="server">
<div class="uc_lanmu_page" >
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