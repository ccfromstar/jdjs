<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="MarketPrice.aspx.cs" Inherits="JDJS.Web.MarketPrice" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<%@ Register TagPrefix="iewc" Namespace="Microsoft.Web.UI.WebControls" Assembly="Microsoft.Web.UI.WebControls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" type="text/css" href="style/datePicker.css" />
<link rel="stylesheet" type="text/css" href="style/dropdown.css" />
<script type="text/javascript" src="js/jquery.core.js"></script>
<script type="text/javascript" src="js/jquery.datePicker.js"></script>
<script src="js/jquery.mcdropdown.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">

    <script type="text/javascript">
    $(window).ready(function() {
    $("#category").mcDropdown("#categorymenu");
    });
    jQuery(function() {
        $(".date-pick").datepicker({changeMonth:true,changeYear:true});
    }); 
</script>

<div class="SubMainBig">
    <img alt="" src="style/images/Material-tl-bg.gif" />
    <div class="SubTopBig">
        <table style="width: 765px;">
            <tr>
                <td width=70px align=center>
                   关键字：
                </td>
                <td width=170px>
                    <asp:TextBox ID="txtTitle" runat="server" Width="170px"></asp:TextBox>
                </td>
                <td width=70px align=center>
                    开始日期：</td>
                <td width=130px>
                    <asp:TextBox ID="txtBg" runat="server" Width="120px" CssClass="date-pick"></asp:TextBox>
                </td>
                <td width=70px align=center>
                    结束日期：</td>
                <td width=130px>
                   <asp:TextBox ID="txtEnd" runat="server" Width="120px" CssClass="date-pick"></asp:TextBox>
                </td>
                <td><asp:Button ID="btnSeach" runat="server" Text="搜索" onclick="btnSeach_Click" 
                        Height="24px" Width="70px" /></td>
            </tr>
            
            <tr>
            <td align=center>类别：</td>
                <td align=left >
                    <asp:TextBox ID="txtItem" runat="server" Width="170px"></asp:TextBox></td><td ><input type="text" name="category" id="category" value="" />
                    <asp:Repeater ID="RepGroups" runat="server" 
                            onitemdatabound="RepGroups_ItemDataBound">
                        <HeaderTemplate><ul id="categorymenu" class="mcdropdown_menu"></HeaderTemplate>
			            <ItemTemplate>
			                <li><%#Eval("name") %>
                                <asp:Repeater ID="RepSpecials" runat="server" onitemdatabound="RepSpecials_ItemDataBound">
                                    <HeaderTemplate><ul></HeaderTemplate>
                                    <ItemTemplate><li><%#Eval("name") %>
                                        <asp:Repeater ID="RepItems" runat="server">
                                            <HeaderTemplate><ul></HeaderTemplate>
                                            <ItemTemplate><li><span onclick="gettype('<%#Eval("name") %>','<%#Eval("itemcode") %>')"><%#Eval("name") %></span></li></ItemTemplate>
                                            <FooterTemplate></ul></FooterTemplate>
                                        </asp:Repeater>
                                    </li></ItemTemplate>
                                    <FooterTemplate></ul></FooterTemplate>
                                </asp:Repeater>
                        </ItemTemplate>
			            <FooterTemplate></ul></FooterTemplate>
			        </asp:Repeater>
                        <td colspan="4"></td>
                    </td>
            </tr>
            
        </table>
        <script type="text/javascript">
            function gettype(nowvalue,code) {
                document.getElementById("<%=txtItem.ClientID %>").value = nowvalue;
            }
        </script>
    </div>
    <table style="width:765px;border-collapse:collapse; color:#003399;" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc"   >   
        <tr style=" background:#003399; color:#ffffff; font-weight:bold;" >
            <td height=30 align=center>名称</td>
            <td width=120 align=center>价格</td>
            <td width=100 align=center>计量单位</td>
            <td width=100 align=center>发布时间</td>
        </tr>
        <asp:Repeater ID="RepSeach" runat="server">
        <ItemTemplate>
            <tr>
                <td height=30 align=center><%#Eval("name")%></td>
                <td align=center><%#Eval("price", "{0:c}")%></td>
                <td align=center><%#Eval("unit")%></td>
                <td align=center><%#Eval("date", "{0:yyyy-MM-dd}")%></td>
            </tr>
        </ItemTemplate>
        </asp:Repeater>
    </table>
    <uc1:UcfarPager ID="Pager" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
</div>
</asp:Content>

    

