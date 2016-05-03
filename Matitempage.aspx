<%@ Page Language="C#" MasterPageFile="~/MasterPage.master"  AutoEventWireup="true" CodeBehind="Matitempage.aspx.cs" Inherits="JDJS.Web.Matitempage" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">

<div style="width:794px; height:203px;float:left;">
        <asp:Label ID="specialname" runat="server" Font-Bold="True" 
            Font-Size="XX-Large"></asp:Label>
             <div style="height:20px"></div>
        <ul class="topul">
        <asp:Repeater ID="matitemlist" runat="server">
        <ItemTemplate>
           <li>  <a href="Seach.aspx?specialCode=<%#Eval("specialCode") %>&midcode=<%#Eval("itemcode") %>" target="_self" title="<%#Eval("name") %>"><%#LTP.Common.StringPlus.StrCut(Eval("name").ToString(), 16, "...")%></a></li>
        </ItemTemplate>
        </asp:Repeater>
        </ul>
</div>
</asp:Content>