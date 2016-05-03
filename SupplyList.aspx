<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="SupplyList.aspx.cs" Inherits="JDJS.Web.SupplyList" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="Stylesheet" href="style/datePicker.css" type="text/css" />
<script type="text/javascript" src="js/jquery.core.js"></script>
<script type="text/javascript" src="js/jquery.datePicker.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<script type="text/javascript">
    jQuery(function() {
        $(".date-pick").datepicker({changeMonth:true,changeYear:true});
    }); 
</script>
<div class="SubMain">
    <img alt="" src="style/images/Supply-tl.gif" />
<div class="SubTop">
        <table style="width: 624px;">
            <tr>
                <td width=70px align=center>
                   关键字：
                </td>
                <td width=138px>
                    <asp:TextBox ID="txtTitle" runat="server" Width="130px"></asp:TextBox>
                </td>
                <td width=70px align=center>
                    货品名称：</td>
                <td width=138px>
                    <asp:TextBox ID="txtCid" runat="server" Width="130px"></asp:TextBox>
                </td>
                <td width=70px align=center>
                    货品类别：</td>
                <td width=70px>
                    <asp:DropDownList ID="ddlClass" runat="server">
                        <asp:ListItem Value="全部">全部</asp:ListItem>
                        <asp:ListItem Value="0">人工</asp:ListItem>
                        <asp:ListItem Value="1">材料</asp:ListItem>
                        <asp:ListItem Value="2">机械</asp:ListItem>
                        <asp:ListItem Value="3">设备</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="btnAdd" runat="server" Text="发布信息"
                        Height="24px" Width="70px" onclick="btnAdd_Click" />
                </td>
            </tr>
            <tr>
                <td align=center>
                    开始日期：
                </td>
                <td>
                    <asp:TextBox ID="txtBg" runat="server" Width="130px" CssClass="date-pick"></asp:TextBox>
                </td>
                <td align=center>
                    结束日期：</td>
                <td>
                    <asp:TextBox ID="txtEnd" runat="server" Width="130px" CssClass="date-pick"></asp:TextBox>
                </td>
                <td colspan="2" align=center>
                    <asp:Button ID="btnSeach" runat="server" Text="搜索" onclick="btnSeach_Click" 
                        Height="24px" Width="70px" /></td>
                <td align=center>
                    <asp:Button ID="btnMy" runat="server" Text="我的信息"
                        Height="24px" Width="70px" onclick="btnMy_Click" /></td>
            </tr>
        </table>
        
    </div>
    <div class="SubCenter">
       <asp:Image ID="ImgBg" runat="server" /><div class="subbody">
            <ul class="subbdul">
                <asp:Repeater ID="RepInfo" runat="server">
                <ItemTemplate>
                    <li><span>[<%#Eval("ptime","{0:yyyy-MM-dd}")%>]</span><%--<span>[<a href="SupplyAdd?Part=<%=Part %>&Id=<%#Eval("id") %>"><img style=" margin-bottom:-2px;" border=0 alt="编辑" src="style/images/edit-icon.gif" /></a>&nbsp;<a href="SupplyDelete?Id=<%#Eval("id") %>"><img style=" margin-bottom:-2px;" border=0 alt="删除" src="style/images/del-icon.gif" /></a>]</span>--%><a href="SupplyDetail.aspx?Part=<%=Part%>&Id=<%#Eval("id") %>" title="<%#Eval("title") %>"><%#LTP.Common.StringPlus.StrCut(Eval("title").ToString(), 82, "...")%></a><%#NewStr(Eval("ptime", "{0:yyyy-MM-dd}").ToString())%></li>
                </ItemTemplate>
                </asp:Repeater>
            </ul>
       </div>
       <div class="subfoot"></div>
       <uc1:UcfarPager ID="Pager" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
    </div>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>

