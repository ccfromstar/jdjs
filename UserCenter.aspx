<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="UserCenter.aspx.cs" Inherits="JDJS.Web.UserCenter" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div class="dspagtitle"><span>客户中心</span></div>
    <div></div>
    <div class="uscenter">
        <ul>
        <li><asp:Label ID="newcodelabel" runat="server" Text="您好！" ForeColor="#FF0066"></asp:Label>
        <asp:Label ID="newcode"
        runat="server" Text="您尚未登录！" ForeColor="#3333FF"></asp:Label></li>

        <li><asp:Label ID="pointlabel" runat="server" Text="当前积分：" ForeColor="#FF0066"></asp:Label>
        <asp:Label
            ID="point" runat="server" Text="尚未登录！" ForeColor="#3333FF"></asp:Label></li>
        <li><asp:Label ID="moneylabel" runat="server" Text="剩余建定币：" ForeColor="#FF0066"></asp:Label>
        <asp:Label ID="money"
        runat="server" Text="尚未登录！" ForeColor="#3333FF"></asp:Label></li>
        </ul>
     </div>
     <div></div>
     <div></div>
     <div></div>
     <div></div>
     <div class="uscenterimg">
      
         <a href="UserProject.aspx"><img alt="" src="uploads/uc-pro1.jpg"  onmouseover="src = 'uploads/uc-pro2.jpg';" onmouseout="src = 'uploads/uc-pro1.jpg';"/>
         </a>
         
         <a href="UserCompany.aspx"><img alt="" src="uploads/uc-cmp1.jpg"  onmouseover="src = 'uploads/uc-cmp2.jpg';" onmouseout="src = 'uploads/uc-cmp1.jpg';"/>
         </a>
      
     
     </div>
     
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">

</asp:Content>
