<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="dsLeftInfo.ascx.cs" Inherits="JDJS.Web.tingte.dsControls.dsLeftInfo" %>
<div class="dslefttit">
    
    相关信息</div> 

 <div class="dsleftinfo">
    <div>相关产品：<a href="./supply.aspx"><asp:Label ID="suppcnt" runat="server" Text="Label"></asp:Label></a> 个</div>
    <div>荣誉展示：<a href="./companyRyzz.aspx#divRY"><asp:Label ID="RYcnt" runat="server" Text="Label"></asp:Label></a> 项</div>
    <div>经典案例：<a href="./companyRyzz.aspx#divAL"><asp:Label ID="ALcnt" runat="server" Text="Label"></asp:Label></a> 个</div>
    <div>友情链接：<asp:Label ID="YQcnt" runat="server" Text="Label"></asp:Label> 个</div>
</div>