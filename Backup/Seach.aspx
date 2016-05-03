<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Seach.aspx.cs" Inherits="JDJS.Web.Seach" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<link rel="Stylesheet" href="style/datePicker.css" type="text/css" />
<script type="text/javascript" src="js/jquery.core.js"></script>
<script type="text/javascript" src="js/jquery.datePicker.js"></script>
    <script type="text/javascript">
	$(function() {
	$(".date-pick").datepicker({changeMonth:true,changeYear:true});
	});
</script>
<div class="SubMainBig">
    <img alt="" src="style/images/market-tl-bg.gif" />
    <div class="SubTopBig">
       <table style="width: 760px;">
            <tr>
                <td align=center>
                    <asp:DropDownList ID="ddlOrder" runat="server">
                        <asp:ListItem Value="2">材料名</asp:ListItem>
                        <asp:ListItem Value="1">公司名</asp:ListItem>
                        <asp:ListItem Value="3">规格型号</asp:ListItem>
                        <asp:ListItem Value="4">品牌</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td  align=center>
                   关键字：
                </td>
                <td >
                    <asp:TextBox ID="txtTitle" runat="server" Width="130px"></asp:TextBox>
                </td>
                <td  align=center>
                    开始日期：</td>
                <td >
                    <asp:TextBox ID="txtBg" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                </td>
                <td  align=center>
                    结束日期：</td>
                <td >
                   <asp:TextBox ID="txtEnd" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                </td>
                <td><asp:Button ID="btnSeach" runat="server" Text="搜索" onclick="btnSeach_Click" 
                        Height="24px" Width="70px" />
                    <%--<asp:Button ID="btnLook" runat="server" Text="在线浏览" Height="24px" Width="70px" 
                        onclick="btnLook_Click"/>--%>
                </td>
            </tr>
            
        </table>
    </div>
    <table style="width:765px;border-collapse:collapse; color:#003399;" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc"   >   
        <tr style=" background:#003399; color:#ffffff; font-weight:bold;" >
            <td width=180 height=30 align=center>材料名称</td>
            <td width=50 align=center>品牌</td>
            <td width=75 align=center>规格</td>
            <td width=50 align=center>材质</td>
<%--            <td width=50 align=center>批发价</td>--%>
            <td width=70 align=center>市场报价</td>
            <td width=60 align=center>计量单位</td>
            <td width=150 align=center>公司名称</td>
            <td width=70 align=center>信息状态</td>
            <td width=70 align=center>发布时间</td>
        </tr>
        <asp:Repeater ID="RepSeach" runat="server">
        <ItemTemplate>
            <tr>
                <td height=30 align=center><%#Eval("zname")%></td>
                <td align=center><%#Eval("class")%></td>
                <td align=center><%#Eval("standard")%></td>
                <td align=center><%#Eval("material")%></td>
<%--                <td align=center><a href="SeachReal.aspx">点击查看</a></td>--%>
                <td style="font-size:14px;" align=center><%#Eval("lprice", "{0:c}")%></td>
                <td align=center><%#Eval("zunit")%></td>
                <td align=center><a href="MarketDetail.aspx?Id=<%#Eval("cid")%>"><%#Eval("company")%></a></td>
                <td align=center><%#NewStr(Eval("cid").ToString())%></td>
                <td align=center><%#Eval("ptime","{0:yyyy-MM-dd}")%></td>
            </tr>
        </ItemTemplate>
        </asp:Repeater>
    </table>
    <uc1:UcfarPager ID="Pager" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
</div>
</asp:Content>
