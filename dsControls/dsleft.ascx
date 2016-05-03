<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="dsleft.ascx.cs" Inherits="JDJS.Web.Controls.dsleft" %>
<%@ Register Src="~/dsControls/dsLeftSeach.ascx" TagName="dsLeftSeach" TagPrefix="uc1" %>
<%@ Register Src="~/dsControls/dsMatTree.ascx" TagName="dsMatTree" TagPrefix="uc1" %>
<%@ Register Src="~/dsControls/dsLeftCmp.ascx" TagName="dsLeftCmp" TagPrefix="uc1" %>
<%@ Register Src="~/dsControls/dsLeftLinkman.ascx" TagName="dsLeftLinkman" TagPrefix="uc1" %>
<%@ Register Src="~/dsControls/dsLeftInfo.ascx" TagName="dsLeftInfo" TagPrefix="uc1" %>
<%@ Register Src="~/dsControls/dsyqlinks.ascx" TagName="dsyqlinks" TagPrefix="uc1" %>
<div id="main-left">
<uc1:dsLeftSeach id="dsLeftSeach" runat="server"></uc1:dsLeftSeach>
<uc1:dsMatTree id="dsMatTree" runat="server"></uc1:dsMatTree>
<uc1:dsLeftCmp id="dsLeftCmp" runat="server"></uc1:dsLeftCmp>
<uc1:dsLeftLinkman id="dsLeftLinkman" runat="server"></uc1:dsLeftLinkman>
<uc1:dsLeftInfo id="dsLeftInfo" runat="server"></uc1:dsLeftInfo>
<uc1:dsyqlinks id="dsyqlinks" runat="server"></uc1:dsyqlinks>
        
</div>