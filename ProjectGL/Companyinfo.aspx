<%@ Page Title="" Language="C#" MasterPageFile="~/ProjectGL/ProMaster.Master" AutoEventWireup="true" CodeBehind="Companyinfo.aspx.cs" Inherits="JDJS.Web.ProjectGL.Companyinfo" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title></title>
    <link href="../style/page.css" type="text/css" rel="stylesheet" />
    <link href="style/base.css" rel="Stylesheet" type="text/css" />
    <link href="style/layout.css" rel="Stylesheet" type="text/css" />
    <link href="style/model.css" rel="Stylesheet" type="text/css" />
    <link rel="Stylesheet" href="../style/datePicker.css" type="text/css" />
    <script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="js/onload.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/jquery.core.js"></script>
    <script type="text/javascript" src="../js/jquery.datePicker.js"></script>
    <script type="text/javascript">
        jQuery(function () {
            $(".date-pick").datepicker({ changeMonth: true, changeYear: true });
        }); 
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">

<div style="width:88%; padding-top:0px; float:right">
<asp:Panel ID="Panel1" runat="server" class="trc2">
  
    <table width="100%">
    <tr style=" text-align:center">
        <td>
        <asp:Repeater ID="RepCompany" runat="server">
            <ItemTemplate>
                        
                                          <tr class="trc1">
                                              <td class="Protitle" colspan="2">
                                                  <%#LTP.Common.StringPlus.StrCut(Eval("company").ToString(), 82, "...")%>
                                              </td>
                                          </tr>
                                          <tr  class="trc2">
                                          <td style=" text-align:center; width:15%; font-weight:bold;">
                                           公司性质：
                                          </td>
                                              <td style="">
                                              <%#LTP.Common.StringPlus.StrCut(Eval("ctype").ToString(), 22, "...")%></td>
                                          </tr>
                                           <tr  class="trc1">
                                           <td style=" text-align:center; width:15%; font-weight:bold;">
                                           所在地区：
                                          </td>
                                              <td style="">
                                            
                                               <%#LTP.Common.StringPlus.StrCut(Eval("cplace").ToString(), 22, "...")%></td>
                                          </tr>
                                           <tr  class="trc2">
                                             <td style=" text-align:center; width:15%; font-weight:bold;">
                                           地址：
                                          </td>
                                              <td style="">
                                               <%#LTP.Common.StringPlus.StrCut(Eval("caddress").ToString(), 82, "...")%></td>
                                          </tr>
                                          
                                           <tr  class="trc1">
                                           <td style=" text-align:center; width:15%; font-weight:bold;">
                                           邮编：
                                          </td>
                                              <td style="">
                                               <%#LTP.Common.StringPlus.StrCut(Eval("cpost").ToString(), 42, "...")%></td>
                                          </tr>
                                          
                                          <tr  class="trc2">
                                             <td style=" text-align:center; width:15%; font-weight:bold;">
                                           电话 ：
                                          </td>
                                              <td style="">
                                            <%#LTP.Common.StringPlus.StrCut(Eval("cphone").ToString(), 42, "...")%></td>
                                          </tr>
                                          
                                          <tr  class="trc1">
                                              <td style=" text-align:center; width:15%; font-weight:bold;">
                                            传真：
                                          </td>
                                              <td style="">
                                              <%#LTP.Common.StringPlus.StrCut(Eval("cfax").ToString(), 42, "...")%></td>
                                          </tr>
                                          
                                          <tr  class="trc2">
                                              <td style=" text-align:center; width:15%; font-weight:bold;">
                                            邮箱：
                                          </td>
                                              <td style="">
                                              <%#LTP.Common.StringPlus.StrCut(Eval("cemail").ToString(), 82, "...")%></td>
                                          </tr>
                                          
                                          <tr  class="trc1">
                                             <td style=" text-align:center; width:15%; font-weight:bold;">
                                            网址：
                                          </td>
                                              <td style="">
                                              <%#LTP.Common.StringPlus.StrCut(Eval("cweb").ToString(), 82, "...")%></td>
                                          </tr>
                                          
                                         
                           
             </ItemTemplate>
        </asp:Repeater>
        </td>
       </tr>
       </table>
       <table>
        <tr><td class="Protitle">公司人脉列表</td></tr>
                <tr class="dataTableHead"><td>点击员工姓名可查看该员工全部信息</td></tr>
               
                <tr>
                <td>
                <table width="100%" cellpadding="5" cellspacing="0" class="dataTable">
                 <tr class="dataTableHead">
                  <td width="150px;">
                        <span style="float:left"><strong>姓名</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                       </td>
                     <td width="150px;">
                        <span style="float:left"><strong>称呼</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                     <td width="150px;">
                        <span style="float:left"><strong>职务</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td width="150px;">
                        <span style="float:left"><strong>电话</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    
                    <td>
                        <span style="float:left"><b>地址</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                                    
                </tr>       
                <asp:Repeater ID="RepInfo" runat="server">
                <ItemTemplate>
                    
                        <tr class="dataTableBody">
                           <td><a href="Contactinfo.aspx?Id=<%#Eval("id")%>" title="点击查看该员工详细信息" style=" width:15%"><u><%#LTP.Common.StringPlus.StrCut(Eval("linkman").ToString(), 10, "...")%></u></a></td>
                           <td>[<%#Eval("chenghu")%>]</td>
                           <td>[<%#Eval("job")%>]</td>
                           <td>[<%#Eval("phone")%>]</td>
                           <td><%#LTP.Common.StringPlus.StrCut(Eval("address").ToString(), 82, "...")%></td>
                        <tr>
                                  
                </ItemTemplate>
                </asp:Repeater>
                </table> 
               </td>
               </tr> 
             </table>
             <table>
                    <tr><td class="Protitle">
                          <asp:Label ID="prolist" runat="server">相关参与工程列表</asp:Label>
                          </td>
                    </tr>
                    <tr>
                    <td>
                   <table width="100%" cellpadding="5" cellspacing="0" class="dataTable">
                  <tr>
                      <td class="dataTableHead" width="150px;">
                        
                        <span style="float:left"><strong>项目状态</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                       </td>
                     <td width="150px;">
                        <span style="float:left"><strong>发布日期</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    
                    <td>
                        <span style="float:left"><b>项目名称</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                                    
                </tr> 
                
                                <asp:Repeater ID="Repeaterpro" runat="server">
                                    <ItemTemplate>
                                    <tr class="dataTableBody">
                                      <td><%#Eval("prostate")%></td>
                                      <td>[<%#Eval("inforptime", "{0:yyyy-MM-dd}")%>]</td>
                                      <td><a href="CustProShow.aspx?proid=<%#Eval("id") %>" title="<%#ReplaceStr(Eval("prorek").ToString(),"<br>","")%>"><%#LTP.Common.StringPlus.StrCut(Eval("proname").ToString(), 62, "...")%></a><%#NewStr(Eval("inforptime", "{0:yyyy-MM-dd}").ToString())%></td>
                                    </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                 <tr>
                                <td  colspan="3" align="center">  
                                    <uc1:UcfarPager ID="Pager" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                                </td>
                                </tr>
                  
                    </table>
                    </td>
                    </tr>
                   </table> 
              
        </asp:Panel>
     </div>
</asp:Content>
