<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Rgxj.aspx.cs" Inherits="JDJS.Web.Rgxj" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div class="SubMain">
    <img alt="" src="style/images/Market-tl.gif" />
    <div class="SubCenter">
        <img alt="" src="style/images/rgxj-tl.gif" />
    <div class="subbody">
            <%--<div class="detailtitle"><asp:Label ID="lbTitle" runat="server" ></asp:Label></div>--%>
            <div class="detailbody" style=" text-align:center;">
                <table style="margin:auto; font-size:14px;">
                    <tr>
                    <td align="right" height=30>
                        会员编号：</td>
                        <td align="left">
                            <asp:Label ID="lbUserName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                    <td align="right" height=30>
                        <strong>材料编码：</strong></td>
                    <td align="left">
                        <asp:Label ID="lbCode" runat="server" ></asp:Label>
                    </td>
                    </tr>
                    <tr>
                    <td align="right" height=30>
                        材料名称：</td>
                    <td align="left">
                        <asp:Label ID="lbName" runat="server" ></asp:Label></td>
                    </tr>
                    <tr>
                    <td align="right" height=30>
                        询价方式：</td>
                    <td align="left">
                        <a style=" text-decoration:underline;" href="xjlc.htm">询价流程详解</a> 或 直接拨打下方询价热线。</td>
                    </tr>
                    <tr>
                        <td align="right" height="30">
                            <strong>联系方式：</strong></td>
                        <td align="left">021-54591008-8006</td>
                    </tr>
                    <tr>
                        <td colspan="2" height="30">
                            <asp:Button ID="btnReturn" runat="server" onclick="btnReturn_Click" 
                                Text="返回继续查询" />
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


