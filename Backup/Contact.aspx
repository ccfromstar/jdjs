<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="JDJS.Web.Contact" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div class="SubMain">
    <img alt="" src="style/images/Contact-tl.gif" />
    <table class="contacttb">
    <tr>
        <td colspan="2" align=center>上海标锭建设工程服务有限公司</td>
    </tr>
    <tr>
        <td width=120 align=right>公司地址：</td>
        <td>上海 漕溪路165号（华谊党校）1110室</td>
    </tr>
    <tr>
        <td align=right>邮　　编：</td>
        <td>200035</td>
    </tr>
    <tr>
        <td align=right>电　　话：</td>
        <td>021-54591008 021-64281662</td>
    </tr>
    <tr>
        <td align=right>传　　真：</td>
        <td>021-54596008</td>
    </tr>
    <tr>
        <td align=right>电子邮件：</td>
        <td><a href="mailto:postmaster@jdjs.com.cn">postmaster@jdjs.com.cn</a></td>
    </tr>
    <tr>
        <td align=right>网　　址：</td>
        <td><a href="http://www.jdjs.com.cn">http://www.jdjs.com.cn</a></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" align=center>
            <img alt="" src="style/images/map.jpg" /></td>
    </tr>
    </table>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>
