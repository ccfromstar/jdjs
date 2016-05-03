<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="EBusiness.aspx.cs" Inherits="JDJS.Web.EBusiness" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">

<div class="dsindexseach">
    <div>
          <img alt="建定商铺" src="uploads/dsLOGO.jpg" />
    </div>
    <asp:Label ID="Label1" runat="server" Text="您是要 " Font-Bold="True" 
        Font-Italic="True" Font-Overline="False" Font-Size="Medium" 
        Font-Strikeout="False" Font-Underline="False" ForeColor="#3333FF"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem Selected="True" Value="0">搜建材</asp:ListItem>
        <asp:ListItem Value="1">找商铺</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:ImageButton ID="ImageButton1" ImageUrl="~/uploads/SeachDS.jpg" 
        runat="server" onclick="ImageButton1_Click" />
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
