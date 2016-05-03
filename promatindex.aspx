<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="promatindex.aspx.cs" Inherits="JDJS.Web.promatindex" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
  <link rel="Stylesheet" href="style/datePicker.css" type="text/css" />
     <script type="text/javascript" src="js/jquery.core.js"></script>
     <script type="text/javascript" src="js/jquery.datePicker.js"></script>
     <script type="text/javascript">
         jQuery(function () {
             $(".date-pick").datepicker({ changeMonth: true, changeYear: true });
         }); 
</script>
<div class="dspagtitle"><span>工程采购信息</span></div>

<table>
<tr>
    <td>
         <td width=70px align=center>
                       关键字：
                    </td>
                    <td width=138px>
                        <asp:TextBox ID="txtTitle" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    <td width=70px align=center>
                        发布日期 从</td>
                    <td width=80px>
                        <asp:TextBox ID="txtBg" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                    </td>
                    <td width=70px align=center>
                        至</td>
                    <td width=80px>
                       <asp:TextBox ID="txtEnd" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                    </td>
                    <td style=" width:100px; padding-left:50px;" align="center">
                        <asp:Button ID="Button1" runat="server" Text="点击搜索"  OnClick="LinkButton2_Click"/>
                     </td>
                    <td></td>
    </td>
</tr>
</table>
 <table style="width:765px;border-collapse:collapse; color:#003399; text-align:center;" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc">
                 

                    <tr style=" background:#003399; color:#ffffff; font-weight:bold;">     
                       
                                <td style=" width:20%">
                                <span><b>材料名称</b></span></td>
                                <td style=" width:60%">
                                <span><b>工程名称</b></span></td>
                                 <!-- <td style=" width:10%">
                                <span><b>品牌要求</b></span></td>
                                <td style=" width:5%">
                                    <span><b>单位</b></span></td>
                                <td style=" width:12%">
                                    <span><b>型号</b></span></td>
                                <td style=" width:15%">
                                    <span><b>规格</b></span></td>
                                <td style=" width:8%">
                                    <span><b>采购量</b></span></td>
                                <td style=" width:10%">
                                    <span><b>采购价格</b></span></td>-->
                                <td style=" width:10%">
                                    <span><b>采购起始</b></span></td>
                                <td style=" width:10%">
                                    <span><b>采购截止</b></span></td>
                        
                    </tr>
                    
                    
                    <asp:Repeater ID="Repmatlist" runat="server">
                        <ItemTemplate>
                            <tr class="dataTableBody">
                                <td style="padding-top:10px; padding-bottom:10px;">
                                    <a href="promatinfo.aspx?Id=<%#Eval("id")%>" title="点击查看采购详情"  style="text-decoration:underline;"><%#LTP.Common.StringPlus.StrCut(Eval("matname").ToString(), 82, "...")%></a>
                                </td>
                                <td style="padding-top:10px; padding-bottom:10px;">
                                    <a href="ProjectinforDetail.aspx?Part=3&Id=<%#Eval("proid")%>" title="点击查看工程详情"  style="text-decoration:underline;"><%#LTP.Common.StringPlus.StrCut(Eval("proname").ToString(), 72, "...")%></a>
                                </td>
                                <!--<td style="padding-top:10px; padding-bottom:10px;">
                                    <%#LTP.Common.StringPlus.StrCut(Eval("matclass").ToString(), 82, "...")%>
                                </td>
                                <td style="padding-top:10px; padding-bottom:10px;">
                                    <%#LTP.Common.StringPlus.StrCut(Eval("matunit").ToString(), 82, "...")%>
                                </td>
                                <td style="padding-top:10px; padding-bottom:10px;">
                                    <%#LTP.Common.StringPlus.StrCut(Eval("matxh").ToString(), 82, "...")%>
                                </td>
                                <td style="padding-top:10px; padding-bottom:10px;">
                                    <%#LTP.Common.StringPlus.StrCut(Eval("matgg").ToString(), 82, "...")%>
                                </td>
                                <td style="padding-top:10px; padding-bottom:10px;">
                                    <%#LTP.Common.StringPlus.StrCut(Eval("matamount").ToString(), 82, "...")%>
                                </td>
                                <td style="padding-top:10px; padding-bottom:10px;">
                                    <%#LTP.Common.StringPlus.StrCut(Eval("matlprice").ToString(), 82, "...")%>
                                </td>-->
                                <td style="padding-top:10px; padding-bottom:10px;">
                                    <%#ReplacetimeStr(Eval("stime").ToString())%>
                                    <!--<%#LTP.Common.StringPlus.StrCut(Eval("stime").ToString(), 82, "...")%>-->
                                </td>
                                <td style="padding-top:10px; padding-bottom:10px;">
                                    <%#ReplacetimeStr(Eval("ftime").ToString())%>
                                    <!--<%#LTP.Common.StringPlus.StrCut(Eval("ftime").ToString(), 82, "...")%>-->
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                                 
                 <tr>
                    <td colspan="9" align="center">
                    <uc1:UcfarPager ID="UcfarPager6" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
