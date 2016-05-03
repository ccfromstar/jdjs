<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePwd.aspx.cs" Inherits="JDJS.Web.WebManager.ChangePwd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
     <link href="style/base.css" rel="Stylesheet" type="text/css" />
    <link href="style/layout.css" rel="Stylesheet" type="text/css" />
    <link href="style/model.css" rel="Stylesheet" type="text/css" />
    <script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="js/onload.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
 <table border="0" cellspacing="0" cellpadding="0" width="100%"  >
<tr>
    <td class="left_Bg">
        <table  width="100%" cellpadding="2" cellspacing="0">
         <tr>
            <td>
               <div style="float: left">
                
                </div>
            </td>
         </tr>
         <tr>
            <td>
           
            </td>
         </tr>
         <tr>
            <td>
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td >
                        修改管理员密码
                    </td>
                </tr>
                <tr>
                <td>
                    <table style="width: 100%;">
                       <tr>
                            <td align=right>
                                原密码：
                            </td>
                            <td>
                                <asp:TextBox ID="txtOldPwd" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                新密码：
                            </td>
                            <td>
                                <asp:TextBox ID="txtNewPwd" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                确认密码：
                            </td>
                            <td>
                                <asp:TextBox ID="txtSdPwd" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                      
                        <tr>
                            <td align=right>
                                &nbsp;</td>
                            <td>
                                    <asp:LinkButton ID="lbSubmit" CssClass="zPushBtn" runat="server" 
                                        onclick="lbSubmit_Click">
                                <img height="20" src="style/Icons/icon039a16.gif" width="20" /><b>提交&nbsp;</b></asp:LinkButton></td>
                        </tr>
                      
                    </table>
                </td>
                </tr>
                
              
                </table>
            </td>
         </tr>
        </table>
        
    </td>
    <td class="right_Bg"></td>
</tr>
</table>
    </form>
</body>
</html>
