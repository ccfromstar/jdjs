<% @ Page language="c#"  Inherits="PageAdmin.order1" %>
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

<asp:Panel id="Panel1" runat="server">
 <table border=0 cellpadding=0 cellspacing=0 width="98%" align="center">
        <tr>
         <td height=30 style="font-size:13px;font-weight:bold"><img src="/images/public/order.gif" width="30" height="25" align="absmiddle">以下是您当前订购的产品</td>
        </tr>
    </table>

    <table border=0 cellpadding=0 cellspacing=0 width="98%" align="center" class="order_header">
      <tr>
         <td height=30 width=25% align="center" class="order_header_text">产品名称</td>
         <td width=15% align="center"  class="order_header_text">产品型号</td>
         <td width=10% align="center"  class="order_header_text">标价</td>
         <td width=10% align="center"  class="order_header_text">您的价格</td>
         <td width=10% align="center"  class="order_header_text">订购数量</td>
         <td width=15% align="center"  class="order_header_text">总计</td>
         <td width=15% align="center"  class="order_header_text">产品状态</td>
        </tr>
      </table>

<asp:DataList id="DL_1" RepeatLayout="table" RepeatColumns="1" align="center" width="98%"  cellspacing="0" cellpadding="0" runat="server" >
   <ItemTemplate>  
      <table border=0 cellpadding="5" cellspacing="0" width=100% align="center" style="border-collapse:collapse">
        <tr>
         <td height=25 width=25% Class="order_style" ><a href='/include/search.aspx?keycode=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"pdname").ToString())%>&type=1&language=<%#Request.QueryString["language"]%>' target=blank><%#DataBinder.Eval(Container.DataItem,"pdname")%></a></td>
         <td width=15% align="center" Class="order_style" ><%#DataBinder.Eval(Container.DataItem,"pdxinghao")%></td>
         <td width=10%  align="center" Class="order_style" ><asp:Label Id="Price" Text='<%#DataBinder.Eval(Container.DataItem,"price")%>' runat="server" /></td>
         <td width=10%  align="center" Class="order_style" ><asp:Label Id="MPrice" Text='<%#DataBinder.Eval(Container.DataItem,"mprice")%>' runat="server" /></td>
         <td width=10%  align="center" Class="order_style" ><%#DataBinder.Eval(Container.DataItem,"pdnumber")%></td>
         <td width=15%  align="center" Class="order_style" ><%#DataBinder.Eval(Container.DataItem,"tongji")%></td>
         <td width=15%  align="center" Class="order_style" >待确定</td>
      </table>
      </ItemTemplate> 
</asp:DataList>

<table border=0 cellpadding=5 cellspacing=0 width="98%" align="center" >
      <tr>
         <td height=20 width=70% class="table_style"><b>总计：</b></td>
         <td width=15% align="center" class="table_style1" style="color:#ff0000;font-weight:bold"><asp:Label Id="LblTongji" runat="server"/>元</td>
         <td width=15% align="center" class="table_style1"> &nbsp;</td>
       </tr>
</table>
<br>
  <table border=0 cellpadding=0 cellspacing=0 width="98%" align="center">
        <tr>
         <td height=30 style="font-size:12px;font-weight:bold"><img src=/images/public/order_info.gif width=14px height=27px align=absmiddle hspace=5>输入个人信息确认</td>
        </tr>
   </table>
<script src="/js/order.js" type="text/javascript"></script>
  <table border=1 cellpadding=5 cellspacing="0" align="center" class="orderinfor_table">
        <tr>
         <td height=20 width=100px>联系人姓名：</td>
         <td height=20><input name="Name" id="Name" type="text" Maxlenght="25" class="si" value="<%=TrueName%>"></td>
        </tr>
        <tr>
         <td height=20>联系电话：</td>
         <td height=20><input id="Tel" name="Tel" type="text" Maxlenght="30" class="si"  value="<%=Tel%>"></td>
        </tr>
        <tr>
         <td height=20>省      份：</td>
         <td height=20>
<select name="Province" id="Province">
<option value="北京">北京</option>
<option value="重庆">重庆</option>
<option value="福建">福建</option>
<option value="甘肃">甘肃</option>
<option value="广东" selected>广东</option>
<option value="广西">广西</option>
<option value="贵州">贵州</option>
<option value="海南">海南</option>
<option value="河北">河北</option>
<option value="黑龙江">黑龙江</option>
<option value="河南">河南</option>
<option value="湖北">湖北</option>
<option value="湖南">湖南</option>
<option value="内蒙古">内蒙古</option>
<option value="安徽">安徽</option>
<option value="江苏">江苏</option>
<option value="江西">江西</option>
<option value="吉林">吉林</option>
<option value="辽宁">辽宁</option>
<option value="宁夏">宁夏</option>
<option value="青海">青海</option>
<option value="山西">山西</option>
<option value="陕西">陕西</option>
<option value="山东">山东</option>
<option value="上海">上海</option>
<option value="四川">四川</option>
<option value="天津">天津</option>
<option value="西藏">西藏</option>
<option value="新疆">新疆</option>
<option value="云南">云南</option>
<option value="浙江">浙江</option>
<option value="香港">香港</option>
<option value="澳门">澳门</option>
<option value="台湾">台湾</option>
<option value="其他">其他</option>
</select>
</td>
        </tr>

    <tr>
         <td height=20>所在城市：</td>
         <td height=20><input id="City" name="City" type="text" Maxlenght="15" class="si"  value="<%=City%>"></td>
     </tr>
    <tr>
         <td height=20>电子邮件：</td>
         <td height=20><input id="Email" name="Email" type="text" Maxlenght="30" class="si" value="<%=Email%>"></td>
       </tr>
    <tr>
         <td height=20>邮编：</td>
         <td height=20><input name="PostCode" id="PostCode" type="text" Maxlenght="6" class="si" value="<%=PostCode%>"></td>
       </tr>
    <tr>
         <td height=20>详细地址：</td>
         <td height=20><input name="Address" id="Address" type="text" Maxlenght="50" class="si" style="width:300px" value="<%=Address%>"></td>
       </tr>
    <tr>
         <td height=20 width=120>其他说明：</td>
         <td height=20><textarea id="Beizhu" name="Beizhu"  cols=50 rows=4></textarea></td>
       </tr>
   </table>

<table border=0 cellpadding=5 cellspacing=0 width="98%" align="center" >
<tr><td  width=100% style="color:#F00000">
<b>注意:</b>
<br>&nbsp;&nbsp;以上费用不包含产品配送费用。
<br>&nbsp;&nbsp;以上个人资料务必填写正确，虚假信息将直接作无效订单处理。
</td></tr>
<tr><td  width=100% style="color:#ff0000">
<hr width=100% size=1 color=#cccccc style="border-style:dotted;height:1">
</td></tr>
</table>
<table border=0 cellpadding=0 cellspacing=0 width="98%" align="center" >
<tr><td height=25 width=100% align=right>
<asp:Button  Text=" 返回修改 "    onclick="Car_Back" runat="server"  CssClass="bt1" /> &nbsp;
<asp:Button  Text=" 确定提交 "    id="Submit" onclick="Order_Add"  runat="server" CssClass="bt1" />&nbsp;
</tr>
</table>
</asp:Panel>
</form>
</div>
</div>
</div>

<aspcn:uc_bottom   id="uc_bottom" runat="server" />