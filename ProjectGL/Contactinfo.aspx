<%@ Page Title="" Language="C#" MasterPageFile="~/ProjectGL/ProMaster.Master" AutoEventWireup="true" CodeBehind="Contactinfo.aspx.cs" Inherits="JDJS.Web.ProjectGL.Contactinfo" %>
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
  
    <table style="width:100%; padding-top:0px; float:right">
    <tr><td>
        <asp:Repeater ID="RepContact" runat="server">
            <ItemTemplate>
                        <tr>
                                         
                                          <tr class="trc1">
                                               <td  colspan="3" style=" text-align:center;" class="Protitle">
                                                <%#LTP.Common.StringPlus.StrCut(Eval("linkman").ToString(), 82, "...")%> - <%#LTP.Common.StringPlus.StrCut(Eval("chenghu").ToString(), 82, "...")%></td>
                                          </tr>
                                          <tr class="trc2">
                                              <td style=" text-align:center; width:15%; font-weight:bold;">
                                           所属公司：
                                          </td>
                                              <td > 
                                                  <a href="Companyinfo.aspx?id=<%#Eval("cid") %>"><%#LTP.Common.StringPlus.StrCut(Eval("companyname").ToString(), 82, "...")%></a></td>                                       
                                          </tr>
                                          <tr class="trc1">
                                             <td style=" text-align:center; width:15%; font-weight:bold;">
                                           所在地：
                                          </td>
                                          <td>
                                                  <%#LTP.Common.StringPlus.StrCut(Eval("place").ToString(), 32, "...")%></td>
                                          </tr>
                                          <tr class="trc2">
                                           <td style=" text-align:center; width:15%; font-weight:bold;">
                                           职务：
                                          </td>
                                          <td>
                                              <%#LTP.Common.StringPlus.StrCut(Eval("job").ToString(), 82, "...")%></td>
                                          </tr>
                                          <tr class="trc1">
                                           <td style=" text-align:center; width:15%; font-weight:bold;">
                                           电话：
                                          </td>
                                              <td>
                                              <%#LTP.Common.StringPlus.StrCut(Eval("phone").ToString(), 82, "...")%></td>
                                          </tr>
                                          <tr class="trc2">
                                            <td style=" text-align:center; width:15%; font-weight:bold;">
                                           传真：
                                          </td>
                                              <td>
                                              <%#LTP.Common.StringPlus.StrCut(Eval("fax").ToString(), 82, "...")%></td>
                                          </tr>
                                          <tr class="trc1">
                                           <td style=" text-align:center; width:15%; font-weight:bold;">
                                            电子邮件：
                                          </td>
                                              <td>
                                             <%#LTP.Common.StringPlus.StrCut(Eval("email").ToString(), 82, "...")%></td>
                                          </tr>
                                          <tr class="trc2">
                                          <td style=" text-align:center; width:15%; font-weight:bold;">
                                            地址：
                                          </td>
                                              <td>
                                              <%#LTP.Common.StringPlus.StrCut(Eval("address").ToString(), 82, "...")%></td>
                                          </tr>
                                         
                           </tr>
             </ItemTemplate>
        </asp:Repeater>
        </td></tr>
       </table>
       <table style="width:100%; padding-top:0px; float:right">
             <tr class="Protitle">
                          <td>
                          <asp:Label ID="prolist" runat="server">相关参与工程列表</asp:Label>
                          </td>
                    </tr>
                    </table>
              <asp:Panel ID="Panelpro" runat="server" Visible="false">
                <table width="100%" cellpadding="3" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td width="150px;">
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
                                      <td><a href="CustProShow.aspx?proid=<%#Eval("proid") %>" title="<%#ReplaceStr(Eval("prorek").ToString(),"<br>","")%>"><%#LTP.Common.StringPlus.StrCut(Eval("proname").ToString(), 62, "...")%></a><%#NewStr(Eval("inforptime", "{0:yyyy-MM-dd}").ToString())%></td>
                                    </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                    
                     <tr>
                    <td colspan="3" align="center">  
                            <uc1:UcfarPager ID="Pager" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                    </td>
                    </tr>
                   
             </table>
             </asp:Panel>
             <table style="width:100%; padding-top:0px; float:right">
             <tr><td>
             <asp:Panel ID="Panelpro2" runat="server" Visible="false">
                <table width="100%" cellpadding="3" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td width="150px;">
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
                      
                                <asp:Repeater ID="Repeaterpro2" runat="server">
                                    <ItemTemplate>
                                    <tr class="dataTableBody">
                                      <td><%#Eval("prostate")%></td>
                                      <td>[<%#Eval("inforptime", "{0:yyyy-MM-dd}")%>]</td>
                                      <td><a href="CustProShow.aspx?proid=<%#Eval("id") %>" title="<%#ReplaceStr(Eval("prorek").ToString(),"<br>","")%>"><%#LTP.Common.StringPlus.StrCut(Eval("proname").ToString(), 62, "...")%></a><%#NewStr(Eval("inforptime", "{0:yyyy-MM-dd}").ToString())%></td>
                                    </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                    
                     <tr>
                    <td colspan="3" align="center">  
                            <uc1:UcfarPager ID="Pager2" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                    </td>
                    </tr>
                   
             </table>
             </asp:Panel>
          </td> </tr>
    </table>
               
        </asp:Panel>
     </div>
</asp:Content>
