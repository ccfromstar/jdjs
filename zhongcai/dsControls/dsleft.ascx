<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="dsleft.ascx.cs" Inherits="JDJS.Web.zhongcai.dsControls.dsleft" %>
<%@ Register Src="dsLeftSeach.ascx" TagName="dsLeftSeach" TagPrefix="uc1" %>
<%@ Register Src="dsMatTree.ascx" TagName="dsMatTree" TagPrefix="uc1" %>
<%@ Register Src="dsLeftCmp.ascx" TagName="dsLeftCmp" TagPrefix="uc1" %>
<%@ Register Src="dsLeftLinkman.ascx" TagName="dsLeftLinkman" TagPrefix="uc1" %>
<%@ Register Src="dsLeftInfo.ascx" TagName="dsLeftInfo" TagPrefix="uc1" %>
<%@ Register Src="dsyqlinks.ascx" TagName="dsyqlinks" TagPrefix="uc1" %>
<div id="main-left">
<uc1:dsLeftSeach id="dsLeftSeach" runat="server"></uc1:dsLeftSeach>
<uc1:dsMatTree id="dsMatTree" runat="server"></uc1:dsMatTree>
<uc1:dsLeftCmp id="dsLeftCmp" runat="server"></uc1:dsLeftCmp>
<uc1:dsLeftLinkman id="dsLeftLinkman" runat="server"></uc1:dsLeftLinkman>
<uc1:dsLeftInfo id="dsLeftInfo" runat="server"></uc1:dsLeftInfo>
<uc1:dsyqlinks id="dsyqlinks" runat="server"></uc1:dsyqlinks>
        
</div>