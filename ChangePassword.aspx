<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="JDJS.Web.ChangePassword" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script language="javascript" type="text/javascript">
    function ChangeCode() {

        var date = new Date();
        var myImg = document.getElementById("ctl00_ContentPlaceHolder1_ImageCheck");
        var GUID = document.getElementById("ctl00_ContentPlaceHolder1_lblGUID");

        if (GUID != null) {
            if (GUID.innerHTML != "" && GUID.innerHTML != null) {
                myImg.src = "ValidateCode.aspx?GUID=" + GUID.innerHTML + "&flag=" + date.getMilliseconds()

            }
        }
        return false;
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div class="SubMain">
    <img alt="" src="style/images/user-tl.gif" />
 <div class="SubCenter">
 
 
     <table style="width: 100%;">
         <tr>
             <td style="width: 40%; height:40px;" align=right>
                 <asp:Label ID="labName" runat="server" Text="旧密码："></asp:Label></td>
             <td style="width: 30%;">
                 <asp:TextBox ID="LoginName" runat="server" TextMode="Password" 
                     ValidationGroup="1" Width="150px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                     ControlToValidate="LoginName" Display="Dynamic" ErrorMessage="*" 
                     ValidationGroup="1"></asp:RequiredFieldValidator>
             </td>
             <td>
                 &nbsp;</td>
         </tr>
         <tr>
             <td align=right style=" height:40px;">
                 <asp:Label ID="labPassWord" runat="server" Text="新密码："></asp:Label></td>
             <td>
                 <asp:TextBox ID="PassWord" runat="server" TextMode="Password" 
                     ValidationGroup="1" Width="150px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                     ControlToValidate="PassWord" Display="Dynamic" ErrorMessage="*" 
                     ValidationGroup="1"></asp:RequiredFieldValidator>
             </td>
             <td>
                 &nbsp;</td>
         </tr>
         <tr>
             <td align=right style=" height:40px;">
                 <asp:Label ID="lbCheckpwd" runat="server" Text="确认密码："></asp:Label></td>
             <td>
                 <asp:TextBox ID="txtCheckpwd" runat="server" TextMode="Password" 
                     ValidationGroup="1" Width="150px"></asp:TextBox>
                 <asp:CompareValidator ID="CompareValidator1" runat="server" 
                     ErrorMessage="*" ControlToCompare="PassWord" 
                     ControlToValidate="txtCheckpwd" ValidationGroup="1"></asp:CompareValidator>
                 </td>
             <td>
                 &nbsp;</td>
         </tr>
         <tr>
             <td align=right style=" height:40px;">
                 <asp:Label ID="lbCheck" runat="server" Text="验证码："></asp:Label></td>
             <td>
                 <asp:Panel ID="panCheck" runat="server">
                 
                 <asp:TextBox ID="CheckCode" runat="server" Width="60px" ValidationGroup="1"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                     ControlToValidate="CheckCode" Display="Dynamic" ErrorMessage="*" 
                     ValidationGroup="1"></asp:RequiredFieldValidator><a id="A2" href="" onclick="ChangeCode();return false;">&nbsp;<asp:Image ID="ImageCheck" runat="server" ImageUrl="ValidateCode.aspx?GUID=GUID" ImageAlign="AbsMiddle" ToolTip="看不清，换一个"></asp:Image></a><asp:Label ID="lblGUID" runat="server" Style="display: none"></asp:Label></asp:Panel></td>
             <td>
                 </td>
         </tr>
         <tr>
             <td style=" height:40px;" colspan="3" align=center>
                 <asp:Button ID="btnChange" runat="server" Text="修改密码" Visible=false 
                     onclick="btnChange_Click" ValidationGroup="1" />
                     </td>
         </tr>
     </table>
 
 </div>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>

