<%@ Page Title="上海建定建设工程信息网-行业人脉-公司信息-员工信息" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="StaffInfo.aspx.cs" Inherits="JDJS.Web.StaffInfo" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 22px;
        }
        .style2
        {
            font-size: medium;
            font-weight: bold;
        }
        .style3
        {
            height: 27px;
        }
        .style4
        {
            height: 22px;
        }
        .stylelink
        {
            font-weight: bold;Font-Size:12pt; text-decoration: underline; color:Blue;
         }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div class="SubMain">
        <table style="width: 100%;" border="1" cellpadding="1" cellspacing="1">
                        <tr>
                            <td><asp:Label ID="pname" runat="server">姓名：</asp:Label></td>
                            <td><asp:Label ID="lpname" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="pcompany" runat="server">任职公司：</asp:Label></td>
                            <td><asp:Label ID="lpcompany" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="pjob" runat="server">职务：</asp:Label></td>
                            <td><asp:Label ID="lpjob" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="pplace" runat="server">所在地：</asp:Label></td>
                            <td><asp:Label ID="lpplace" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="paddress" runat="server">地址：</asp:Label></td>
                            <td><asp:Label ID="lpaddress" runat="server"></asp:Label></td>
                        </tr>
                        
                        <tr>
                            <td><asp:Label ID="pphone" runat="server">电话：</asp:Label></td>
                            <td><asp:Label ID="lpphone" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="pfax" runat="server">传真：</asp:Label></td>
                            <td><asp:Label ID="lpfax" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="pemail" runat="server">Email:</asp:Label></td>
                            <td><asp:Label ID="lpemail" runat="server"></asp:Label></td>
                        </tr>
                        
                    </table>  
                    <a href="javascript:history.back(-1)" class="stylelink">[返回]</a>  
    </div>
 <uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>
