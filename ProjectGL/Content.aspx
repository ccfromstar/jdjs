<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Content.aspx.cs" Inherits="JDJS.Web.ProjectGL.Content" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
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
        jQuery(function() {
            $(".date-pick").datepicker({ changeMonth: true, changeYear: true });
        }); 
</script>
</head>
<body>
    <form id="form1" runat="server">
    <table border="0" cellspacing="0" cellpadding="0" width="100%"  >
   

<tr>
    <td class="left_Bg">
        <table  width="100%" cellpadding="2" cellspacing="0">
         <tr>
            <td>
                 <table width="100%" cellpadding="2" cellspacing="0" id="ZZB" runat="server">
                 <tr>
                    <td><a href="Add.aspx?type=<%=Part%>" class="zPushBtn" ><img src="style/Icons/icon003a2.gif" width="20" height="20" /><b>新建&nbsp;</b></a></td>
                    <td><a href="LinkmanPross.aspx" class="zPushBtn" ><img src="style/Icons/icon003a2.gif" width="20" height="20" /><b>联系人批处理&nbsp;</b></a></td>
                 </tr>
                 </table>
            </td>
         </tr>

         



     
        <asp:Panel ID="Panel9" runat="server" Visible="false">
        <tr>
            <td>
                <table width="100%" cellpadding="2" cellspacing="0">
                <tr>
                    <td style=" width:80px; height:30px;" align="right">工程状态：</td>
                    <td style=" width:100px;">
                        <asp:DropDownList ID="DropDownList2" runat="server">
                            
                        </asp:DropDownList>
                    </td>
                    <td width=70px align=center>
                       关键字：
                    </td>
                    <td width=138px>
                        <asp:TextBox ID="TextBox1" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    <td width=70px align=center>
                        发布日期 从</td>
                    <td width=80px>
                        <asp:TextBox ID="TextBox2" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                    </td>
                    <td width=70px align=center>
                        至</td>
                    <td width=80px>
                       <asp:TextBox ID="TextBox3" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                    </td>
                    <td style=" width:100px; padding-left:50px;" align="center">
                        <asp:LinkButton ID="LinkButton2" runat="server" class="zPushBtn" onclick="LinkButton2_Click" 
                            ><img src="style/Icons/icon040a15.gif" width="20" height="20" /><b>搜索&nbsp;</b></asp:LinkButton><!--<input type="button" value="搜索"  />--></td>
                    <td></td>
                </tr>
                </table>
            </td>
         </tr>
        </asp:Panel>
       
       
      
     
     
       
         <tr>
            <td>
           
            <asp:Panel ID="Panel2" runat="server" Visible="false">
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td>
                        <span style="float:left"><b>工程ID</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td>
                        <span style="float:left"><b>项目名称</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td width="150px;">
                        <span style="float:left"><strong>操作</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                </tr>
                <asp:Repeater ID="Rep2" runat="server">
                <ItemTemplate>
                <tr class="dataTableBody">
                    <td><%#LTP.Common.StringPlus.StrCut(Eval("id").ToString(), 12, "...")%></td>
                    <td><a href="proshowpag.aspx?proid=<%#Eval("id") %>"><%#LTP.Common.StringPlus.StrCut(Eval("proname").ToString(), 82, "...")%></a></td>
                    <td><a href="Edit.aspx?type=<%=Part%>&proid=<%#Eval("id") %>&Act=EditPro" class="zPushBtn"><img src="style/Icons/icon003a4.gif" width="20" height="20" /><b>编辑&nbsp;</b></a><a href="Content.aspx?Operat=delete&type=<%=Part%>&id=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a3.gif" width="20" height="20" /><b>删除&nbsp;</b></a></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="2" align="center">
                    <uc1:UcfarPager ID="UcfarPager5" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                </table>
             </asp:Panel>

            <asp:Panel ID="Panel3" runat="server" Visible="false">
            <table width="100%" cellpadding="2" cellspacing="0">
                <tr>
                    <td style=" width:80px; height:30px;" align="right">人员ID</td>
                    <td style=" width:100px;">
                      <asp:TextBox ID="TextBox6" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    <td style=" width:80px; height:30px;" align="right">姓名：</td>
                    <td style=" width:100px;">
                      <asp:TextBox ID="TextBox7" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    <td style=" width:80px; height:30px;" align="right">职务/职称：</td>
                    <td style=" width:100px;">
                      <asp:TextBox ID="TextBox5" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    <td width=70px align=center>
                       所属公司：
                    </td>
                    <td width=138px>
                        <asp:TextBox ID="TextBox4" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    
                    <td style=" width:100px; padding-left:50px;" align="center">
                        <asp:LinkButton ID="LinkButton1" runat="server" class="zPushBtn"  OnClick="linkmanLB_Check"
                            ><img src="style/Icons/icon040a15.gif" width="20" height="20" /><b>搜索&nbsp;</b></asp:LinkButton><!--<input type="button" value="搜索"  />--></td>
                    <td></td>
                    <td><a href="Content.aspx?type=company" class="zPushBtn" ><img src="style/Icons/icon003a2.gif" width="20" height="20" /><b>公司板块&nbsp;</b></a></td>
                </tr>
                </table>
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td>
                        <span style="float:left"><b>人员ID</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                     <td>
                        <span style="float:left"><b>姓名</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td>
                        <span style="float:left"><b>职务</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td>
                        <span style="float:left"><b>所属公司</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td width="150px;">
                        <span style="float:left"><strong>操作</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                </tr>
                <asp:Repeater ID="Rep3" runat="server">
                <ItemTemplate>
                <tr class="dataTableBody">
                    <td><%#LTP.Common.StringPlus.StrCut(Eval("id").ToString(), 12, "...")%></td>
                    <td><%#LTP.Common.StringPlus.StrCut(Eval("linkman").ToString(), 32, "...")%></td>
                    <td><%#LTP.Common.StringPlus.StrCut(Eval("job").ToString(), 32, "...")%></td>
                    <td><%#LTP.Common.StringPlus.StrCut(Eval("companyname").ToString(), 82, "...")%></td>
                    
                    <td><a href="Edit.aspx?type=<%=Part%>&id=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a4.gif" width="20" height="20" /><b>编辑&nbsp;</b></a><a href="Content.aspx?Operat=delete&type=<%=Part%>&id=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a3.gif" width="20" height="20" /><b>删除&nbsp;</b></a></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="2" align="center">
                    <uc1:UcfarPager ID="UcfarPager6" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                </table>
             </asp:Panel>

              <asp:Panel ID="Panel1" runat="server" Visible="false">
              <table width="100%" cellpadding="2" cellspacing="0">
                <tr>                 
                    
                    <td width=70px align=center>
                       公司名称：
                    </td>
                    <td width=138px>
                        <asp:TextBox ID="TextBox11" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    
                    <td style=" width:100px; padding-left:50px;" align="center">
                        <asp:LinkButton ID="LinkButton3" runat="server" class="zPushBtn"  OnClick="CompanyLB_Check"
                            ><img src="style/Icons/icon040a15.gif" width="20" height="20" /><b>搜索&nbsp;</b></asp:LinkButton><!--<input type="button" value="搜索"  />--></td>
                    <td></td>
                    <td><a href="Content.aspx?type=Renmai" class="zPushBtn" ><img src="style/Icons/icon003a2.gif" width="20" height="20" /><b>人员板块&nbsp;</b></a></td>
                </tr>
                </table>
            <table width="100%" cellpadding="3" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td>
                        <span style="float:left"><b>公司ID</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td>
                        <span style="float:left"><b>公司名称</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td width="150px;">
                        <span style="float:left"><strong>操作</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                </tr>
                <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                <tr class="dataTableBody">
                    <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("pcid").ToString(), 82, "...")%></td>
                    <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("company").ToString(), 82, "...")%></td>
                    <td><a href="Edit.aspx?id=<%#Eval("pcid") %>&type=<%=Part%>" class="zPushBtn" ><img src="style/Icons/icon003a4.gif" width="20" height="20" /><b>编辑&nbsp;</b></a><a href="Content.aspx?Operat=delete&type=<%=Part%>&id=<%#Eval("pcid") %>" class="zPushBtn" ><img src="style/Icons/icon003a3.gif" width="20" height="20" /><b>删除&nbsp;</b></a></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="2" align="center">
                    <uc1:UcfarPager ID="UcfarPager1" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                </table>
             </asp:Panel>
         
            </td>
         </tr>
        </table>
        
    </td>
    <td class="right_Bg"></td>
</tr>
</table>
    </form>
</body>
</html>
