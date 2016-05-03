<% @ Page Language="C#"  Inherits="PageAdmin.adminset_1" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server"  Type="basic_3" />
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td align="left" height=10></td></tr>
 <tr><td align="left" class=table_style1><b><%=Request.QueryString["username"]%>管理权限设置</b></td></tr>
 <tr><td align="left" height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td align="left" valign=top>
<form method="post">
<table border=0 cellpadding=5 cellspacing=5 width=100% align=center  class=table_style2>
<tr>
  <td align="left" valign=top>
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>

 <tr>
  <td align="left" height=25><b>管理权限设置</b></td>
  <td align="left" height=25>
   <input type="checkbox" id="basic_1" name="basic" value="basic_1">基本参数设置&nbsp;
   <input type="checkbox" id="basic_2" name="basic" value="basic_2">数据库操作&nbsp;
   <input type="checkbox" id="basic_3" name="basic" value="basic_3">管理员设置&nbsp;
   <input type="checkbox" id="basic_4" name="basic" value="basic_4">在线支付接口<br>
   <input type="checkbox" id="basic_5" name="basic" value="basic_5">站内广告管理&nbsp;
   <input type="checkbox" id="basic_6" name="basic" value="basic_6">网站流量统计

 </td>
 </tr>
<tr><td colspan="2" height="10px"></td></tr>
<tr>
  <td align="left" height=25><b>会员中心</b></td>
  <td align="left" height=25>
   <input type="checkbox" id="member_1" name="member" value="member_1" >会员系统设置&nbsp;
   <input type="checkbox" id="member_2" name="member" value="member_2" >会员类别设置&nbsp;
   <input type="checkbox" id="member_3" name="member" value="member_3" >会员查看&nbsp;

 </td>
 </tr>

<tr><td colspan="2" height="10px"></td></tr>
<tr>
  <td align="left" height=25><b>业务管理</b></td>
  <td align="left" height=25>
   <input type="checkbox" id="business_1" name="business" value="business_1">定单管理&nbsp;
   <input type="checkbox" id="business_2" name="business" value="business_2">财务记录查看&nbsp;
   <input type="checkbox" id="business_3" name="business" value="business_3">留言管理&nbsp;
 </td>
 </tr>


<tr><td colspan="2" height="10px"></td></tr>
<tr>
  <td align="left" height=25><b>网站栏目管理</b></td>
  <td align="left" height=25>
   <input type="checkbox" id="lanmu_1" name="lanmu" value="lanmu_1">网站栏目设置&nbsp;
   <input type="checkbox" id="lanmu_2" name="lanmu" value="lanmu_2">导航样式设置&nbsp;
   <input type="checkbox" id="lanmu_3" name="lanmu" value="lanmu_3">模块样式设置&nbsp;
   <input type="checkbox" id="lanmu_4" name="lanmu" value="lanmu_4">自定义栏目&nbsp;
 </td>
 </tr>

<tr><td colspan="2" height="10px"></td></tr>
<tr>
  <td align="left" height=25><b>产品列表管理</b></td>
  <td align="left" height=25>
   <input type="checkbox" id="product_1" name="product" value="product_1">产品类别管理&nbsp;
   <input type="checkbox" id="product_2" name="product" value="product_2">产品明细管理&nbsp;
   <input type="checkbox" id="product_3" name="product" value="product_3">增加产品&nbsp;
   <input type="checkbox" id="product_4" name="product" value="product_6">产品评论管理&nbsp;
 </td>
 </tr>

<tr><td colspan="2" height="10px"></td></tr>
<tr>
  <td align="left" height=25><b>文章列表管理</b></td>
  <td align="left" height=25>
   <input type="checkbox" id="article_1" name="article" value="article_1">文章类别管理&nbsp;
   <input type="checkbox" id="article_2" name="article" value="article_2">文章明细管理&nbsp;
   <input type="checkbox" id="article_3" name="article" value="article_3">发布文章&nbsp;
   <input type="checkbox" id="article_4" name="article" value="article_6">文章评论管理&nbsp;
 </td>
 </tr>

<tr><td colspan="2" height="10px"></td></tr>
<tr>
  <td align="left" height=25><b>表单模型管理</b></td>
  <td align="left" height=25>
   <input type="checkbox" id="zdyform_1" name="zdyform" value="zdyform_1">自定义表单&nbsp;
   <input type="checkbox" id="zdyform_2" name="zdyform" value="zdyform_2">自定义模型&nbsp;
 </td>
 </tr>

<tr><td colspan="2" height="10px"></td></tr>
<tr>
  <td align="left" height=25><b>表单数据管理</b></td>
  <td align="left" height=25>
    <asp:Repeater id="P_zdyform" runat="server">
    <ItemTemplate>
       <input type="checkbox" id="zdydata_<%#DataBinder.Eval(Container.DataItem,"id")%>" name="zdydata" value='zdydata_<%#DataBinder.Eval(Container.DataItem,"id")%>'><%#DataBinder.Eval(Container.DataItem,"name")%>&nbsp;
     </ItemTemplate>
    </asp:Repeater>
 </td>
 </tr>


<tr><td colspan="2" height="10px"></td></tr>
<tr>
  <td align="left" height=25><b>招聘信息管理</b></td>
  <td align="left" height=25>
   <input type="checkbox" id="hr_1" name="hr" value="hr_1">招聘信息管理&nbsp;
   <input type="checkbox" id="hr_2" name="hr" value="hr_2">发布招聘信息&nbsp;
   <input type="checkbox" id="hr_3" name="hr" value="hr_3">应聘简历管理&nbsp;
 </td>
 </tr>

<tr><td colspan="2" height="10px"></td></tr>
<tr>
  <td align="left" height=25><b>销售网络</b></td>
  <td align="left" height=25>
   <input type="checkbox" id="network_1" name="network" value="network_1">网点管理&nbsp;
   <input type="checkbox" id="network_2" name="network" value="network_2">添加网点 &nbsp;
 </td>
 </tr>

<tr><td colspan="2" height="10px"></td></tr>
<tr>
  <td align="left" height=25><b>采集管理</b></td>
  <td align="left" height=25>
   <input type="checkbox" id="collection_1" name="collection" value="collection_1">采集节点管理&nbsp;
 </td>
 </tr>

<tr><td colspan="2" height="10px"></td></tr>
<tr>
  <td align="left" height=25><b>JS调用区</b></td>
  <td align="left" height=25>
   <input type="checkbox" id="js_1"  name="js" value="js_1">会员登陆调用&nbsp;
   <input type="checkbox" id="js_2"  name="js" value="js_2">图片幻灯片调用 &nbsp;
   <input type="checkbox" id="js_3"  name="js" value="js_3">站内搜索调用 &nbsp;
   <input type="checkbox" id="js_4"  name="js" value="js_4">问卷调查调用 &nbsp;
   <input type="checkbox" id="js_5"  name="js" value="js_5">友情链接调用 &nbsp;
 </td>
 </tr>
<tr>
 <td colspan="2" align="center" style="padding:20px 0 0 0">
<input type="hidden" name="tijiao" value="yes" >
<input type="submit" value="提 交"     class="button" />
<input type="button" value="返 回"     class="button" onclick="location.href='adminset.aspx'" />
</td>
</tr>
</table>
</td>
</tr>
</td>
</tr>
</table>
<br>
注：以上权限设置只对非admin管理员有效
</form>
<script language="javascript">

 var Obj;
 var Permissions="<%=Permissions%>";
 var APermissions=Permissions.split(',');
 for(i=0;i<APermissions.length;i++)
  {
    if(APermissions[i]!="")
     {
        Obj=document.getElementById(APermissions[i]);
        Obj.checked=true;
     }
  }
</script>
</center>
</body>
</html>  






