<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GG.aspx.cs" Inherits="JDJS.Web.ProjectGL.GG" %>

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
            <td colspan="7">
               <div style="float: left">
                
                </div>
            </td>
         </tr>
         <tr>
            <td align="right" style="width:70px;">标题：</td>
            <td style="width:200px;"><asp:TextBox ID="txtTitle" runat="server" Width="190px"></asp:TextBox></td>
            <td align="right" style="width:70px;">链接：</td>
            <td style="width:200px;"><asp:TextBox ID="txtLink" runat="server" Width="190px"></asp:TextBox></td>
            <td align="right" style="width:70px;">图片：</td>
            <td style="width:250px;"><asp:FileUpload ID="FileUpload1" runat="server" /></td>
            <td align="right" style="width:70px;">速度：</td>
            <td style="width:70px;"><asp:TextBox ID="txtSd" runat="server" Width="70px"></asp:TextBox></td>
            <td><asp:Button ID="btnUpload" runat="server" Text="添加" onclick="btnUpload_Click" /></td>
         </tr>
         <tr>
            <td colspan="7">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="XmlDataSource1">
                    <HeaderTemplate>
                    <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                        <tr class="dataTableHead">
                            <td>
                                <span style=" width:200px; float:left"><b>标题</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                            </td>
                            <td>
                                <span style="float:left"><b>链接</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                            </td>
                            <td width="150px;">
                                <span style="float:left"><strong>操作</strong></span>
                                <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                            </td>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                    <tr class="dataTableBody">
                        <td><%#Eval("title")%></td>
                        <td><%#Eval("url")%></td>
                        <td>
                            <asp:LinkButton ID="linkBtnDel" OnClick="Delete_Click" OnClientClick="" CommandArgument='<%#Eval("title")%>' runat="server" CssClass="zPushBtn"><img src="style/Icons/icon003a3.gif" width="20" height="20" /><b>删除&nbsp;</b></asp:LinkButton></a></td>
                    </tr>
                    </ItemTemplate>
                    <FooterTemplate></table></FooterTemplate>
                </asp:Repeater>
            </td>
         </tr>
        </table>
        
    </td>
    <td class="right_Bg"></td>
</tr>
</table>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" 
        DataFile="~/xml/viewerData.xml"></asp:XmlDataSource>
    </form>
</body>
</html>