<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="MarketDetail.aspx.cs" Inherits="JDJS.Web.MarketDetail" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
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
<div class="SubMain">
    <img alt="" src="style/images/Market-tl.gif" />
    <div class="SubCenter">
       <asp:Image ID="ImgBg" runat="server" /><div class="subbody">
            <%--<div class="detailtitle"><asp:Label ID="lbTitle" runat="server" ></asp:Label></div>--%>
            <div class="detailbody">
                <table style="width:600px; ">
                    <tr>
                        <td>
                            <asp:Label ID="lbBody" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="PanCp" runat="server" Visible="false">
                            <table style="width:600px; ">
                                <tr>
                                <td colspan="3" height=30>
                                公司名称：<asp:Label ID="lbcname" runat="server" ></asp:Label>
                                </td>
                                </tr>
                                <tr>
                                <td colspan="3" height=30>
                                地址：<asp:Label ID="lbAddress" runat="server" ></asp:Label>
                                </td>
                                </tr>
                                <tr>
                                <td width=200px height=30>
                                    电话：<asp:Label ID="lbPhone" runat="server" ></asp:Label>
                                </td>
                                <td width=200px>
                                   手机：<asp:Label ID="lbMobile" runat="server" ></asp:Label>
                                </td>
                                <td width=200px>
                                   传真：<asp:Label ID="lbFax" runat="server" ></asp:Label>
                                </td>
                                </tr>
                                <tr>
                                <td  height=30>
                                    联系人：<asp:Label ID="lbLxr" runat="server" ></asp:Label>
                                </td>
                                <td>
                                   Email：<asp:Label ID="lbEmail" runat="server" ></asp:Label>
                                </td>
                                <td>
                                    邮编：<asp:Label ID="lbYb" runat="server" ></asp:Label>
                                </td>
                                </tr>
                                <tr>
                                <td colspan="3" height=30>
                                    网址：<asp:Label ID="lbSite" runat="server" ></asp:Label>
                                </td>
                                </tr>
                            </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td height=30>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td height=30>
                        <asp:Panel ID="PalDteail" runat="server" Visible=false>
                        <table style=" width:600px; border-collapse:collapse; color:#003399;" border="1" 
                                cellpadding="0" cellspacing="0" bordercolor="#3366cc"   > 
                            <tr>
                                <td height=30 colspan="7">
                                <table style="width: 600px;">
                                <tr>
                                    <td width=70px align=center>关键字：</td>
                                    <td><asp:TextBox ID="txtTitle" runat="server" Width="130px"></asp:TextBox></td>
                                    <td width=70px align=center>开始日期：</td>
                                    <td><asp:TextBox ID="txtBg" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox></td>
                                    <td width=70px align=center>结束日期：</td>
                                    <td ><asp:TextBox ID="txtEnd" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                                    </td><td><asp:Button ID="btnSeach" runat="server" Text="搜索" onclick="btnSeach_Click" Height="24px" Width="70px" /></td>
                                </tr>
                                </table>
                                </td>
                            </tr>  
                            <tr style=" background:#003399; color:#ffffff; font-weight:bold;" >
                                <td width=180 height=30 align=center>名称</td>
                                <td width=60 align=center>品牌</td>
                                <td width=85 align=center>规格</td>
                                <td width=75 align=center>材质</td>
                              <%--  <td width=60 align=center>批发价</td>--%>
                                <td width=70 align=center>零售价</td>
                                <td width=70 align=center>计量单位</td>
                                <td width=60 align=center>发布时间</td>
                            </tr>
                            <asp:Repeater ID="RepSeach" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td height=30 align=center><%#Eval("zname")%></td>
                                    <td align=center><%#Eval("class")%></td>
                                    <td align=center><%#Eval("standard")%></td>
                                    <td align=center><%#Eval("material")%></td>
                                    <%--<td align=center><a href="SeachReal.aspx">点击查看</a></td>--%>
                                    <td align=center><%#Eval("lprice", "{0:c}")%></td>
                                    <td align=center><%#Eval("zunit")%></td>
                                    <td align=center><%#Eval("ptime","{0:yyyy-MM-dd}")%></td>
                                </tr>
                            </ItemTemplate>
                            </asp:Repeater>
                        </table>
                        </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td align=center height=30><uc1:UcfarPager ID="Pager" Visible="false" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager></td>
                    </tr>
                </table>
            </div>
       </div>
       <div class="subfoot"></div>
    </div>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>

