<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WordToHtml.aspx.cs" Inherits="JDJS.Web.WebManager.WordToHtml" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <link href="style/base.css" rel="Stylesheet" type="text/css" />
    <link href="style/layout.css" rel="Stylesheet" type="text/css" />
    <link href="style/model.css" rel="Stylesheet" type="text/css" />
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
                <input id="File1" type="file" runat="server" /><asp:Button ID="btnUpload" runat="server"
                    Text="上传" onclick="btnUpload_Click" />
            </td>
         </tr>
         <tr>
            <td>
                &nbsp;</td>
         </tr>
        </table>
        
    </td>
    <td class="right_Bg"></td>
</tr>
</table>
    </form>
</body>
</html>

