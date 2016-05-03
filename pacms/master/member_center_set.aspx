<% @ Page Language="C#"   Inherits="PageAdmin.member_center_set" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server"  Type="basic_3" />
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td align="left" height=10></td></tr>
 <tr><td align="left" class=table_style1><b>会员功能设置(<%=Request.QueryString["m_type"]%>)</b></td></tr>
 <tr><td align="left" height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td align="left" valign=top>
<form method="post" name="M_Form">
<table border=0 cellpadding=5 cellspacing=2 width=100% align=center  class=table_style2>

 <tr>
  <td align="left" height=25 width="150px">我的订单</td>
  <td align="left" height=25>
   <input type="radio"  name="order" value="1"  checked>开启 <input type="radio"  name="order" value="0" checked>关闭<br>
  </td>
 </tr>

 <tr>
  <td align="left" height=25 width="150px">产品价格表</td>
  <td align="left" height=25>
   <input type="radio"  name="price_list" value="1"  checked>开启 <input type="radio"  name="price_list" value="0" checked>关闭<br>
  </td>
 </tr>

 <tr>
  <td align="left" height=25>我的财务</td>
  <td align="left" height=25>
   <input type="radio"  name="fnc" value="1" checked>开启 <input type="radio" name="fnc" value="0" checked>关闭<br>
 </td>
 </tr>

 <tr>
  <td align="left" height=25>在线支付</td>
  <td align="left" height=25>
   <input type="radio"  name="onlinepay" value="1">开启 <input type="radio"  name="onlinepay" value="0" checked>关闭<br>
 </td>
 </tr>

 <tr>
  <td align="left" height=25 valign=top>产品发布</td>
  <td align="left" height=25>
   <input type="radio"  name="product" value="1">开启 <input type="radio" name="product" value="0" checked>关闭<br>
   <div style="padding:5px 5px 5px 10px">
   默认显示：<input type="radio"  name="product_show" value="1">显示 <input type="radio"  name="product_show" value="0"  checked>隐藏<br>
   发布功能：<input type="radio"  name="product_add" value="1">开启 <input type="radio"  name="product_add" value="0"  checked>关闭<br>
   修改功能：<input type="radio"  name="product_edit" value="1">开启 <input type="radio"  name="product_edit" value="0"  checked>关闭<br>
   删除功能：<input type="radio"  name="product_del" value="1">开启 <input type="radio"  name="product_del" value="0"  checked>关闭<br>
   </div>
 </td>
 </tr>

 <tr>
  <td align="left" height=25 valign=top>文章发布</td>
  <td align="left" height=25>
   <input type="radio"  name="article" value="1">开启 <input type="radio" name="article" value="0" checked>关闭<br>
   <div style="padding:5px 5px 5px 10px">
   默认显示：<input type="radio"  name="article_show" value="1">显示 <input type="radio"  name="article_show" value="0"  checked>隐藏<br>
   文章图片：<input type="radio"  name="article_image" value="1">开启 <input type="radio" name="article_image" value="0"  checked>关闭<br>
   发布功能：<input type="radio"  name="article_add" value="1">开启 <input type="radio"  name="article_add" value="0"  checked>关闭<br>
   修改功能：<input type="radio"  name="article_edit" value="1">开启 <input type="radio"  name="article_edit" value="0"  checked>关闭<br>
   删除功能：<input type="radio"  name="article_del" value="1">开启 <input type="radio"  name="article_del" value="0"  checked>关闭<br>
   </div>
 </td>
 </tr>

<asp:Repeater id="P_zdyform" runat="server">
<ItemTemplate>
<tr>
  <td align="left" height=25 valign=top><%#DataBinder.Eval(Container.DataItem,"name")%>(自定义)</td>
  <td align="left" height=25>
   <input type="radio"  name="<%#DataBinder.Eval(Container.DataItem,"tablename")%>" value="1">开启 <input type="radio" name="<%#DataBinder.Eval(Container.DataItem,"tablename")%>" value="0" checked>关闭<br>
   <div style="padding:5px 5px 5px 10px">
    默认显示：<input type="radio"  name="<%#DataBinder.Eval(Container.DataItem,"tablename")%>_show" value="1">显示 <input type="radio"  name="<%#DataBinder.Eval(Container.DataItem,"tablename")%>_show" value="0"  checked>隐藏<br>
    发布功能：<input type="radio"  name="<%#DataBinder.Eval(Container.DataItem,"tablename")%>_add" value="1">开启 <input type="radio"  name="<%#DataBinder.Eval(Container.DataItem,"tablename")%>_add" value="0"  checked>关闭<br>
    修改功能：<input type="radio"  name="<%#DataBinder.Eval(Container.DataItem,"tablename")%>_edit" value="1">开启 <input type="radio"  name="<%#DataBinder.Eval(Container.DataItem,"tablename")%>_edit" value="0"  checked>关闭<br>
    删除功能：<input type="radio"  name="<%#DataBinder.Eval(Container.DataItem,"tablename")%>_del" value="1">开启 <input type="radio"  name="<%#DataBinder.Eval(Container.DataItem,"tablename")%>_del" value="0"  checked>关闭<br>
    预设字段：<input type="radio"  name="<%#DataBinder.Eval(Container.DataItem,"tablename")%>_field" value="1">开启 <input type="radio"  name="<%#DataBinder.Eval(Container.DataItem,"tablename")%>_field" value="0"  checked>关闭
   </div>
 </td>
 </tr>
 </ItemTemplate>
</asp:Repeater>

 <tr>
  <td align="left" height=25>留言反馈</td>
  <td align="left" height=25>
   <input type="radio"   name="feedback" value="1">开启 <input type="radio"  name="feedback" value="0" checked>关闭<br>
 </td>
 </tr>

 <tr>
  <td align="left" height=25>编辑器上传权限</td>
  <td align="left" height=25>
   <input type="radio"   name="fckeditor_upload" value="1">开启 <input type="radio"  name="fckeditor_upload" value="0" checked>关闭<br>
 </td>
 </tr>

 <tr>
 <td colspan="2" align="center" style="padding:20px 0 0 0">
<input type="submit" value="提 交"    class="button" />
<input type="button" value="返 回"     class="button" onclick="location.href='member_type.aspx'" />
</td>
</tr>
</table>
</form>
</td>
</tr>
</table>

</center>

<script language="javascript">
 var M_Center="<%=M_Center%>";
 if(M_Center!="")
  {
     if(M_Center.indexOf("message=1")>=0)
      {
        document.getElementsByName("message")[0].checked=true;
      }

     if(M_Center.indexOf("order=1")>=0)
      {
        document.getElementsByName("order")[0].checked=true;
      }

     if(M_Center.indexOf("price_list=1")>=0)
      {
        document.getElementsByName("price_list")[0].checked=true;
      }

      if(M_Center.indexOf("fnc=1")>=0)
      {
        document.getElementsByName("fnc")[0].checked=true;
      }

      if(M_Center.indexOf("onlinepay=1")>=0)
      {
        document.getElementsByName("onlinepay")[0].checked=true;
      }



 //产品
      if(M_Center.indexOf("product=1")>=0)
      {
        document.getElementsByName("product")[0].checked=true;
      }

    if(M_Center.indexOf("product_show=1")>=0)
      {
        document.getElementsByName("product_show")[0].checked=true;
      }

    if(M_Center.indexOf("product_add=1")>=1)
      {
        document.getElementsByName("product_add")[0].checked=true;
      }

    if(M_Center.indexOf("product_edit=1")>=1)
      {
        document.getElementsByName("product_edit")[0].checked=true;
      }

      if(M_Center.indexOf("product_del=1")>=0)
      {
        document.getElementsByName("product_del")[0].checked=true;
      }

 //文章
      if(M_Center.indexOf("article=1")>=0)
      {
        document.getElementsByName("article")[0].checked=true;
      }

      if(M_Center.indexOf("article_show=1")>=0)
      {
        document.getElementsByName("article_show")[0].checked=true;
      }

      if(M_Center.indexOf("article_image=1")>=1)
      {
        document.getElementsByName("article_image")[0].checked=true;
      }

     if(M_Center.indexOf("article_add=1")>=1)
      {
        document.getElementsByName("article_add")[0].checked=true;
      }

      if(M_Center.indexOf("article_edit=1")>=1)
      {
        document.getElementsByName("article_edit")[0].checked=true;
      }

      if(M_Center.indexOf("article_del=1")>=0)
      {
        document.getElementsByName("article_del")[0].checked=true;
      }

      if(M_Center.indexOf("feedback=1")>=0)
      {
        document.getElementsByName("feedback")[0].checked=true;
      }

      if(M_Center.indexOf("fckeditor_upload=1")>=0)
      {
        document.getElementsByName("fckeditor_upload")[0].checked=true;
      }
<asp:Repeater id="P_zdyform_1" runat="server">
<ItemTemplate>
 if(M_Center.indexOf("<%#DataBinder.Eval(Container.DataItem,"tablename")%>=1")>=0)
   {
     document.getElementsByName("<%#DataBinder.Eval(Container.DataItem,"tablename")%>")[0].checked=true;
   }
 if(M_Center.indexOf("<%#DataBinder.Eval(Container.DataItem,"tablename")%>_show=1")>=0)
   {
     document.getElementsByName("<%#DataBinder.Eval(Container.DataItem,"tablename")%>_show")[0].checked=true;
   }

 if(M_Center.indexOf("<%#DataBinder.Eval(Container.DataItem,"tablename")%>_add=1")>=0)
   {
     document.getElementsByName("<%#DataBinder.Eval(Container.DataItem,"tablename")%>_add")[0].checked=true;
   }

 if(M_Center.indexOf("<%#DataBinder.Eval(Container.DataItem,"tablename")%>_edit=1")>=0)
   {
     document.getElementsByName("<%#DataBinder.Eval(Container.DataItem,"tablename")%>_edit")[0].checked=true;
   }

 if(M_Center.indexOf("<%#DataBinder.Eval(Container.DataItem,"tablename")%>_del=1")>=0)
   {
     document.getElementsByName("<%#DataBinder.Eval(Container.DataItem,"tablename")%>_del")[0].checked=true;
   }
 if(M_Center.indexOf("<%#DataBinder.Eval(Container.DataItem,"tablename")%>_field=1")>=0)
   {
     document.getElementsByName("<%#DataBinder.Eval(Container.DataItem,"tablename")%>_field")[0].checked=true;
   }
 </ItemTemplate>
</asp:Repeater>

  }

</script>

</body>
</html>  



