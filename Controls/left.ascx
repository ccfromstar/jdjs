<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="left.ascx.cs" Inherits="JDJS.Web.Controls.left" %>
<%@ Register Src="~/Controls/notice.ascx" TagName="notice" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/other.ascx" TagName="other" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/leftbook.ascx" TagName="leftbook" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/zcdw.ascx" TagName="zcdw" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/JDdsleft.ascx" TagName="JDdsleft" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/indexpromat.ascx" TagName="indexpromat" TagPrefix="uc1" %>

<div id="main-left">
<uc1:JDdsleft id="JDdsleft" runat="server"></uc1:JDdsleft>
<uc1:indexpromat id="indexpromat" runat="server"></uc1:indexpromat>
<uc1:leftbook id="leftbook" runat="server"></uc1:leftbook>
 
<uc1:notice id="notice" runat="server"></uc1:notice>    
<uc1:other id="other" runat="server"></uc1:other>
<uc1:zcdw id="zcdw" runat="server"></uc1:zcdw>
    
</div>