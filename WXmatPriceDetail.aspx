<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WXmatPriceDetail.aspx.cs" Inherits="JDJS.Web.WXmatPriceDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title></title>
</head>
<body class="bodys">
<style>
.wrap{margin:0 auto;}
.bodys {text-align:center;}
.fontstl3{ font-size:x-large; font-weight:300;  color:Red}
</style>
    <form id="form1" runat="server">
    <div>
           <div class="fontstl3"><asp:Label ID="lbTitle" runat="server" ></asp:Label></div>
            <div><asp:Label ID="lbTime" runat="server"></asp:Label></div>
            <div>
            
                <table class="wrap" style="text-align:left;"  border="1">
                    <tr>
                        <td width="30%" align="center">
                            规格型号：
                        </td>
                        <td>
                            [<asp:Label ID="lbType" runat="server" Font-Bold="True"></asp:Label>]
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            销售单位：
                        </td>
                        <td>
                            <asp:Label ID="lbunit" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            市场报价：
                        </td>
                        <td>
                           <asp:Label ID="lbprice" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            品牌：
                        </td>
                        <td>
                           <asp:Label ID="lbclass" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            产地：
                        </td>
                        <td>
                            <asp:Label ID="lbplace" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            材质：
                        </td>
                        <td>
                            <asp:Label ID="lbmat" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                           总供应量：
                        </td>
                        <td>
                           <asp:Label ID="lbamount" runat="server" ></asp:Label>
                        </td>
                    </tr>
                     <tr>
                         <td align="center">
                             产品描述： 
                         </td>
                         <td>
                             <asp:Label ID="lbRemark" runat="server"></asp:Label>
                         </td>
                    </tr>
                    
                    </table>
                    <table  class="wrap" style="text-align:center;"  border="1"> 
                    <tr><td align="center">产品图片
                    </td> </tr>
                     <tr>
                        <td align="center">
                        <asp:Image ID="ImageMat" runat="server" Visible="false" />
                        <asp:Label ID="LabelImageMat" runat="server"></asp:Label>
                            </td>
                         
                    </tr>
                    </table>
                    <div class="fontstl3">供应商信息</div>
                    <table class="wrap" style="text-align:left;"  border="1">
                    <tr>
                        <td width="30%" align="center">
                            公司名称：
                        </td>
                        <td>
                            <asp:HyperLink ID="companyname" runat="server">HyperLink</asp:HyperLink>
                           
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            公司地址：
                        </td>
                        <td>
                            <asp:Label ID="address" runat="server" Font-Bold="True" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            邮编：
                        </td>
                        <td>
                            <asp:Label ID="Cpost" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            公司法人：
                        </td>
                        <td>
                           <asp:Label ID="leader" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            公司电话：
                        </td>
                        <td>
                           <asp:Label ID="tel" runat="server" Font-Bold="True" ></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td align="center">
                            传真：
                        </td>
                        <td>
                           <asp:Label ID="fax" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            网址：
                        </td>
                        <td>
                           <asp:Label ID="web" runat="server" ></asp:Label>
                        </td>
                    </tr>
                     <tr>
                        <td align="center">
                            电子邮件：
                        </td>
                        <td>
                            <asp:Label ID="email" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            业务联系人：
                        </td>
                        <td>
                           <asp:Label ID="linkman" runat="server" Font-Bold="True" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            联系电话：
                        </td>
                        <td>
                            <asp:Label ID="handset" runat="server" Font-Bold="True" ></asp:Label>
                        </td>
                    </tr>
                   
              
                    </table>
    </div>
    </div>
    </form>
</body>
</html>