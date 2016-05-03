<% @ Page Language="C#" Inherits="PageAdmin.m_top" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>pageadmin网站管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Author"  content="PageAdmin CMS" />
<link rel="stylesheet" href="master.css" type="text/css">
<script src="master.js" type="text/javascript"></script>
</head>
<body  topmargin=0 onload="Load_Menu()">
<form runat="server">
<table width="100%" cellpadding=0 cellspacing=0 border="0" align=center   bgcolor="#0099CC">
  <tbody>
  <tr>
  <td align=center  class=white height="20px" class=white>
   当前语种：<asp:Label  id="lbt1"  runat="server" CssClass="href1"  />&nbsp;
   <asp:LinkButton   onclick="Change_Language" runat="server" CssClass="href1" Text="切换语种" />&nbsp;&nbsp;
   <a href="/index.aspx?language=<%=P_Language%>" target="myweb" Class="href1"><b>前台预览</b></a>&nbsp;&nbsp;
    </td>
   </tr> 
<table>
<table width=100% cellpadding=0 cellspacing=0 border="0" align=center   bgcolor="#0099CC">
   <tr>
    <td align=left  height="40px" width="25%" class="white" valign="bottom">&nbsp;
     管理员:<asp:Label id="AdminName" runat="server" />&nbsp;
     <asp:LinkButton  text="注销" onclick="lbt_Click" runat="server" CssClass="href1"  />&nbsp;
  </td>
    <td  valign="bottom"  >
      <div class="top_menu" style="float:right;padding:0 20px 0 0">
       <ul>
         <li class="top_menu_item" id="basic_1" style="display:none;"><a class="top_menu_href" href="javascript:quick_1()">系统设置</a></li>
         <li class="top_menu_item" id="lanmu_1" style="display:none;"><a class="top_menu_href" href="javascript:quick_2()">栏目管理</a></li>
         <li class="top_menu_item" id="business_1" style="display:none;"><a class="top_menu_href" href="javascript:quick_3()">查看定单</a></li>
         <li class="top_menu_item" id="business_2" style="display:none;"><a class="top_menu_href" href="javascript:quick_4()">查看留言</a></li>
         <li class="top_menu_item" id="product_2" style="display:none;"><a class="top_menu_href" href="javascript:quick_5()">发布产品</a></li>
         <li class="top_menu_item" id="article_2" style="display:none;"><a class="top_menu_href" href="javascript:quick_6()">发布文章</a></li>
         <li class="top_menu_item" id="basic_6" style="display:none;"><a class="top_menu_href" href="javascript:quick_7()">流量统计</a></li>
         <li class="top_menu_item"><a class="top_menu_href" href="http://bbs.pageadmin.net" target="bbs">互助论坛</a></li> 
       </ul>
     </div>
    </td>
    </tr> 
    <tr><td colspan="2" bgcolor="#000000"></td></tr>
   </tbody>
   </table>
</form>
<script language="javascript">
var Url=parent.frames['right'].location.href;
var LeftMenu=parent.frames['left'];
LeftMenu.location.href=LeftMenu.location.href;
if(Url.indexOf("lanmu_2")>0 || Url.indexOf("lanmu_1_")>0 || Url.indexOf("lanmu_template")>0 || Url.indexOf("lanmu_3")>0)
 {
   parent.frames['right'].location.href="lanmu_1.aspx";
 }
else if(Url.indexOf("product_2.aspx")>0 || Url.indexOf("product_3.aspx")>0)
 {
   parent.frames['right'].location.href="product_1.aspx";
 }
else if(Url.indexOf("information_2")>0 || Url.indexOf("information_3.aspx")>0)
 {
   parent.frames['right'].location.href="information_1.aspx";
 }

else if(Url.indexOf("hr_2_1")>0)
 {
   parent.frames['right'].location.href="hr_1.aspx";
 }

else if(Url.indexOf("slide_2")>0)
 {
   parent.frames['right'].location.href="slide_1.aspx";
 }
else if(Url.indexOf("vote_2")>0)
 {
   parent.frames['right'].location.href="vote_1.aspx";
 }
else if(Url.indexOf("link_2")>0)
 {
   parent.frames['right'].location.href="link_1.aspx";
 }
else
 {
  parent.frames['right'].location.href=Url;
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
     if(Permissions.indexOf("basic_1")>=0  || LoginName=="admin")
      {
        Show("basic_1");
      }
     
     if(Permissions.indexOf("basic_6")>=0  || LoginName=="admin")
      {
        Show("basic_6");
      }

     if(Permissions.indexOf("lanmu_1")>=0  || LoginName=="admin")
      {
        Show("lanmu_1");
      }

     if(Permissions.indexOf("business_1")>=0  || LoginName=="admin")
      {
        Show("business_1");
      }


     if(Permissions.indexOf("business_2")>=0  || LoginName=="admin")
      {
        Show("business_2");
      }

     if(Permissions.indexOf("product_3")>=0  || LoginName=="admin")
      {
        Show("product_2");
      }

     if(Permissions.indexOf("article_3")>=0  || LoginName=="admin")
      {
        Show("article_2");
      }

    <%
      }
    %>
  }
</script>
</body>
</html>  
