<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="loginroad.ascx.cs" Inherits="JDJS.Web.Controls.loginroad" %>


<div id="loginroad1" runat="server" style="width:1002px; height:40px; border:1px #004fa8 solid ; top:50% "> 
<table style="width: 988px; height:28px; top:50%">
<tr align=" right">

<td style=" width:20%"></td>
    <td align="right">
        <!--<a href="../ProjectGL/Login.aspx" title ="点此进入建定通" style=" font-weight:bold; text-decoration:underline; color:Orange"  >建定通入口</a>-->
     </td>
    <td align="right">
         <asp:Label ID="Label4" runat="server" Text="用户名：" ForeColor="Blue"></asp:Label>
        <asp:TextBox ID="TOPLoginName" runat="server"></asp:TextBox>
     </td>

     <td align="right" >
       <asp:Label ID="Label5" runat="server" Text="密码：" ForeColor="Blue"></asp:Label>
        <asp:TextBox ID="TOPPassWord" runat="server" TextMode="Password"></asp:TextBox>
     </td>
   
     <td align="right">
        
        <asp:ImageButton ID="Imagelogin" runat="server" 
             Height="33px" Width="114px" ImageUrl="../style/images/login2012.gif" alt="点此登录" onclick="ImageSeach_Click"/>
     </td>
     
     <!--<td align="center">
        <a  href="../Registration.aspx" target="_self"  style=" text-decoration:underline;" >免费注册</a>
     </td>-->
</tr>

</table>

</div>      
   

<div id="logined" runat="server"  style="width: 1002px; height:40px; border:1px #004fa8 solid ;  top:50%">                   
<div>    
                     
<table style="width: 988px; height:28px; top:50%">
<tr>
    <td align="center">
        <asp:Label ID="Label1" runat="server" Text="您好！" ForeColor="Blue"></asp:Label>
        <asp:Label ID="Labeid" runat="server" Text="Label" Font-Bold="True" ForeColor="Red"></asp:Label>
     </td>

    <td align="center">
        <asp:Label ID="Label2" runat="server" Text="当前积分 ：" ForeColor="Blue"></asp:Label>
        <asp:Label ID="Labepoint" runat="server" Text="Label" Font-Bold="True" ForeColor="Red"></asp:Label>
        
    </td>
    <td align="center">
  
        <asp:Label ID="Label3" runat="server" Text="剩余建定币 ：" ForeColor="Blue"></asp:Label>
        <asp:Label ID="LabeJDB" runat="server" Text="Label" Font-Bold="True" ForeColor="Red"></asp:Label>
    </td>
    <td align="left">
   
        <asp:ImageButton ID="ImageButton1" runat="server" 
                    Height="33px" Width="114px" ImageUrl="../style/images/out2012.gif" alt="退出登录" 
                    onclick="ImageButton1_Click" />
     </td>
     <td align="center">
        <a  href="../UserCenter.aspx" target="_self"  style=" text-decoration:underline;" >客户中心</a>
     </td>
</tr>

</table>
</div>
</div>






