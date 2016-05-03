<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WXlogin.ascx.cs" Inherits="JDJS.Web.Controls.WXlogin" %>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
 
<div id="loginroad1" runat="server" style="border:1px #004fa8 solid ; top:50% " align="center"> 
<table style=" top:50%" >
<tr>

    <td  align="center">
         <asp:Label ID="Label4" runat="server" Text="帐号 " ForeColor="Blue" onmousedown="checkfocus(1)" onkeydown="keyDown(1)"></asp:Label>
        <asp:TextBox ID="TOPLoginName" runat="server"></asp:TextBox>
     </td>
</tr>
<tr>
     <td align="center"> 
       <asp:Label ID="Label5" runat="server" Text="密码 " ForeColor="Blue" onmousedown="checkfocus(1)" onkeydown="keyDown(1)"></asp:Label>
        <asp:TextBox ID="TOPPassWord" runat="server" TextMode="Password"></asp:TextBox>
     </td>
   
     <td align="left">
        
        <asp:ImageButton ID="Imagelogin" runat="server" 
              ImageUrl="../style/images/login2012.gif" alt="点此登录" onclick="ImageSeach_Click"/>
     </td>
     
     <!--<td align="center">
        <a  href="../Registration.aspx" target="_self"  style=" text-decoration:underline;" >免费注册</a>
     </td>-->
</tr>

</table>

</div>      
   

<div id="logined" runat="server"  style=" border:1px #004fa8 solid ;  top:50%"  align="center">                   
<div>    
                     
<table style="top:50%">
<tr>
    <td align="center">
        <asp:Label ID="Label3" runat="server" Text="尊敬的" ForeColor="Blue"></asp:Label>
        <asp:Label ID="Labeid" runat="server" Text="Label" Font-Bold="True" ForeColor="Red"></asp:Label>
        <asp:Label ID="Label1" runat="server" Text="您好！" ForeColor="Blue"></asp:Label>        
     </td>
</tr>
<tr>
    <td align="center">
        <asp:Label ID="Label2" runat="server" Text="欢迎使用微信版 建定通" ForeColor="Blue"></asp:Label>
                
    </td>
    
  
    <td align="left">
   
        <asp:ImageButton ID="ImageButton1" runat="server" 
                     ImageUrl="../style/images/out2012.gif" alt="退出登录" 
                    onclick="ImageButton1_Click" />
     </td>
    
</tr>
    <tr> 
        <td align="center">
        <a  href="../WXprobase.aspx?Part=3" target="_self"  style=" text-decoration:underline; color :Red" >[工程查询]</a>
        <a  href="../WXContactBase.aspx?Part=3" target="_self"  style=" text-decoration:underline; color :blue" >[人脉查询]</a>
        <a  href="../WXpromatbase.aspx?Part=3" target="_self"  style=" text-decoration:underline; color :green" >[采购资讯]</a>
        </td>
       
    </tr>

</table>
</div>
</div>