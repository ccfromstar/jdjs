<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Information.ascx.cs" Inherits="JDJS.Web.Controls.Information" %>
<%@ Register Src="~/Controls/Successful.ascx" TagName="Successful" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/Tender.ascx" TagName="Tender" TagPrefix="uc1" %>
<div class="Information">
<uc1:Successful id="Successful" runat="server"></uc1:Successful>
<uc1:Tender id="Tender" runat="server"></uc1:Tender>
</div>