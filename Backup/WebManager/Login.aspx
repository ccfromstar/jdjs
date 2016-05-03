<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="JDJS.Web.WebManager.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link href="style/base.css" rel="Stylesheet" type="text/css" />
    <link href="style/layout.css" rel="Stylesheet" type="text/css" />
    <link href="style/model.css" rel="Stylesheet" type="text/css" />
    <script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="js/onload.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
    function ChangeCode() {

        var date = new Date();
        var myImg = document.getElementById("ctl00_ContentPlaceHolder1_ImageCheck");
        var GUID = document.getElementById("ctl00_ContentPlaceHolder1_lblGUID");

        if (GUID != null) {
            if (GUID.innerHTML != "" && GUID.innerHTML != null) {
                myImg.src = "../ValidateCode.aspx?GUID=" + GUID.innerHTML + "&flag=" + date.getMilliseconds()

            }
        }
        return false;
    }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="login">
    <div class="loginbar">
        <table style="width: 100%; ">
            <tr>
                <td style=" width:70px;" align="center">
                    用户名：
                </td>
                <td style=" width:80px;" >
                    <asp:TextBox ID="txtUserName" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td style=" width:50px;" align="center"> 密码：</td>
                 <td style=" width:80px;" >
                    <asp:TextBox ID="txtPwd" runat="server" Width="80px" TextMode="Password"></asp:TextBox>
                </td>
                <td style=" width:60px;" align="center">
                    验证码：
                </td>
                <td style=" width:60px;" align="center"><a id="A2" href="" onclick="ChangeCode();return false;">&nbsp;<asp:Image ID="ImageCheck" runat="server" ImageUrl="../ValidateCode.aspx?GUID=GUID" ImageAlign="AbsMiddle" ToolTip="看不清，换一个"></asp:Image></a><asp:Label ID="lblGUID" runat="server" Style="display: none"></asp:Label></td>
                 <td style=" width:60px;" >
                    <asp:TextBox ID="CheckCode" runat="server" Width="60px"></asp:TextBox>
                </td>
                <td align="center">
                    <asp:ImageButton ID="ImageLogin" runat="server" 
                        ImageUrl="~/WebManager/style/images/loginbutton.jpg" 
                        onclick="ImageLogin_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="8" align="center">
                </td>
            </tr>
            </table>
    </div>
    </div>
    </form>
</body>
</html>
