<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WXContactinfo.aspx.cs" Inherits="JDJS.Web.WXContactinfo" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/WXlogin.ascx" TagName="WXlogin" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title></title>
</head>
<body class="bodys">
<style>
.wrap{margin:0 auto;}
.bodys {text-align:center;}
.fontstl3{ font-size: x-large; font-weight:300;  color:Red}
.fontstl4{ font-weight:300;  color:blue}
</style>
    <form id="form1" runat="server">
   <div>
   <uc1:WXlogin id="login" runat="server"></uc1:WXlogin>
   <div id="NOlogined" runat="server" visible="false">
                <table class="wrap">
                    <tr>
                          <td class="fontstl3">
                          <asp:Label ID="Label2" runat="server">请先在页面顶端使用“建定通”帐号登录后方可查看相关信息！</asp:Label>
                          </td>
                    </tr>
                 </table>  
                 </div>
   <div id="HSlogined" runat="server" visible="false" >    
      <table class="wrap">
                    <tr>
                          <td class="fontstl3">
                          <asp:Label ID="Label1" runat="server">人员基本信息</asp:Label>
                          </td>
                    </tr>
                  </table> 
    <table class="wrap" style="text-align:left;"  border="1">
    
        <asp:Repeater ID="RepContact" runat="server">
            <ItemTemplate>
                        <tr>
                                         
                                          <tr>
                                               <td  colspan="3" style=" text-align:center; color:blue; font-weight:300; font-size:larger;">
                                                <%#LTP.Common.StringPlus.StrCut(Eval("linkman").ToString(), 82, "...")%> - <%#LTP.Common.StringPlus.StrCut(Eval("chenghu").ToString(), 82, "...")%></td>
                                          </tr>
                                          <tr>
                                              <td style=" text-align:center; width:30%; font-weight:bold;">
                                           所属公司：
                                          </td>
                                              <td > 
                                                  <a href="WXcompany.aspx?id=<%#Eval("cid") %>"><%#LTP.Common.StringPlus.StrCut(Eval("companyname").ToString(), 82, "...")%></a></td>                                       
                                          </tr>
                                          <tr>
                                             <td style=" text-align:center; width:30%; font-weight:bold;">
                                           所在地：
                                          </td>
                                          <td>
                                                  <%#LTP.Common.StringPlus.StrCut(Eval("place").ToString(), 32, "...")%></td>
                                          </tr>
                                          <tr>
                                           <td style=" text-align:center; width:30%; font-weight:bold;">
                                           职务：
                                          </td>
                                          <td>
                                              <%#LTP.Common.StringPlus.StrCut(Eval("job").ToString(), 82, "...")%></td>
                                          </tr>
                                          <tr>
                                           <td style=" text-align:center; width:30%; font-weight:bold;">
                                           电话：
                                          </td>
                                              <td>
                                              <%#LTP.Common.StringPlus.StrCut(Eval("phone").ToString(), 82, "...")%></td>
                                          </tr>
                                          <tr>
                                            <td style=" text-align:center; width:30%; font-weight:bold;">
                                           传真：
                                          </td>
                                              <td>
                                              <%#LTP.Common.StringPlus.StrCut(Eval("fax").ToString(), 82, "...")%></td>
                                          </tr>
                                          <tr>
                                           <td style=" text-align:center; width:30%; font-weight:bold;">
                                            电子邮件：
                                          </td>
                                              <td>
                                             <%#LTP.Common.StringPlus.StrCut(Eval("email").ToString(), 82, "...")%></td>
                                          </tr>
                                          <tr>
                                          <td style=" text-align:center; width:30%; font-weight:bold;">
                                            地址：
                                          </td>
                                              <td>
                                              <%#LTP.Common.StringPlus.StrCut(Eval("address").ToString(), 82, "...")%></td>
                                          </tr>
                                         
                           </tr>
             </ItemTemplate>
        </asp:Repeater>
        
       </table>
     
              <br/>
             <table class="wrap">
                    <tr>
                          <td class="fontstl3">
                          <asp:Label ID="prolist" runat="server">相关参与工程列表</asp:Label>
                          </td>
                    </tr>
                  </table> 
              
                   <table style="border-collapse:collapse; color:#003399; text-align:center;" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc" class="wrap">
                 <tr  style=" background:#003399; color:#ffffff; font-weight:bold;">
                      <td style=" width:20%">
                        
                        <span><b>当时状态</b></span>
                        
                       </td>
                     <td style=" width:30%">
                        <span><b>发布日期</b></span>
                     
                    </td>
                    
                    <td style=" width:50%">
                        <span><b>项目名称</b></span>
                       
                    </td>
                                    
                </tr> 
                
                                <asp:Repeater ID="Repeaterpro" runat="server">
                                    <ItemTemplate>
                                    <tr class="dataTableBody">
                                      <td style="padding:10px;"><%#Eval("prostate")%></td>
                                      <td style="padding:10px;">[<%#Eval("inforptime", "{0:yyyy-MM-dd}")%>]</td>
                                      <td style="padding:10px;"><a href="WXProDetail.aspx?Id=<%#Eval("proid") %>"><%#LTP.Common.StringPlus.StrCut(Eval("proname").ToString(), 82, "...")%></a>
                                     </td>
                                    </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                 <tr>
                                <td  colspan="3" align="center">  
                                    <uc1:UcfarPager ID="Pager" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                                </td>
                                </tr>
                  
                    </table>
                   
         </div>
     </div>
   
    </form>
</body>
</html>