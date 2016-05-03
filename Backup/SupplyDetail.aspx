<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="SupplyDetail.aspx.cs" Inherits="JDJS.Web.SupplyDetail" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div class="SubMain">
    <img alt="" src="style/images/Supply-tl.gif" />
    <div class="SubCenter">
       <asp:Image ID="ImgBg" runat="server" /><div class="subbody">
                <div class="detailtitle"><asp:Label ID="lbTitle" runat="server" ></asp:Label></div>
                <div class="detailbody">
                    <table style="width: 100%;">
                        <tr>
                            <td width=15%>发布单位：</td>
                            <td colspan="3">
                                <asp:Label ID="lbCp" runat="server" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>联系人：</td>
                            <td width=35%>
                                <asp:Label ID="lbLxr" runat="server" ></asp:Label>
                            </td>
                            <td width=15%>联系电话：</td>
                            <td width=35%>
                                <asp:Label ID="lbPhone" runat="server" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>单位地址：</td>
                            <td colspan="3">
                                <asp:Label ID="lbAdd" runat="server" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>邮编：</td>
                            <td>
                                <asp:Label ID="lbYb" runat="server" ></asp:Label>
                            </td>
                            <td>传真：</td>
                            <td>
                                <asp:Label ID="lbFax" runat="server" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>货品名称：</td>
                            <td colspan="3">
                                <asp:Label ID="lbHname" runat="server" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>货品类别：</td>
                            <td>
                                <asp:Label ID="lbType" runat="server" ></asp:Label>
                            </td>
                            <td>货品单位：</td>
                            <td>
                                <asp:Label ID="lbDw" runat="server" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>货品单价：</td>
                            <td>
                                <asp:Label ID="lbPrice" runat="server" ></asp:Label>
                            </td>
                            <td>货品总量：</td>
                            <td>
                                <asp:Label ID="lbAllCount" runat="server" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>货品总价：</td>
                            <td>
                                <asp:Label ID="lbAllPrice" runat="server" ></asp:Label>
                            </td>
                            <td>发布日期：</td>
                            <td>
                                <asp:Label ID="lbDate" runat="server" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>简述：</td>
                            <td>
                                &nbsp;</td>
                            <td>&nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <asp:Label ID="lbContent" runat="server" ></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>        
       </div>
       <div class="subfoot"></div>
    </div>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>

