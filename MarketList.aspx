<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="MarketList.aspx.cs" Inherits="JDJS.Web.MarketList" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<%@ Register TagPrefix="iewc" Namespace="Microsoft.Web.UI.WebControls" Assembly="Microsoft.Web.UI.WebControls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div class="SubMain">
    <img alt="" src="style/images/Market-tl.gif" />
    <div class="SubTop">
        <table style="width: 624px;">
            <tr>
                <td width=70px align=center>
                   序号：
                </td>
                <td width=138px>
                    <asp:TextBox ID="txtCode" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td width=70px align=center>
                   公司名称：
                </td>
                <td width=138px>
                    <asp:TextBox ID="txtTitle" runat="server" Width="150px"></asp:TextBox>
                </td>
               
                <td><asp:Button ID="btnSeach" runat="server" Text="搜索" onclick="btnSeach_Click" 
                        Height="24px" Width="70px" /></td>
            </tr>
            
        </table>
        
    </div>
    <div class="SubCenter">
       <asp:Image ID="ImgBg" runat="server" /><div class="subbody">
            <ul class="subbdulEnt">
                <asp:Repeater ID="RepInfo" runat="server">
                <ItemTemplate>
                    <li><span style=" float:right;<%#GetStyle(Eval("webshow").ToString()) %>"><%#GetStyle1(Eval("webshow").ToString()) %></span><a href="MarketDetail.aspx?Part=4&Id=<%#Eval("cid") %>" title="<%#Eval("title") %>" style="<%#GetStyle(Eval("webshow").ToString()) %>" >[<%#GetSubString(Eval("newcode").ToString())%>]<%#LTP.Common.StringPlus.StrCut(Eval("title").ToString(),26,"...") %></a></li>
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
