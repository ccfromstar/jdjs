<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WXtradeDetail.aspx.cs" Inherits="JDJS.Web.WXtradeDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title></title>
</head>
<body  class="bodys">
<style>
.wrap{margin:0 auto;}
.bodys {text-align:center;}
.fontstl3{ font-size:x-large; font-weight:300;  color:Red}
</style>
    <form id="form1" runat="server">
    <div>
             <div class="fontstl3"><asp:Label ID="lbTitle" runat="server" ></asp:Label></div>
            <div style=" font-weight:bolder;"><asp:Label ID="lbTime" runat="server"></asp:Label></div>
            <div>
          
                <table class="wrap" style="text-align:left;"  border="1">
                    <tr>
                        <td width="30%">
                            招标类型：
                        </td>
                        <td>
                            <asp:Label ID="lbType" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           报建编号：
                        </td>
                        <td>
                            <asp:Label ID="lbNb" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            招标单位：
                        </td>
                        <td>
                           <asp:Label ID="lbCp" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            招标代理单位：
                        </td>
                        <td>
                           <asp:Label ID="lbZbdw" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            工程名称：
                        </td>
                        <td>
                            <asp:Label ID="lbGc" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           建设地点：
                        </td>
                        <td>
                            <asp:Label ID="lbAdd" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           投资规模(万元)：
                        </td>
                        <td>
                           <asp:Label ID="lbGm" runat="server" ></asp:Label>
                        </td>
                    </tr>
                     <tr>
                        <td>
                           建筑面积(平方米)：
                        </td>
                        <td>
                           <asp:Label ID="lbArea" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           联 系 人：
                        </td>
                        <td>
                            <asp:Label ID="lbLxr" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           电 话：
                        </td>
                        <td>
                           <asp:Label ID="lbPhone" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           手机：
                        </td>
                        <td>
                             <asp:Label ID="LbMobil" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           报名日期：

                        </td>
                        <td>
                            <asp:Label ID="lbDate" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           报名地点：

                        </td>
                        <td>
                            <asp:Label ID="lbBmadd" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           报名条件：

                        </td>
                        <td>
                            <asp:Label ID="lbTj" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            项目类别：</td>
                        <td>
                            <asp:Label ID="lbXmType" runat="server" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            工程类别：</td>
                        <td>
                            <asp:Label ID="lbGcType" runat="server" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            标段号：</td>
                        <td>
                            <asp:Label ID="lbBdNum" runat="server" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                           备 注：

                        </td>
                        <td>
                            <asp:Label ID="lbRemark" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lbOther" runat="server" ></asp:Label></td>
                    </tr>
                </table>
              </div>
    </div>
    </form>
</body>
</html>
