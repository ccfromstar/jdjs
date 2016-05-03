<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Discount.aspx.cs" Inherits="JDJS.Web.Discount" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div class="dsindexseach">
    <asp:Label ID="Label1" runat="server" Text="活动标题："></asp:Label><asp:TextBox ID="dctitle"
        runat="server"></asp:TextBox>
    <asp:Label ID="Label2" runat="server" Text="主办单位："></asp:Label><asp:TextBox ID="dccompany"
        runat="server"></asp:TextBox>
    <asp:Label ID="Label3" runat="server" Text="活动类别："></asp:Label><asp:DropDownList
        ID="DropDownList1" runat="server">
        <asp:ListItem Selected="True">不限</asp:ListItem>
        <asp:ListItem>展会</asp:ListItem>
        <asp:ListItem>期刊</asp:ListItem>
        <asp:ListItem>商铺</asp:ListItem>
        <asp:ListItem>其他</asp:ListItem>
    </asp:DropDownList>
    <span>&nbsp;&nbsp;</span>
    <asp:ImageButton ID="ImageButton1" runat="server" 
        ImageUrl="~/uploads/SeachDS.jpg" onclick="ImageButton1_Click"  />
</div>
<div class="discount"> 
     
      <ul >
        <asp:Repeater ID="Discnt" runat="server">
        <ItemTemplate>
                               
                <li>
                
                <a  href="<%#Eval("url") %>" target="_blank"><img alt="<%#Eval("title") %>" src="<%#Eval("pic") %>" /></a>
                <a  href="<%#Eval("url") %>" target="_blank" title="点此查看详情"><%#Eval("title")%></a>
                <span>&nbsp;&nbsp;&nbsp;&nbsp;<%#LTP.Common.StringPlus.StrCut(Eval("rek").ToString(), 280, "...")%></span>
                </li>
                
                
                <span><a  href="<%#Eval("url") %>" target="_blank" title="点此查看详情">获取优惠</a></span>
        </ItemTemplate>
         </asp:Repeater>   
        </ul>  
        
</div>
<div>
    <uc1:UcfarPager ID="Pager" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
