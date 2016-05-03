<% @ Page Language="C#" inherits="PageAdmin.sysmain"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>pageadmin网站管理系统</title>
<link rel="stylesheet" href="master.css" type="text/css">
<style>
td{color:#10334F}
</style>
</head>
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<br>
<table width="95%" border="0" align="center" cellpadding="5" cellspacing="1"  class="tablestyle">
        <tr> 
          <td height="10px"  style="color:#ffffff"><b>系统信息<b></td>
        </tr>
      </table>
<table border=0 width="95%" cellpadding="5" cellspacing="0"  align="center" class="tablestyle">
             <tr>
              <td height="25px" width="100px" class="tdstyle">待审文章：</td><td width="200px" align="left" class="tdstyle">
              <%=UncheckArticle%>
               <%if(UncheckArticle!="0")
                {%>
                <a href="information_1.aspx?check=0"><image src=images/sign_3.gif title=查看 border=0 hspace=2></a>
               <%}%>
              </td>

              <td height="25px" width="100px" class="tdstyle">待审产品：</td><td width="200px" align="left" class="tdstyle">
              <%=UncheckProduct%>
               <%if(UncheckProduct!="0")
                {%>
                <a href="product_1.aspx?check=0"><image src=images/sign_3.gif title=查看 border=0 hspace=2></a>
               <%}%>
              </td>


               <td height="25px" width="100px"  class="tdstyle">待审评论：</td><td width="200px" class="tdstyle">

             文章：<%=A_Comments%><%if(A_Comments!="0"){Response.Write("<a href='comments_1.aspx?type=article'><image src=images/sign_3.gif title=查看 border=0 hspace=2></a>");}%>
            <p>产品：<%=P_Comments%><%if(P_Comments!="0"){Response.Write("<a href='comments_1.aspx?type=product'><image src=images/sign_3.gif title=查看 border=0 hspace=2></a>");}%></td>
               
              
             </tr>

             <tr> 
              <td height="25px" width="100px"  class="tdstyle">待回复留言：</td><td width="200px" class="tdstyle"><%=Feedbacks%><%if(Feedbacks!="0"){Response.Write("<a href='feedback_1.aspx'><image src=images/sign_3.gif title=查看 border=0 hspace=2></a>");}%></td>
              <td height="25px" width="100px"  class="tdstyle">待处理订单：</td><td width="200px" class="tdstyle"><%=Orders%><%if(Orders!="0"){Response.Write("<a href='order_1.aspx'><image src=images/sign_3.gif title=查看 border=0 hspace=2></a>");}%></td>
              <td height="25px" width="100px"  class="tdstyle">统计信息：</td><td width="200px" align="left" class="tdstyle">产品：<%=Products%><p>文章：<%=Articles%></td>
             </tr>
           </table>
<br>

<table width="95%" border="0" align="center" cellpadding="5" cellspacing="1" class="tablestyle">
        <tr> 
          <td height="10px"  style="color:#ffffff"><b>服务器信息<b></td>
        </tr>
      </table>

<table border=0 width="95%" cellpadding="5" cellspacing="0"  align="center" class="tablestyle">
             <tr>
               <td height="25px" width="100px"  class="tdstyle">当前域名：</td><td width="200px" class="tdstyle">http://<%=Request.ServerVariables["SERVER_NAME"]%>:<%=Request.ServerVariables["SERVER_PORT"]%></td>
               <td height="25px" width="100px"  class="tdstyle">服务器目录：</td><td class="tdstyle"><%=Server.MapPath("/")%></td>
             </tr>

             <tr>
               <td height="25px" width="100px"  class="tdstyle">操作系统：</td><td class="tdstyle"><%=Request.ServerVariables["SERVER_SOFTWARE"]%></td>
               <td height="25px" width="100px"  class="tdstyle">.NET版本</td><td class="tdstyle"><%=Environment.Version%></td>
              </tr>

             <tr>
               <td height="25px" width="100px"  class="tdstyle">服务器IP：</td><td class="tdstyle"><%=Request.ServerVariables["LOCAL_ADDR"]%></td>
   
               <td height="25px" width="100px"  class="tdstyle">用户浏览器：</td><td class="tdstyle"><%=Request.Browser.Browser%><%=Request.Browser.Version%></td>
             </tr>
           </table>
<br>
<table width="95%" border="0" align="center" cellpadding="5" cellspacing="1" class="tablestyle">
        <tr> 
          <td height="10px"  style="color:#ffffff"><b>PageAdmin网站管理系统官方信息<b></td>
        </tr>
</table>
<table border=0 width="95%" cellpadding="5" cellspacing="0"  align="center" class="tablestyle">
             <tr>
               <td height="25px" width="200px"  class="tdstyle">最后更新时间：</td><td class="tdstyle">2012年5月30</td>
             </tr>
             <tr>
               <td height="25px" width="200px"  class="tdstyle">PageAdmin官方网站：</td><td class="tdstyle"><a href=http://www.pageadmin.net target="pageadmin">http://www.pageadmin.net</a></td>
             </tr>
             <tr>
               <td height="25px" width="200px"  class="tdstyle">PageAdmin官方论坛：</td><td class="tdstyle"><a href=http://bbs.pageadmin.net target="pageadminbbs">http://bbs.pageadmin.net</a></td>
             </tr>
             <tr>
               <td height="25px" width="200px"  class="tdstyle">版权所有：</td><td class="tdstyle">中山市南头镇华拓网络技术服务中心</td>
             </tr>
           <tr>
               <td height="25px" width="200px"  class="tdstyle">联系电话：</td><td class="tdstyle">0760-22517081 </td>
             </tr>
          <tr>
               <td height="25px" width="200px"  class="tdstyle">联系地址：</td><td class="tdstyle">广东省中山市南头镇金湾广场B座16卡 邮编:528427</td>
             </tr>
           </table>
</center>

</html>  



