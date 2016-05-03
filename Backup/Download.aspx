<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Download.aspx.cs" Inherits="JDJS.Web.Download" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div class="SubMain">
    <img alt="" src="style/images/Download-tl.gif" />
    <div class="downloadimg">
        <a href="DownloadDetail.aspx?type=1"><img border=0 alt="" src="style/images/download1.gif" /></a><br /><a href="DownloadDetail.aspx?type=1">建筑相关文档下载</a>
    </div>
    <div class="downloadimg">
        <a href="DownloadDetail.aspx?type=2"><img border=0 alt="" src="style/images/download2.gif" /></a><br /><a href="DownloadDetail.aspx?type=2">标准规范下载</a>
    </div>
    <div class="downloadimg">
        <a href="DownloadDetail.aspx?type=3"><img border=0 alt="" src="style/images/download3.gif" /></a><br /><a href="DownloadDetail.aspx?type=3">《上海建设工程造价信息》电子版</a>
    </div>
    <div class="downloadimg">
    </div>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>