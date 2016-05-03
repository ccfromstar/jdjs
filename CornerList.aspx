<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="CornerList.aspx.cs" Inherits="JDJS.Web.CornerList" %>
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
    <img alt="" src="style/images/Corner-tl.gif" />
    <div class="SubCenter">
       <asp:Image ID="ImgBg" runat="server" /><div class="subbody">
            <ul class="subbdul">
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
                    开始日期：</td>
                <td width=80px>
                    <asp:TextBox ID="txtBg" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                </td>
                <td width=70px align=center>
                    结束日期：</td>
                <td width=80px>
                   <asp:TextBox ID="txtEnd" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                </td>
                <td><asp:Button ID="btnSeach" runat="server" Text="搜索" onclick="btnSeach_Click" 
                        Height="24px" Width="70px" /></td>
            </tr>
        </table>
        
    </div>
                <asp:Repeater ID="RepInfo" runat="server">
                <ItemTemplate>
                    <li><span>[<%#Eval("ptime","{0:yyyy-MM-dd}")%>]</span><a href="CornerDetail.aspx?Part=<%=Part%>&Id=<%#Eval("id") %>" title="<%#Eval("title") %>"><%#LTP.Common.StringPlus.StrCut(Eval("title").ToString(), 82, "...")%></a><%#NewStr(Eval("ptime", "{0:yyyy-MM-dd}").ToString())%></li>
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

