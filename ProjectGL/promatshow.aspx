<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="promatshow.aspx.cs" Inherits="JDJS.Web.ProjectGL.promatshow" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
</head>
<body>
    <form id="form1" runat="server">
    <div></div>
    <asp:Panel ID="Panel1" runat="server">
        
     
         
        <table style="width: 100%;">
                    <tr>
                        <td width=20%>
                            姓名：
                        </td>
                        <td>
                            <asp:Label ID="lblinkman" runat="server" ></asp:Label>
                            <asp:Label ID="lbchenghu" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            所属公司：
                        </td>
                        <td>
                            <asp:Label ID="lbcompany" runat="server" Font-Bold="True" ></asp:Label>
                        </td>
                    </tr>
                   
                    <tr>
                        <td>
                            部门/职务：
                        </td>
                        <td>
                           <asp:Label ID="lbjob" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            地址：
                        </td>
                        <td>
                            <asp:Label ID="lbaddress" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            电话：
                        </td>
                        <td>
                            <asp:Label ID="lbphone" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           传真：
                        </td>
                        <td>
                           <asp:Label ID="lbfax" runat="server" ></asp:Label>
                        </td>
                    </tr>
                     <tr>
                         <td>
                             Email:
                         </td>
                         <td>
                             <asp:Label ID="lbEmail" runat="server"></asp:Label>
                         </td>
                    </tr>
                    <tr>
                         <td>
                             工程角色:
                         </td>
                         <td>
                             <asp:Label ID="lbjuese" runat="server"></asp:Label>
                         </td>
                    </tr>
                    <tr>
                         <td>
                             描述备注:
                         </td>
                         <td>
                             <asp:Label ID="lbrek" runat="server"></asp:Label>
                         </td>
                    </tr>
                     <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                       
                    
                </table>
                <table>
                 <tr>
                    <td>
                            <asp:Label ID="ownertext" runat="server" Font-Bold="True">负责采购材料清单：</asp:Label>
                        </td>
                     </tr>

                    <tr style=" width:90%">     
                       
                                <td style=" width:20%">
                                <span style="float:left"><b>材料名称</b></span><img height="12" 
                                    src="style/images/icon_sort.gif" style="float:right" width="12"> </img></td>
                                    <td style=" width:10%">
                                <span style="float:left"><b>品牌要求</b></span><img height="12" 
                                    src="style/images/icon_sort.gif" style="float:right" width="12"> </img></td>
                                <td style=" width:10%">
                                    <span style="float:left"><b>计量单位</b></span><img height="12" 
                                        src="style/images/icon_sort.gif" style="float:right" width="12"> </img></td>
                                <td style=" width:10%">
                                    <span style="float:left"><b>型号</b></span><img height="12" 
                                        src="style/images/icon_sort.gif" style="float:right" width="12"> </img></td>
                                <td style=" width:10%">
                                    <span style="float:left"><b>规格</b></span><img height="12" 
                                        src="style/images/icon_sort.gif" style="float:right" width="12"> </img></td>
                                <td style=" width:10%">
                                    <span style="float:left"><b>采购总量</b></span><img height="12" 
                                        src="style/images/icon_sort.gif" style="float:right" width="12"> </img></td>
                                <td style=" width:10%">
                                    <span style="float:left"><b>采购价格</b></span><img height="12" 
                                        src="style/images/icon_sort.gif" style="float:right" width="12"> </img></td>
                                <td style=" width:10%">
                                    <span style="float:left"><b>采购开始日期</b></span><img height="12" 
                                        src="style/images/icon_sort.gif" style="float:right" width="12"> </img></td>
                                <td style=" width:10%">
                                    <span style="float:left"><b>采购结束日期</b></span><img height="12" 
                                        src="style/images/icon_sort.gif" style="float:right" width="12"> </img></td>
                        
                    </tr>
                    
                    
                    <asp:Repeater ID="Repmatlist" runat="server">
                        <ItemTemplate>
                            <tr class="dataTableBody">
                                <td style="">
                                    <%#LTP.Common.StringPlus.StrCut(Eval("matname").ToString(), 82, "...")%>
                                </td>
                                <td style="">
                                    <%#LTP.Common.StringPlus.StrCut(Eval("matclass").ToString(), 82, "...")%>
                                </td>
                                <td style="">
                                    <%#LTP.Common.StringPlus.StrCut(Eval("matunit").ToString(), 82, "...")%>
                                </td>
                                <td style="">
                                    <%#LTP.Common.StringPlus.StrCut(Eval("matxh").ToString(), 82, "...")%>
                                </td>
                                <td style="">
                                    <%#LTP.Common.StringPlus.StrCut(Eval("matgg").ToString(), 82, "...")%>
                                </td>
                                <td style="">
                                    <%#LTP.Common.StringPlus.StrCut(Eval("matamount").ToString(), 82, "...")%>
                                </td>
                                <td style="">
                                    <%#LTP.Common.StringPlus.StrCut(Eval("matlprice").ToString(), 82, "...")%>
                                </td>
                                <td style="">
                                    <%#LTP.Common.StringPlus.StrCut(Eval("stime").ToString(), 82, "...")%>
                                </td>
                                <td style="">
                                    <%#LTP.Common.StringPlus.StrCut(Eval("ftime").ToString(), 82, "...")%>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                                 
                 <tr>
                    <td colspan="8" align="center">
                    <uc1:UcfarPager ID="UcfarPager6" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                </table>
    </asp:Panel>
    
    </form>
</body>
</html>
