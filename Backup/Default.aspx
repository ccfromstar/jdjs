<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="JDJS.Web.Default" %>
<%@ Register Src="~/Controls/Information.ascx" TagName="Information" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/Enterprise.ascx" TagName="Enterprise" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/adv.ascx" TagName="adv" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/GGDControl.ascx" TagName="GGDControl" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/yqlinks.ascx" TagName="yqlinks" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/bbsAndFreePro.ascx" TagName="bbsAndFreePro" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/matseach.ascx" TagName="matseach" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/GLJdefault.ascx" TagName="GLJdefault" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
   
    <uc1:adv id="adv" runat="server"></uc1:adv>
    <uc1:Enterprise id="Enterprise" runat="server"></uc1:Enterprise>
    <uc1:GLJdefault id="GLJdefault" runat="server"></uc1:GLJdefault>
    <uc1:matseach id="matseach" runat="server"></uc1:matseach> 
    
    <uc1:bbsAndFreePro id="bbsAndFreePro" runat="server"></uc1:bbsAndFreePro>
    <uc1:Information id="Information" runat="server"></uc1:Information>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">

<uc1:yqlinks id="yqlinks" runat="server"></uc1:yqlinks>
</asp:Content>
