<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="realDetail.aspx.cs" Inherits="JDJS.Web.WebManager.realDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <link href="../style/page.css" type="text/css" rel="stylesheet" />
    <link href="style/base.css" rel="Stylesheet" type="text/css" />
    <link href="style/layout.css" rel="Stylesheet" type="text/css" />
    <link href="style/model.css" rel="Stylesheet" type="text/css" />
    <link rel="Stylesheet" href="../style/datePicker.css" type="text/css" />
    <script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="js/onload.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/jquery.core.js"></script>
    <script type="text/javascript" src="../js/jquery.datePicker.js"></script>
    <script type="text/javascript">
        jQuery(function () {
            $(".date-pick").datepicker({ changeMonth: true, changeYear: true });
        }); 
</script>
</head>
<body>
    <form id="form1" runat="server">
    <table border="0" cellspacing="0" cellpadding="0" width="100%"  >
<tr>
    <td class="left_Bg">
        <table  width="100%" cellpadding="2" cellspacing="0">
         <tr>
            <td>
            </td>
         </tr>
        <tr>
            <td>
                <table width="100%" cellpadding="2" cellspacing="0">
                <tr>
                    <td width=70px align=center>
                       材料编码：
                    </td>
                    <td width=138px>
                        <asp:TextBox ID="txtId" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    <td style=" width:100px; padding-left:50px;" align="center">
                        <asp:LinkButton ID="lbSeach" runat="server" class="zPushBtn" 
                            onclick="lbSeach_Click"><img src="style/Icons/icon040a15.gif" width="20" height="20" /><b>搜索&nbsp;</b></asp:LinkButton><!--<input type="button" value="搜索"  />--></td>
                    <td></td>
                </tr>
                </table>
            </td>
         </tr>
         <tr>
         <td>
            <table style=" width:100%;">
                        <tr>
                            <td align="right" style="width:100px; height:25px;">材料图片：</td>
                            <td><asp:Image ID="ProImg" runat="server" /></td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">材料名称：</td>
                            <td><asp:Label ID="lbName" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">品牌：</td>
                            <td><asp:Label ID="lbPp" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">型号：</td>
                            <td><asp:Label ID="lbXh" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">规格：</td>
                            <td><asp:Label ID="lbGg" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">单位：</td>
                            <td>
                                <asp:Label ID="lbDw" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">材质：</td>
                            <td><asp:Label ID="lbCz" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">产地：</td>
                            <td><asp:Label ID="lbCd" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">生产厂商：</td>
                            <td><asp:Label ID="lbCp" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">材料编码：</td>
                            <td><asp:Label ID="lbCode" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">发布日期：</td>
                            <td><asp:Label ID="lbDate" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">备注：</td>
                            <td><asp:Label ID="lbRemark" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px; ">本站特供价：</td>
                            <td><asp:Label ID="lbTgj" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">供应商名称：</td>
                            <td><asp:Label ID="lbGys" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                        <td align="right" style="width:100px; height:25px;">供应商详情：</td>
                            <td >
                            <table>
                                <tr>
                                    <td colspan="3" height="30">
                                        地址：<asp:Label ID="lbAddress" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                <td width=200px height=30>
                                    电话：<asp:Label ID="lbPhone" runat="server" ></asp:Label>
                                </td>
                                <td width=200px>
                                   手机：<asp:Label ID="lbMobile" runat="server" ></asp:Label>
                                </td>
                                <td width=200px>
                                   传真：<asp:Label ID="lbFax" runat="server" ></asp:Label>
                                </td>
                                </tr>
                                <tr>
                                <td  height=30>
                                    联系人：<asp:Label ID="lbLxr" runat="server" ></asp:Label>
                                </td>
                                <td>
                                   Email：<asp:Label ID="lbEmail" runat="server" ></asp:Label>
                                </td>
                                <td>
                                    邮编：<asp:Label ID="lbYb" runat="server" ></asp:Label>
                                </td>
                                </tr>
                                <tr>
                                <td colspan="3" height=30>
                                    网址：<asp:Label ID="lbSite" runat="server" ></asp:Label>
                                </td>
                                </tr>
                                </table>
                            
                            
                            
                            
                            </td>
                        </tr>
                </table>      
         </td>
         </tr>   
         <tr>
            <td></td>
         </tr>
        </table>
        
    </td>
    <td class="right_Bg"></td>
</tr>
</table>
    </form>
</body>
</html>

