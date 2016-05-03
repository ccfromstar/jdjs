<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="JDJS.Web.Login" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <!--<script language="javascript" type="text/javascript">
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
    </script>-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div class="SubMain">
    <img alt="" src="style/images/user-tl.gif" />
 <div class="SubCenter">
 
 
     <table style="width: 100%;">
         <tr>
             <td style="width: 40%; height:40px;" align=right>
                 <asp:Label ID="labName" runat="server" Text="�û�����"></asp:Label></td>
             <td style="width: 30%;">
                 <asp:TextBox ID="LoginName" runat="server" ValidationGroup="1"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                     ControlToValidate="LoginName" Display="Dynamic" ErrorMessage="*" 
                     ValidationGroup="1"></asp:RequiredFieldValidator>
                 <asp:Label ID="labLoginUser" runat="server" ></asp:Label>
             </td>
             <td>
                 &nbsp;</td>
         </tr>
         <tr>
             <td align=right style=" height:40px;">
                 <asp:Label ID="labPassWord" runat="server" Text="��&nbsp; �룺"></asp:Label></td>
             <td>
                 <asp:TextBox ID="PassWord" runat="server" TextMode="Password" 
                     ValidationGroup="1"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                     ControlToValidate="PassWord" Display="Dynamic" ErrorMessage="*" 
                     ValidationGroup="1"></asp:RequiredFieldValidator>
                 <asp:Label ID="labJf" runat="server" ></asp:Label>
                 &nbsp;&nbsp;
                 <asp:Label ID="JDBtit" runat="server" ></asp:Label>
                 <asp:Label ID="LabJDB" runat="server" ></asp:Label>
             </td>
             <td>
                 &nbsp;</td>
         </tr>
         <tr>
             <td style=" height:40px;" colspan="3" align=center>
                 <asp:Button ID="btnLogin" runat="server" Text="��¼" 
                     onclick="btnLogin_Click" ValidationGroup="1" />
                 <!--<asp:Button ID="btnReg" runat="server" Text="���ע������" onclick="btnReg_Click" />-->
                 <asp:Button ID="btnForgot" runat="server" Text="��������" 
                     onclick="btnForgot_Click" />
                 <asp:Button ID="btnZX" runat="server" Text="ע��" onclick="btnZX_Click" 
                     Visible="False" />
                 <asp:Button ID="btnChange" runat="server" Text="�޸�����" Visible=false 
                     onclick="btnChange_Click" />
                     </td>
         </tr>
         <tr>
             <td style=" height:40px; line-height:22px;" colspan="3" align=center>
                 ����ǰ��������շ�Ƶ������ʹ�ñ�վ�ʻ���¼���������ʻ�ӭ���紹ѯ�����ߣ�021-54591008
                 <br />
                 <asp:Button ID="btnXX" runat="server" Text="�鿴��ϸ" onclick="btnXX_Click" />
                 </td>
         </tr>
     </table>
 </div>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>

