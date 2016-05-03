<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WXcompany.aspx.cs" Inherits="JDJS.Web.WXcompany" %>
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
                          <asp:Label ID="Label1" runat="server">公司基本信息</asp:Label>
                          </td>
                    </tr>
                  </table> 
    <table class="wrap" style="text-align:left;"  border="1">
    
        <asp:Repeater ID="RepCompany" runat="server">
            <ItemTemplate>
                        
                                          <tr>
                                              <td colspan="2" style=" text-align:center;font-weight:bold;">
                                                  <%#LTP.Common.StringPlus.StrCut(Eval("company").ToString(), 82, "...")%>
                                              </td>
                                          </tr>
                                          <tr >
                                          <td style=" text-align:center; width:30%; font-weight:bold;">
                                           公司性质：
                                          </td>
                                              <td>
                                              <%#LTP.Common.StringPlus.StrCut(Eval("ctype").ToString(), 22, "...")%></td>
                                          </tr>
                                           <tr>
                                           <td style=" text-align:center; width:30%; font-weight:bold;">
                                           所在地区：
                                          </td>
                                              <td>
                                            
                                               <%#LTP.Common.StringPlus.StrCut(Eval("cplace").ToString(), 22, "...")%></td>
                                          </tr>
                                           <tr>
                                             <td style=" text-align:center; width:30%; font-weight:bold;">
                                           地址：
                                          </td>
                                              <td>
                                               <%#LTP.Common.StringPlus.StrCut(Eval("caddress").ToString(), 82, "...")%></td>
                                          </tr>
                                          
                                           <tr>
                                           <td style=" text-align:center; width:30%; font-weight:bold;">
                                           邮编：
                                          </td>
                                              <td>
                                               <%#LTP.Common.StringPlus.StrCut(Eval("cpost").ToString(), 42, "...")%></td>
                                          </tr>
                                          
                                          <tr>
                                             <td style=" text-align:center; width:30%; font-weight:bold;">
                                           电话 ：
                                          </td>
                                              <td>
                                            <%#LTP.Common.StringPlus.StrCut(Eval("cphone").ToString(), 42, "...")%></td>
                                          </tr>
                                          
                                          <tr>
                                              <td style=" text-align:center; width:30%; font-weight:bold;">
                                            传真：
                                          </td>
                                              <td>
                                              <%#LTP.Common.StringPlus.StrCut(Eval("cfax").ToString(), 42, "...")%></td>
                                          </tr>
                                          
                                          <tr>
                                              <td style=" text-align:center; width:30%; font-weight:bold;">
                                            邮箱：
                                          </td>
                                              <td>
                                              <%#LTP.Common.StringPlus.StrCut(Eval("cemail").ToString(), 82, "...")%></td>
                                          </tr>
                                          
                                          <tr>
                                             <td style=" text-align:center; width:30%; font-weight:bold;">
                                            网址：
                                          </td>
                                              <td>
                                              <%#LTP.Common.StringPlus.StrCut(Eval("cweb").ToString(), 82, "...")%></td>
                                          </tr>
                                          
                                         
                           
             </ItemTemplate>
        </asp:Repeater>
        
       </table>
       <br/>
       <table class="wrap">
        <tr><td class="fontstl3">公司人脉列表</td>
        </tr>
                <tr class="fontstl4"><td>点击员工姓名可查看该员工全部信息</td></tr>
        </table>
               
                <table style="border-collapse:collapse; color:#003399; text-align:center;" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc" class="wrap">
                 <tr  style=" background:#003399; color:#ffffff; font-weight:bold;">
                  <td style=" width:15%">
                        <span><b>姓名</b></span>
                       
                       </td>
                     <td style=" width:10%">
                        <span><b>称呼</b></span>
                       
                    </td >
                     <td style=" width:15%">
                        <span><b>职务</b></span>
                     
                    </td>
                    <td style=" width:25%">
                        <span><b>电话</b></span>
                     
                    </td>
                    
                    <td style=" width:35%">
                        <span><b>地址</b></span>
                       
                    </td>
                                    
                </tr>       
                <asp:Repeater ID="RepInfo" runat="server">
                <ItemTemplate>
                    
                        <tr class="dataTableBody">
                           <td style="padding:5px;"><a href="WXContactinfo.aspx?Id=<%#Eval("id")%>" title="点击查看该员工详细信息" style=" width:15%"><u><%#LTP.Common.StringPlus.StrCut(Eval("linkman").ToString(), 10, "...")%></u></a></td>
                           <td style="padding:5px;">[<%#Eval("chenghu")%>]</td>
                           <td style="padding:5px;">[<%#Eval("job")%>]</td>
                           <td style="padding:5px;">[<%#Eval("phone")%>]</td>
                           <td style="padding:5px;"><%#LTP.Common.StringPlus.StrCut(Eval("address").ToString(), 82, "...")%></td>
                        <tr>
                                  
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
                                      <td style="padding:10px;"><a href="WXProDetail.aspx?Id=<%#Eval("id") %>"><%#LTP.Common.StringPlus.StrCut(Eval("proname").ToString(), 82, "...")%></a>
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