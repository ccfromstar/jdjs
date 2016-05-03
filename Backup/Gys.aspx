<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Gys.aspx.cs" Inherits="JDJS.Web.Gys" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div class="SubMain">
    <img alt="" src="style/images/Market-tl.gif" />
    <div class="SubCenter">
       <asp:Image ID="ImgBg" runat="server" /><div class="subbody">
            <%--<div class="detailtitle"><asp:Label ID="lbTitle" runat="server" ></asp:Label></div>--%>
            <div class="detailbody">
                <asp:Panel ID="PanCp" runat="server" Visible="false">
                <table style="width:600px;  font-size:14px;">
                    <tr>
                        <td>
                            <asp:Label ID="lbBody" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width:600px; ">
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
                                <tr>
                                    <td colspan="3" height="30">
                                        <asp:Button ID="btnReturn" runat="server" onclick="btnReturn_Click" 
                                            Text="返回继续查询" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                </asp:Panel>
            </div>
       </div>
       <div class="subfoot"></div>
    </div>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>

