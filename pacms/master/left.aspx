<% @ Page Language="C#" Inherits="PageAdmin.left"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>pageadmin网站管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Author"  content="www.pageadmin.net" />
<link rel="stylesheet" href="master.css" type="text/css">
<script src="master.js" type="text/javascript"></script>
<base target="right">
<base onmouseover="window.status='后台管理系统';return true">
<script language=javascript>
 <!--
  var Objs=document.getElementsByName("left");
  var zdyObj=document.getElementsByName("zdydata");
  function hideall()
   {
    for(i=0;i<Objs.length;i++)
     {

      Objs[i].style.display="none";
    }
  }


   function show_menu(num)
     {
      var style1=Objs[num].style.display;
      if(style1=="none")
      {
      hideall();
      Hide_AllZdyData();
      Objs[num].style.display="";
      }
     else
      {
      Objs[num].style.display="none";
      }
      
     }



  function Show(Id)
    {
     var Obj=document.getElementById(Id);
     Obj.style.display="";
    }

  function Load_Menu()
   {
    <%
       if(System.Web.HttpContext.Current.Request.Cookies["master"]!=null)
        {
     %>
     var Permissions="<%=System.Web.HttpContext.Current.Request.Cookies["master"].Values["Permissions"].ToString()%>";
     var LoginName="<%=System.Web.HttpContext.Current.Request.Cookies["Master"].Values["UserName"].ToString()%>";
     if(Permissions.indexOf("basic")>=0 || LoginName=="admin")
      {
        Show("basic_set");
      }
     if(Permissions.indexOf("member")>=0  || LoginName=="admin")
      {
        Show("member_set");
      }
     if(Permissions.indexOf("business")>=0  || LoginName=="admin")
      {
        Show("business_set");
      }
     if(Permissions.indexOf("lanmu")>=0  || LoginName=="admin")
      {
        Show("lanmu_set");
      }

     if(Permissions.indexOf("product")>=0  || LoginName=="admin")
      {
        Show("product_set");
      }
     if(Permissions.indexOf("article")>=0  || LoginName=="admin")
      {
        Show("article_set");
      }

     if(Permissions.indexOf("hr")>=0  || LoginName=="admin")
      {
        Show("hr_set");
      }

     if(Permissions.indexOf("collection")>=0  || LoginName=="admin")
      {
        Show("collection_set");
      }

     if(Permissions.indexOf("network")>=0  || LoginName=="admin")
      {
        Show("network_set");
      }

     if(Permissions.indexOf("zdyform")>=0  || LoginName=="admin")
      {
        Show("zdyform_set");
      }

     if(Permissions.indexOf("js")>=0  || LoginName=="admin")
      {
        Show("js_set");
      }

     if(LoginName=="admin")
      {
       var TagSpan=document.getElementsByTagName("span");
       for(i=0;i<TagSpan.length;i++)
        {
          TagSpan[i].id = "Span"+i;
          document.getElementById("Span"+i).style.display="";
        }
       for(i=0;i<zdyObj.length;i++)
       {
        zdyObj[i].getElementsByTagName("td")[0].style.display="";
       }
      }
      else
      {
       var APermissions=Permissions.split(',');
       for(i=0;i<APermissions.length;i++)
        {
         if(APermissions[i]!="" || LoginName=="admin")
          {
           Show(APermissions[i]);
          }
        }
      }

    <%
      }
    %>
    }

  var zdyformItems=document.getElementsByName("zdyform_item");
  function Hide_AllZdyData()
    {
        for(i=0;i<zdyformItems.length;i++)
        {
            zdyformItems[i].style.display="none";
        }
    }

   function showzdydata(num)
    {
     var zdyformItem=zdyformItems[num];
     if(zdyformItem.style.display=="")
      {
       zdyformItem.style.display="none";
      }
     else
      {
        for(i=0;i<zdyformItems.length;i++)
        {
          if(num!=i)
          {
            zdyformItems[i].style.display="none";
          }
        }
        zdyformItem.style.display="";
      }
    }

-->
</script>
<style>
html,body{margin:0px;height:100%;}
</style>
</head>  
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0 bgcolor=#D1EAFE onload="Load_Menu()">
<table width=140px cellpadding=0 cellspacing=0 border=0 style="height:100%;overflow:hidden;background:url(images/left_bg.gif) repeat top;">
 <tr>
  <td align=center valign=top>
  <div style="width=140px;background:url(images/left_top.gif) no-repeat;padding:30px 0 35px 0;">
   <a href="sysmain.aspx"><span style='color:#ffffff;font-size:12px;font-weight:bold;text-decoration:none'>网站管理系统后台</span></a>
  </div>
<table width=120px cellpadding=0 cellspacing=0 border=0>
   <tbody>
     <tr>
     <td  id="basic_set" align="left" height=25px  onclick="show_menu(0)" style="display:none;cursor:pointer">&nbsp;<img src="images/left_1.gif" width=16 height=16 hspace=3 align=absmiddle>基本信息设置</td>
    </tr> 
   <tr id="left" name="left" style="display:in-line" >
     <td  align="left" class=left_padd>
      <span style="display:none;" id="basic_1">·<a href="set_1.aspx" class=left>基本参数设置</a><br></span>
      <span style="display:none;" id="basic_2">·<a href="data_manage.aspx" class=left>数据库操作</a><br></span>
      <span style="display:none;" id="basic_3">·<a href="chinabank_set.aspx" class=left>在线支付接口</a><br></span>
      <span style="display:none;" id="basic_4">·<a href="adv_1.aspx" class=left>站内广告管理</a><br></span>
      <span style="display:none;" id="basic_5">·<a href="tongji.aspx" class=left>网站流量统计</a></span>
    </td>
    </tr> 

 <tr>
     <td   id="member_set"  align="left" height=25px  onclick="show_menu(1)" style="display:none;cursor:pointer">&nbsp;<img src="images/member.gif" width=20 height=20 hspace=3 align=absmiddle>会员中心</td>
    </tr> 
   <tr id="left" name="left"  style="display:none" >
     <td  align="left" class=left_padd>
      <span style="display:none;" id="member_1">·<a href="member_set.aspx" class=left>会员系统设置</a><br></span>
      <span style="display:none;" id="member_2">·<a href="member_type.aspx" class=left>会员类别设置</a><br></span>
      <span style="display:none;" id="member_3">
        <asp:Repeater id="P1" runat="server">
         <ItemTemplate>
        ·<a href="member_1.aspx?tid=<%#DataBinder.Eval(Container.DataItem,"id")%>&group=<%#DataBinder.Eval(Container.DataItem,"m_group")%>" class=left><%#DataBinder.Eval(Container.DataItem,"m_type")%></a><br>
         </ItemTemplate>
       </asp:Repeater>
     </span>
    </td>
  </tr> 

   <tr>
     <td  id="business_set" align="left" height=25px onclick="show_menu(2)" style="display:none;cursor:pointer">&nbsp;<img src="images/yw.gif" width=16 height=16 hspace=3 align=absmiddle>业务管理</td>
    </tr> 
   <tr id="left" name="left"   style="display:none"  >
     <td  align="left" class=left_padd>
      <span style="display:none;" id="business_1">·<a href="order_1.aspx" class=left>订单管理</a><br></span>
      <span style="display:none;" id="business_2">·<a href="Finance_1.aspx" class=left>财务记录</a><br></span>
      <span style="display:none;" id="business_4">·<a href="feedback_1.aspx" class=left>留言管理</a><br></span>
    </td>
    </tr>
  
 <tr>
     <td  id="lanmu_set" align="left" height=25px  onclick="show_menu(3)" style="display:none;cursor:pointer">&nbsp;<img src="images/left_2.gif" width=18 height=18 hspace=3 align=absmiddle>网站栏目管理</td>
    </tr> 
   <tr id="left" name="left"  style="display:none" >
     <td  align="left" class=left_padd>
      <span style="display:none;" id="lanmu_1">·<a href="lanmu_1.aspx" class=left>网站栏目设置</a><br></span>
      <span style="display:none;" id="lanmu_2">·<a href="nav_style.aspx" class=left>导航样式设置</a><br></span>
      <span style="display:none;" id="lanmu_3">·<a href="template_style.aspx" class=left>模块样式设置</a><br></span>
      <span style="display:none;" id="lanmu_4">·<a href="lanmu_spc.aspx" class=left>自定义栏目</a></span><br>
    </td>
  </tr> 

   <tr>
     <td  id="product_set" align="left" height=25px  onclick="show_menu(4)" style="display:none;cursor:pointer">&nbsp;<img src="images/left_3.gif" width=19 height=17 hspace=3 align=absmiddle>产品列表管理</td>
    </tr> 
   <tr id="left" name="left"  style="display:none" >
     <td  align="left" class=left_padd>
      <span style="display:none;" id="product_1">·<a href='sort_1.aspx?table=product&name=<%=Server.UrlEncode("产品")%>' class=left>产品类别设置</a> <br></span>
      <span style="display:none;" id="product_2">·<a href="product_1.aspx" class=left>产品明细管理</a><br></span>
      <span style="display:none;" id="product_3">·<a href="product_2.aspx" class=left>发布产品</a><br></span>
      <span style="display:none;" id="product_4">·<a href="comments_1.aspx?type=product" class=left>评论管理</a></span>
    </td>
    </tr> 

   <tr>
     <td id="article_set"   align="left" height=25px  onclick="show_menu(5)" style="display:none;cursor:pointer">&nbsp;<img src="images/article.gif" width=16 height=16 hspace=3 align=absmiddle>文章列表管理</td>
    </tr> 
   <tr id="left" name="left"   style="display:none" >
     <td  align="left" class=left_padd>
      <span style="display:none;" id="article_1">·<a href='sort_1.aspx?table=information&name=<%=Server.UrlEncode("文章")%>' class=left>文章类别管理</a><br></span>
      <span style="display:none;" id="article_2">·<a href="information_1.aspx" class=left>文章明细管理</a><br></span>
      <span style="display:none;" id="article_3">·<a href="information_2.aspx" class=left>发布文章</a><br></span>
      <span style="display:none;" id="article_4">·<a href="comments_1.aspx?type=article" class=left>评论管理</a></span>
    </td>
    </tr>


   <tr>
     <td id="zdyform_set"  align="left" height=25px onclick="show_menu(6)" style="display:none;cursor:pointer">&nbsp;<img src="images/zdyform.gif"  width=16 height=16 hspace=3 align=absmiddle>表单模型管理</td>
    </tr> 
   <tr id="left" name="left"   style="display:none"  >
     <td  align="left" class=left_padd>
      <span style="display:none;" id="zdyform_1">·<a href="zdyform_1.aspx" class=left>自定义表单</a><br></span>
      <span style="display:none;" id="zdyform_2">·<a href="zdymodel_1.aspx" class=left>自定义模型</a><br></span>
     </td>
   </tr>
        <asp:Repeater id="P_zdyform" runat="server">
         <ItemTemplate>
          <tr id="zdydata" name="zdydata"><td  id="zdydata_<%#DataBinder.Eval(Container.DataItem,"id")%>"  align="left" height=25px onclick="return showzdydata(<%=ZdyformItems++%>)"  style="cursor:pointer;display:none;" title="自定义表单数据管理">
            &nbsp;<img src="images/zdy.gif" width=16 height=16 hspace=3 align=absmiddle><%#DataBinder.Eval(Container.DataItem,"name")%>
          </td>
         </tr>
           <tr  id='zdyform_item' name="zdyform_item" style="display:none;">
            <td  align="left" class=left_padd>
             <span>·<a href="sort_1.aspx?fid=<%#DataBinder.Eval(Container.DataItem,"id")%>&table=<%#DataBinder.Eval(Container.DataItem,"tablename")%>&name=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"name").ToString())%>" class=left>分类管理</a><br></span>
             <span>·<a href="zdyform_data.aspx?fid=<%#DataBinder.Eval(Container.DataItem,"id")%>&ftable=<%#DataBinder.Eval(Container.DataItem,"tablename")%>&fname=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"name").ToString())%>"   class=left>查看数据</a><br></span>
             <span>·<a href="zdyform_data_1.aspx?fid=<%#DataBinder.Eval(Container.DataItem,"id")%>&ftable=<%#DataBinder.Eval(Container.DataItem,"tablename")%>&fname=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"name").ToString())%>" class=left>增加数据<a><br></span>
             <span>·<a href="comments_1.aspx?fid=<%#DataBinder.Eval(Container.DataItem,"id")%>&type=<%#DataBinder.Eval(Container.DataItem,"tablename")%>" class=left>评论管理</a></span>
          </td>
         </tr>
         </ItemTemplate>
       </asp:Repeater>

 <tr>
     <td  id="hr_set"  align="left" height=25px  onclick="show_menu(7)" style="display:none;cursor:pointer">&nbsp;<img src="images/hr.gif" width=16 height=16 hspace=3 align=absmiddle>招聘信息管理</td>
    </tr> 
   <tr id="left" name="left"   style="display:none" >
     <td  align="left" class=left_padd>
      <span style="display:none;" id="hr_1">·<a href="hr_1.aspx" class=left>招聘信息管理</a> <br></span>
      <span style="display:none;" id="hr_2">·<a href="hr_2.aspx" class=left>发布招聘信息</a> <br></span>
      <span style="display:none;" id="hr_3">·<a href="hr_3.aspx" class=left>应聘简历管理</a></span>
    </td>
    </tr>

<tr>
     <td  id="network_set" align="left" height=25px onclick="show_menu(8)" style="display:none;cursor:pointer">&nbsp;<img src="images/network.gif"  width=16 height=16 hspace=3 align=absmiddle>销售网络</td>
    </tr> 
   <tr id="left" name="left"   style="display:none"  >
     <td  align="left" class=left_padd>
      <span style="display:none;" id="network_1">·<a href="channel_1.aspx" class=left>网点管理</a> <br></span>
      <span style="display:none;" id="network_2">·<a href="channel_2.aspx" class=left>添加网点</a></span>
    </td>
 </tr>

  <tr>
     <td  id="collection_set"  align="left" height=25px  onclick="show_menu(9)" style="display:none;cursor:pointer">&nbsp;<img src="images/collection.gif" width=16 height=16 hspace=3 align=absmiddle>采集管理</td>
    </tr> 
   <tr id="left" name="left"   style="display:none" >
     <td  align="left" class=left_padd>
      <span style="display:none;" id="collection_1">·<a href="collection_1.aspx" class=left>采集节点管理</a></span>
    </td>
    </tr>


  <tr>
     <td id="js_set"  align="left" height=25px onclick="show_menu(10)" style="display:none;cursor:pointer">&nbsp;<img src="images/left_8.gif"  width=16 height=16 hspace=3 align=absmiddle>JS调用区</td>
    </tr> 
   <tr id="left" name="left"   style="display:none"  >
     <td  align="left" class=left_padd>
      <span style="display:none;" id="js_1">·<a href="loginbox_1.aspx" class=left>会员登陆调用</a><br></span>
      <span style="display:none;" id="js_2">·<a href="slide_1.aspx" class=left>图片幻灯片调用</a><br></span>
      <span style="display:none;" id="js_3">·<a href="search_1.aspx" class=left>站内搜索调用</a><br></span>
      <span style="display:none;" id="js_4">·<a href="vote_1.aspx" class=left>问卷调查调用</a><br></span>
      <span style="display:none;" id="js_5">·<a href="link_1.aspx" class=left>友情链接调用</a> <br></span>
    </td>
    </tr>

     </tbody>
   </table>
 </td>
 </tr>
</table>

</body>
</html>  



