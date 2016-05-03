<%@ Page Language="C#" MasterPageFile="dsMasterPage.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="JDJS.Web.wanlang.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div></div>
 <div class="dscontact">  
        <table align= "center" width="50%">
            <tr>
                <td  style ="width:80px"></td>
                <td style="text-align:right;width:60px">联系人：</td>
                <td style="padding-right:50px;max-width:200px"><asp:Label ID="clm" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                    <td  style ="width:80px"></td>                  
                    <td style=" text-align:right;width:60px">手机：</td>
                    <td style="padding-right:50px;max-width:200px"><asp:Label ID="chs" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                    <td  style ="width:80px"></td>
                    <td style="text-align:right;width:60px">电话：</td>
                    <td style="padding-right:50px;max-width:200px"><asp:Label ID="cph" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                    <td  style ="width:80px"></td>
                    <td style="text-align:right;width:60px">传真：</td>
                    <td style="padding-right:50px;max-width:200px"><asp:Label ID="cfax" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td  style ="width:80px"></td>
                <td style="text-align:right;width:60px">地址：</td>
                <td style="padding-right:50px;max-width:200px"><asp:Label ID="caddr" runat="server" Text="Label"></asp:Label></td>               
            </tr>
        </table>
 </div>
</asp:Content>
