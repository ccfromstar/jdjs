<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Content.aspx.cs" Inherits="JDJS.Web.WebManager.Content" %>
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
                    <td><a href="Content.aspx?type=<%=Part%>" class="zPushBtn" ><img src="style/Icons/icon003a2.gif" width="20" height="20" /><b>招标信息&nbsp;</b></a><a href="Content.aspx?type=<%=Part%>&tb=1" class="zPushBtn" ><img src="style/Icons/icon003a2.gif" width="20" height="20" /><b>中标信息&nbsp;</b></a><a href="Add.aspx?type=<%=Part%>" class="zPushBtn" ><img src="style/Icons/icon003a2.gif" width="20" height="20" /><b>新建&nbsp;</b></a></td>
                 </tr>
                 </table>
            </td>
         </tr>

         <asp:Panel ID="PanelHZ" runat="server" Visible="false">
        <tr>
            <td>
                <table width="100%" cellpadding="2" cellspacing="0">
                <tr>
                    <td style=" width:40px; height:30px;" align="right">分类：</td>
                    <td style=" width:100px;">
                        <asp:DropDownList ID="DropDownList6" runat="server">
                            <asp:ListItem Value="-1">全部申请</asp:ListItem>
                            <asp:ListItem Value="0">未付款</asp:ListItem>
                            <asp:ListItem Value="1">已付款</asp:ListItem>
                            
                        </asp:DropDownList>
                    </td>
                    
                    <td width=70px align=center>
                       申请日期： </td>
                    <td width=80px>
                        <asp:TextBox ID="TextBox22" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                    </td>
                    <td width=70px align=center>
                        至 </td>
                    <td width=80px>
                       <asp:TextBox ID="TextBox23" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                    </td>
                    <td width=70px align=center>
                        付款日期： </td>
                    <td width=80px>
                        <asp:TextBox ID="TextBox24" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                    </td>
                    <td width=70px align=center>
                        至 </td>
                    <td width=80px>
                       <asp:TextBox ID="TextBox25" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                    </td>
                    <td style=" width:100px; padding-left:50px;" align="center">
                        <asp:LinkButton ID="LinkButton11" runat="server" class="zPushBtn" 
                      onclick="LinkButton11_Click"><img src="style/Icons/icon040a15.gif" width="20" height="20" /><b>查询&nbsp;</b></asp:LinkButton><!--<input type="button" value="搜索"  />--></td>
                    <td></td>
                </tr>
                </table>
                <table width="100%" cellspacing="0">
                 <tr style=" background:#003399; color:#ffffff; font-weight:bold;" >
                    <td height="30" style=" width: 25%;" align="center" >申请公司</td>
                    <td style=" width: 10%;" align="center">联系人</td>
                    <td style=" width:15%;" align="center">申请时间</td>
                    <td style=" width:15%;" align="center">付款时间</td>
                    <td style=" width:10%;" align="center">总金额</td>
                    <td style=" width:10%;" align="center">所属账号</td>
                    <td style=" width:15%;" align="left">操作</td>
                </tr> 
                <asp:Repeater ID="RepSQ" runat="server">
                <ItemTemplate>
                <tr class="dataTable">
                    
                    <td align="center"><%#LTP.Common.StringPlus.StrCut(Eval("SQcompany").ToString(), 60, "...")%></td>
                    <td align="center"><%#LTP.Common.StringPlus.StrCut(Eval("SQlinkman").ToString(), 30, "...")%></td>
                    <td align="center"><%#Eval("SQtime").ToString()%></td>
                    <td align="center"><%#Getpaytime(Eval("paytime").ToString())%></td>
                    <td align="center"><%#LTP.Common.StringPlus.StrCut(Eval("SQamount").ToString(), 30, "...")%></td>
                    <td align="center"><%#LTP.Common.StringPlus.StrCut(Eval("uid").ToString(), 30, "...")%></td>
                    <td align="right"><a href="Edit.aspx?type=<%=Part%>&Lsid=<%#Eval("LSid") %>&Disid=<%#Eval("Disid") %>" class="zPushBtn" ><img alt="" src="style/Icons/icon003a4.gif" width="20" height="20" /><b>查看详情 </b></a></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
                <tr><td style=" width:100%" align="right" colspan="6">   
                        申请金额总计：<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>（元）
                </td></tr>
                <tr>
                    <td colspan="9" align="center">
                    <uc1:UcfarPager ID="UcfarPager11" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                
                </table>
            </td>
         </tr>
        </asp:Panel>



        <asp:Panel ID="Panel4" runat="server" Visible="false">
        <tr>
            <td>
                <table width="100%" cellpadding="2" cellspacing="0">
                <tr>
                    <td style=" width:40px; height:30px;" align="right">分类：</td>
                    <td style=" width:100px;">
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Value="建筑行业">新闻提要</asp:ListItem>
                            <asp:ListItem>建筑节能材料</asp:ListItem>
                            <asp:ListItem>协会信息</asp:ListItem>
                            <asp:ListItem>招聘信息</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td width=70px align=center>
                       关键字：
                    </td>
                    <td width=138px>
                        <asp:TextBox ID="txtTitle" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    <td width=70px align=center>
                        开始日期：</td>
                    <td width=80px>
                        <asp:TextBox ID="txtBg" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                    </td>
                    <td width=70px align=center>
                        结束日期：</td>
                    <td width=80px>
                       <asp:TextBox ID="txtEnd" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                    </td>
                    <td style=" width:100px; padding-left:50px;" align="center">
                        <asp:LinkButton ID="LinkButton1" runat="server" class="zPushBtn" 
                            onclick="LinkButton1_Click"><img src="style/Icons/icon040a15.gif" width="20" height="20" /><b>搜索&nbsp;</b></asp:LinkButton><!--<input type="button" value="搜索"  />--></td>
                    <td></td>
                </tr>
                </table>
            </td>
         </tr>
        </asp:Panel>
        <asp:Panel ID="Panel9" runat="server" Visible="false">
        <tr>
            <td>
                <table width="100%" cellpadding="2" cellspacing="0">
                <tr>
                    <td style=" width:40px; height:30px;" align="right">分类：</td>
                    <td style=" width:100px;">
                        <asp:DropDownList ID="DropDownList2" runat="server">
                            <asp:ListItem Value="0">招标信息</asp:ListItem>
                            <asp:ListItem Value="1">中标信息</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td width=70px align=center>
                       关键字：
                    </td>
                    <td width=138px>
                        <asp:TextBox ID="TextBox1" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    <td width=70px align=center>
                        开始日期：</td>
                    <td width=80px>
                        <asp:TextBox ID="TextBox2" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                    </td>
                    <td width=70px align=center>
                        结束日期：</td>
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
        <asp:Panel ID="Panel10" runat="server" Visible="false">
        <tr>
            <td>
                <table width="100%" cellpadding="2" cellspacing="0">
                <tr> 
                    <td width=70px align=center>
                       公司名：
                    </td>
                    <td width=138px>
                        <asp:TextBox ID="TextBox4" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    <td style=" width:100px; padding-left:50px;" align="center">
                        <asp:LinkButton ID="LinkButton3" runat="server" class="zPushBtn" onclick="LinkButton3_Click" 
                            ><img src="style/Icons/icon040a15.gif" width="20" height="20" /><b>搜索&nbsp;</b></asp:LinkButton><!--<input type="button" value="搜索"  />--></td>
                    <td></td>
                </tr>
                </table>
            </td>
         </tr>
        </asp:Panel>
        <asp:Panel ID="Panel11" runat="server" Visible="false">
        <tr>
            <td>
                <table width="100%" cellpadding="2" cellspacing="0">
                <tr>
                    <td style=" width:40px; height:30px;" align="right">分类：</td>
                    <td style=" width:100px;">
                        <asp:DropDownList ID="DropDownList3" runat="server">
                            <asp:ListItem>主材快讯</asp:ListItem>
                            <asp:ListItem>定额管理</asp:ListItem>
                            <asp:ListItem>标准管理</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td width=70px align=center>
                       关键字：
                    </td>
                    <td width=138px>
                        <asp:TextBox ID="TextBox5" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    <td width=70px align=center>
                        开始日期：</td>
                    <td width=80px>
                        <asp:TextBox ID="TextBox6" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                    </td>
                    <td width=70px align=center>
                        结束日期：</td>
                    <td width=80px>
                       <asp:TextBox ID="TextBox7" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                    </td>
                    <td style=" width:100px; padding-left:50px;" align="center">
                        <asp:LinkButton ID="LinkButton4" runat="server" class="zPushBtn" onclick="LinkButton4_Click" 
                            ><img src="style/Icons/icon040a15.gif" width="20" height="20" /><b>搜索&nbsp;</b></asp:LinkButton><!--<input type="button" value="搜索"  />--></td>
                    <td></td>
                </tr>
                </table>
            </td>
         </tr>
        </asp:Panel>
        <asp:Panel ID="Panel12" runat="server" Visible="false">
         <tr>
            <td>
                <table width="100%" cellpadding="2" cellspacing="0">
                <tr>
                    <td style=" width:40px; height:30px;" align="right">分类：</td>
                    <td style=" width:100px;">
                        <asp:DropDownList ID="DropDownList4" runat="server">
                            <asp:ListItem>法律</asp:ListItem>
                            <asp:ListItem>行政法规</asp:ListItem>
                            <asp:ListItem>部门规章</asp:ListItem>
                            <asp:ListItem>地方性法规和规章</asp:ListItem>
                            <asp:ListItem>各类文件</asp:ListItem>
                            <asp:ListItem>最新公告</asp:ListItem>
                            <asp:ListItem>通知提示</asp:ListItem>
                            <asp:ListItem>诚信手册</asp:ListItem>
                            <asp:ListItem>安全生产许可证</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td width=70px align=center>
                       关键字：
                    </td>
                    <td width=138px>
                        <asp:TextBox ID="TextBox8" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    <td width=70px align=center>
                        开始日期：</td>
                    <td width=80px>
                        <asp:TextBox ID="TextBox9" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                    </td>
                    <td width=70px align=center>
                        结束日期：</td>
                    <td width=80px>
                       <asp:TextBox ID="TextBox10" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                    </td>
                    <td style=" width:100px; padding-left:50px;" align="center">
                        <asp:LinkButton ID="LinkButton5" runat="server" class="zPushBtn" onclick="LinkButton5_Click" 
                            ><img src="style/Icons/icon040a15.gif" width="20" height="20" /><b>搜索&nbsp;</b></asp:LinkButton><!--<input type="button" value="搜索"  />--></td>
                    <td></td>
                </tr>
                </table>
            </td>
         </tr>
         </asp:Panel>
        <asp:Panel ID="Panel13" runat="server" Visible="false">
         <tr>
            <td>
                <table width="100%" cellpadding="2" cellspacing="0">
                <tr>
                    <td style=" width:40px; height:30px;" align="right">分类：</td>
                    <td style=" width:100px;">
                        <asp:DropDownList ID="DropDownList5" runat="server">
                            <asp:ListItem>年包</asp:ListItem>
                            <asp:ListItem>月包</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td width=70px align=center>
                       关键字：
                    </td>
                    <td width=138px>
                        <asp:TextBox ID="TextBox11" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    <td width=70px align=center>
                        开始日期：</td>
                    <td width=80px>
                        <asp:TextBox ID="TextBox12" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                    </td>
                    <td width=70px align=center>
                        结束日期：</td>
                    <td width=80px>
                       <asp:TextBox ID="TextBox13" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                    </td>
                    <td style=" width:100px; padding-left:50px;" align="center">
                        <asp:LinkButton ID="LinkButton6" runat="server" class="zPushBtn" onclick="LinkButton6_Click" 
                            ><img src="style/Icons/icon040a15.gif" width="20" height="20" /><b>搜索&nbsp;</b></asp:LinkButton><!--<input type="button" value="搜索"  />--></td>
                    <td></td>
                </tr>
                </table>
            </td>
         </tr>
         </asp:Panel>
        <asp:Panel ID="Panel14" runat="server" Visible="false">
         <tr>
            <td>
                <table width="100%" cellpadding="2" cellspacing="0">
                <tr>
                    <td width=70px align=center>
                       用户名：
                    </td>
                    <td width=138px>
                        <asp:TextBox ID="TextBox14" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    <td width=70px align=center>
                       公司名：
                    </td>
                    <td width=138px>
                        <asp:TextBox ID="TextBox15" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    <td style=" width:100px; padding-left:50px;" align="center">
                        <asp:LinkButton ID="LinkButton7" runat="server" class="zPushBtn" onclick="LinkButton7_Click" 
                            ><img src="style/Icons/icon040a15.gif" width="20" height="20" /><b>搜索&nbsp;</b></asp:LinkButton><!--<input type="button" value="搜索"  />--></td>
                    <td></td>
                </tr>
                </table>
            </td>
         </tr>
         </asp:Panel>
        <asp:Panel ID="Panel16" runat="server" Visible="false">
         <tr>
            <td>
                <table width="100%" cellpadding="2" cellspacing="0">
                <tr>
                    <td width=70px align=center>
                       cid：
                    </td>
                    <td width=138px>
                        <asp:TextBox ID="TextBox16" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    <td width=70px align=center>
                       公司名：
                    </td>
                    <td width=138px>
                        <asp:TextBox ID="TextBox17" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    <td style=" width:100px; padding-left:50px;" align="center">
                        <asp:LinkButton ID="LinkButton8" runat="server" class="zPushBtn" onclick="LinkButton8_Click" 
                            ><img src="style/Icons/icon040a15.gif" width="20" height="20" /><b>搜索&nbsp;</b></asp:LinkButton><!--<input type="button" value="搜索"  />--></td>
                    <td></td>
                </tr>
                </table>
            </td>
         </tr>
        </asp:Panel>
        <asp:Panel ID="Panel18" runat="server" Visible="false">
         <tr>
            <td>
                <table width="100%" cellpadding="2" cellspacing="0">
                <tr>
                    <td width=70px align=center>
                       材料编码：
                    </td>
                    <td width=138px>
                        <asp:TextBox ID="TextBox18" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    <td width=70px align=center>
                       材料名：
                    </td>
                    <td width=138px>
                        <asp:TextBox ID="TextBox19" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    <td style=" width:100px; padding-left:50px;" align="center">
                        <asp:LinkButton ID="LinkButton9" runat="server" class="zPushBtn" onclick="LinkButton9_Click" 
                            ><img src="style/Icons/icon040a15.gif" width="20" height="20" /><b>搜索&nbsp;</b></asp:LinkButton>
                            </td>
                    <td>
                    <a class="zPushBtn" href="realDetail.aspx"><img src="style/Icons/icon040a15.gif" width="20" height="20" /><b>查询详情&nbsp;</b></a>
                    </td>
                </tr>
                </table>
            </td>
         </tr>
        </asp:Panel>
        <asp:Panel ID="Panel20" runat="server" Visible="false">
         <tr>
            <td>
                <table width="100%" cellpadding="2" cellspacing="0">
                <tr>
                    <td width=70px align=center>
                       公告标题：
                    </td>
                    <td width=138px>
                        <asp:TextBox ID="TextBox20" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    <td style=" width:100px; padding-left:50px;" align="center">
                        <asp:LinkButton ID="LinkButton10" runat="server" class="zPushBtn" onclick="LinkButton10_Click" 
                            ><img src="style/Icons/icon040a15.gif" width="20" height="20" /><b>搜索&nbsp;</b></asp:LinkButton><!--<input type="button" value="搜索"  />--></td>
                    <td></td>
                </tr>
                </table>
            </td>
         </tr>
        </asp:Panel>
         <tr>
            <td>
            <asp:Panel ID="Panel1" runat="server" Visible=false>
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td>
                        <span style="float:left"><b>标题</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td width="150px;">
                        <span style="float:left"><strong>操作</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                </tr>
                <asp:Repeater ID="Rep1" runat="server">
                <ItemTemplate>
                <tr class="dataTableBody">
                    <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("title").ToString(),82,"...") %></td>
                    <td><a href="Edit.aspx?type=<%=Part%>&id=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a4.gif" width="20" height="20" /><b>编辑&nbsp;</b></a><a href="Content.aspx?Operat=delete&type=<%=Part%>&id=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a3.gif" width="20" height="20" /><b>删除&nbsp;</b></a></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="2" align="center">
                    <uc1:UcfarPager ID="Pager" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                </table>
             </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" Visible=false>
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
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
                    <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("项目名称").ToString(), 82, "...")%></td>
                    <td><a href="Edit.aspx?type=<%=Part%>&id=<%#Eval("序号") %>" class="zPushBtn" ><img src="style/Icons/icon003a4.gif" width="20" height="20" /><b>编辑&nbsp;</b></a><a href="Content.aspx?Operat=delete&type=<%=Part%>&id=<%#Eval("序号") %>" class="zPushBtn" ><img src="style/Icons/icon003a3.gif" width="20" height="20" /><b>删除&nbsp;</b></a></td>
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
            <asp:Panel ID="Panel3" runat="server" Visible=false>
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td>
                        <span style="float:left"><b>项目名称</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td width="150px;">
                        <span style="float:left"><strong>操作</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                </tr>
                <asp:Repeater ID="Rep3" runat="server">
                <ItemTemplate>
                <tr class="dataTableBody">
                    <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("company").ToString(), 82, "...")%></td>
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
            <asp:Panel ID="Panel5" runat="server" Visible=false>
              <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td>
                        <span style=" width:200px; float:left"><b>标题</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td width="150px;">
                        <span style="float:left"><strong>操作</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                </tr>
                <asp:Repeater ID="Rep5" runat="server">
                <ItemTemplate>
                <tr class="dataTableBody">
                    <td><%#LTP.Common.StringPlus.StrCut(Eval("title").ToString(), 82, "...")%></td>
                    <td><a href="Edit.aspx?type=<%=Part%>&id=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a4.gif" width="20" height="20" /><b>编辑&nbsp;</b></a><a href="Content.aspx?Operat=delete&type=<%=Part%>&id=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a3.gif" width="20" height="20" /><b>删除&nbsp;</b></a></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="2" align="center">
                    <uc1:UcfarPager ID="UcfarPager4" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                </table>
              </asp:Panel>
            <asp:Panel ID="Panel6" runat="server" Visible=false>
              <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td>
                        <span style=" width:200px; float:left"><b>标题</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td width="150px;">
                        <span style="float:left"><strong>操作</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                </tr>
                <asp:Repeater ID="Rep6" runat="server">
                <ItemTemplate>
                <tr class="dataTableBody">
                    <td><%#LTP.Common.StringPlus.StrCut(Eval("title").ToString(), 82, "...")%></td>
                    <td><a href="Edit.aspx?type=<%=Part%>&id=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a4.gif" width="20" height="20" /><b>编辑&nbsp;</b></a><a href="Content.aspx?Operat=delete&type=<%=Part%>&id=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a3.gif" width="20" height="20" /><b>删除&nbsp;</b></a></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="2" align="center">
                    <uc1:UcfarPager ID="UcfarPager3" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                </table>
              </asp:Panel>
            <asp:Panel ID="Panel7" runat="server" Visible=false>
              <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td>
                        <span style=" width:200px; float:left"><b>标题</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td width="150px;">
                        <span style="float:left"><strong>操作</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                </tr>
                <asp:Repeater ID="Rep7" runat="server">
                <ItemTemplate>
                <tr class="dataTableBody">
                    <td><%#LTP.Common.StringPlus.StrCut(Eval("bookname").ToString(), 82, "...")%></td>
                    <td><a href="Edit.aspx?type=<%=Part%>&id=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a4.gif" width="20" height="20" /><b>编辑&nbsp;</b></a><a href="Content.aspx?Operat=delete&type=<%=Part%>&id=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a3.gif" width="20" height="20" /><b>删除&nbsp;</b></a></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="2" align="center">
                    <uc1:UcfarPager ID="UcfarPager2" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                </table>
              </asp:Panel>
            <asp:Panel ID="Panel8" runat="server" Visible=false>
              <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td>
                        <span style=" width:200px; float:left"><b>用户名</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td>
                        <span style="float:left"><b>公司名</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td>
                        <span style="width:100px;float:left"><b>联系人</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td width="150px;">
                        <span style="float:left"><strong>操作</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                </tr>
                <asp:Repeater ID="Rep8" runat="server">
                <ItemTemplate>
                <tr class="dataTableBody">
                    <td><%#LTP.Common.StringPlus.StrCut(Eval("newcode").ToString(),82,"...") %></td>
                    <td><%#LTP.Common.StringPlus.StrCut(Eval("unit").ToString(),82,"...") %></td>
                    <td><%#LTP.Common.StringPlus.StrCut(Eval("linkman").ToString(),82,"...") %></td>
                    <td><a href="Edit.aspx?type=<%=Part%>&id=<%#Eval("newcode") %>" class="zPushBtn" ><img src="style/Icons/icon003a4.gif" width="20" height="20" /><b>编辑&nbsp;</b></a><a href="Content.aspx?Operat=delete&type=<%=Part%>&id=<%#Eval("newcode") %>" class="zPushBtn" ><img src="style/Icons/icon003a3.gif" width="20" height="20" /><b>删除&nbsp;</b></a></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="4" align="center">
                    <uc1:UcfarPager ID="UcfarPager1" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                </table>
              </asp:Panel>
            <asp:Panel ID="Panel15" runat="server" Visible=false>
              <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td>
                        <span style=" width:200px; float:left"><b>cid</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td>
                        <span style="float:left"><b>公司名</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td width="150px;">
                        <span style="float:left"><strong>操作</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                </tr>
                <asp:Repeater ID="Rep15" runat="server">
                <ItemTemplate>
                <tr class="dataTableBody">
                    <td><%#LTP.Common.StringPlus.StrCut(Eval("cid").ToString(),82,"...") %></td>
                    <td><%#LTP.Common.StringPlus.StrCut(Eval("company").ToString(),82,"...") %></td>
                    <td><a href="Edit.aspx?type=<%=Part%>&id=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a4.gif" width="20" height="20" /><b>编辑&nbsp;</b></a><a href="Content.aspx?Operat=delete&type=<%=Part%>&id=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a3.gif" width="20" height="20" /><b>删除&nbsp;</b></a></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="3" align="center">
                    <uc1:UcfarPager ID="UcfarPager7" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="Panel17" runat="server" Visible=false>
              <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td>
                        <span style=" width:200px; float:left"><b>材料名</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td>
                        <span style="float:left"><b>材料编码</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td>
                        <span style="width:100px;float:left"><b>供应商</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td>
                        <span style="width:100px;float:left"><b>特供价</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td width="150px;">
                        <span style="float:left"><strong>操作</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                </tr>
                <asp:Repeater ID="Rep9" runat="server">
                <ItemTemplate>
                <tr class="dataTableBody">
                    <td><%#LTP.Common.StringPlus.StrCut(Eval("zname").ToString(), 82, "...")%></td>
                    <td><%#LTP.Common.StringPlus.StrCut(Eval("seachid").ToString(), 82, "...")%></td>
                    <td><%#GetCpName(Eval("cid").ToString())%></td>
                    <td><%#Eval("bid")%></td>
                    <td><a href="Edit.aspx?type=<%=Part%>&id=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a4.gif" width="20" height="20" /><b>编辑&nbsp;</b></a><a href="Content.aspx?Operat=delete&type=<%=Part%>&id=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a3.gif" width="20" height="20" /><b>删除&nbsp;</b></a></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="5" align="center">
                    <uc1:UcfarPager ID="UcfarPager8" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="Panel19" runat="server" Visible=false>
              <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td>
                        <strong>公告标题</strong>
                    </td>
                    <td width="100px">
                        <strong>发布日期</strong>
                    </td>
                    <td width="150px;">
                        <strong>操作</strong>
                    </td>
                </tr>
                <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                <tr class="dataTableBody">
                    <td><%#LTP.Common.StringPlus.StrCut(Eval("title").ToString(), 82, "...")%></td>
                    <td><%# DateTime.Parse(Eval("ptime").ToString()).ToShortDateString()%></td>
                    <td><a href="Edit.aspx?type=<%=Part%>&id=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a4.gif" width="20" height="20" /><b>编辑&nbsp;</b></a><a href="Content.aspx?Operat=delete&type=<%=Part%>&id=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a3.gif" width="20" height="20" /><b>删除&nbsp;</b></a></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="3" align="center">
                    <uc1:UcfarPager ID="UcfarPager9" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                </table>
              </asp:Panel>
              <asp:Panel ID="Panel21" runat="server" Visible=false>
              <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td>
                        <strong>标题</strong>
                    </td>
                    <td width="100px">
                        <strong>发布日期</strong>
                    </td>
                    <td width="150px;">
                        <strong>操作</strong>
                    </td>
                </tr>
                <asp:Repeater ID="Repeater2" runat="server">
                <ItemTemplate>
                <tr class="dataTableBody">
                    <td><%#LTP.Common.StringPlus.StrCut(Eval("title").ToString(), 82, "...")%></td>
                    <td><%# DateTime.Parse(Eval("update").ToString()).ToShortDateString()%></td>
                    <td><a href="Content.aspx?Operat=delete&type=<%=Part%>&id=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a3.gif" width="20" height="20" /><b>删除&nbsp;</b></a></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="3" align="center">
                    <uc1:UcfarPager ID="UcfarPager10" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
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
