<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="dsLeftSeach.ascx.cs" Inherits="JDJS.Web.yejia.dsControls.dsLeftSeach" %>
<div class="dslefttit">
    
    产品搜索</div>
<div class="dsleftseach">
    <asp:TextBox ID="TextBox1" runat="server" Width="115px"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="搜索" onclick="Button1_Click" 
        style="height: 21px" />
</div>