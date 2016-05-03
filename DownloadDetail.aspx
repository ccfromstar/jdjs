<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="DownloadDetail.aspx.cs" Inherits="JDJS.Web.DownloadDetail" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div class="SubMain">
    <img alt="" src="style/images/Download-tl.gif" />
    <asp:Panel ID="Panel1" runat="server" Visible="False">
        <div style=" font-size:14px; font-weight:bold; height:20px; padding-top:10px; padding-bottom:10px;">
        <asp:Button ID="lbProject1" Height="24px" Width="70px" runat="server" onclick="lbProject_Click" Text="项 目" />
        <asp:Button ID="lbBuild1" Height="24px" Width="70px" runat="server" onclick="lbBuild_Click" Text="建 材" />
        <asp:Button ID="lbEnterprise1" Height="24px" Width="70px" runat="server" onclick="lbEnterprise_Click" Text="企 业" />
        <asp:Button ID="lbStaff1" Height="24px" Width="70px" runat="server" onclick="lbStaff_Click" Text="人 员" />
        </div>
	    <table style="width:625px;border-collapse:collapse; color:#003399;" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc"   >  
	     <tr>
	        <td colspan="2" style=" background:#003399; color:#ffffff; font-weight:bold; height:30px;">　办事指南</td>
	    </tr>         
        <asp:Repeater ID="ListLaw" runat="server">
        <ItemTemplate>
                <tr>
                <td width=50%  height=30>　<a href="<%#Eval("url") %>" target="_blank"><%#Eval("name") %></a></td>
        </ItemTemplate>
        <AlternatingItemTemplate>
                <td width=50%>　<a href="<%#Eval("url") %>" target="_blank"><%#Eval("name") %></a></td>
                </tr>
        </AlternatingItemTemplate>
        </asp:Repeater>
        </table>
	    <table style=" margin-top:10px; width:625px;border-collapse:collapse; color:#003399;" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc"   > 
	    <tr >
	        <td colspan="2" style=" background:#003399; color:#ffffff; font-weight:bold;height:30px;">　相关下载</td>
	    </tr>    
        <asp:Repeater ID="ListOther" runat="server">
        <ItemTemplate>
                <tr>
                <td width=50% height=30>　<a href="<%#Eval("url") %>" target="_blank"><%#Eval("name") %></a></td>
        </ItemTemplate>
        <AlternatingItemTemplate>
         <td width=50%>　<a href="<%#Eval("url") %>" target="_blank"><%#Eval("name") %></a></td>
                </tr>
        </AlternatingItemTemplate>
        </asp:Repeater>
        </table>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Visible="False">
    </asp:Panel>
    <asp:Panel ID="Panel3" runat="server" Visible="False">
    	<asp:ScriptManager ID="ScriptManager1" runat="server" ></asp:ScriptManager>
        <table style=" margin-top:20px; width:625px;border-collapse:collapse; color:#003399;" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc"   >  
	     <tr>
	        <td colspan="2" style=" background:#003399; color:#ffffff; font-weight:bold; height:30px;">　《上海建设工程造价信息》电子版　按月下载</td>
	    </tr> 
	    <tr>
	        <td style=" width:525px; height:50px;">　
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                　<asp:DropDownList ID="ddlyear1" runat="server" 
                        onselectedindexchanged="ddlyear1_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList>　年　<asp:DropDownList ID="ddlmonth1" runat="server">
                </asp:DropDownList>　月　</ContentTemplate></asp:UpdatePanel>
            </td>
	        <td style=" width:100px;" align=center><asp:Button ID="btnDownload1" runat="server" Text="下载" 
                    onclick="btnDownload1_Click" Width="70px" Height="25px" /></td>
	    </tr>
	    </table>
	    <table style="margin-top:20px; width:625px;border-collapse:collapse; color:#003399;" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc"   >  
	    <tr>
	        <td colspan="2" style=" background:#003399; color:#ffffff; font-weight:bold; height:30px;">　《上海建设工程造价信息》电子版　按年下载</td>
	    </tr>
	    <tr>
	        <td style=" width:525px; height:50px;">　<asp:DropDownList ID="ddlyear2" runat="server">
                </asp:DropDownList>　</td>
	        <td style=" width:100px;" align=center><asp:Button ID="btnDownload2" runat="server" Text="下载" 
            onclick="btnDownload2_Click" Width="70px" Height="25px"  /></td>
	    </tr>
	    </table>
	    <table style="margin-top:20px; width:625px;border-collapse:collapse; color:#003399;" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc"   >  
	    <tr>
	        <td colspan="2" style=" background:#003399; color:#ffffff; font-weight:bold; height:30px;">　《上海市建筑工程常用要素价格汇编》电子版　年度下载</td>
	    </tr>
	    <tr>
	        <td style="width:525px;  height:50px;">　<asp:DropDownList ID="ddlyear3" runat="server">
                </asp:DropDownList></td>
	        <td style=" width:100px;" align=center><asp:Button ID="btnDownload3" runat="server" Text="下载" 
            onclick="btnDownload3_Click" Width="70px" Height="25px"  /></td>
	    </tr>
	    </table>
	    <table style="margin-top:20px; width:625px;border-collapse:collapse; color:#003399;" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc"   >  
	    <tr>
	        <td colspan="2" style=" background:#003399; color:#ffffff; font-weight:bold; height:30px;">　《上海市建设工程价格与指数》电子版　年度下载</td>
	    </tr>
	    <tr>
	        <td style=" width:525px; height:50px;">　<asp:DropDownList ID="ddlyear4" runat="server">
                </asp:DropDownList></td>
	        <td style=" width:100px;" align=center><asp:Button ID="btnDownload4" runat="server" Text="下载" 
            onclick="btnDownload4_Click" Width="70px" Height="25px"  /></td>
	    </tr>
	    </table>
   
            <div style=" line-height:25px; margin-top:20px; padding-left:15px;">注意：1.如果下载后不能正常打开，请下载补丁。<asp:Button ID="btnDownload5" runat="server" 
                    Text="点击下载" onclick="btnDownload5_Click" Height="25px" Width="80px"  />
                <br />
                  　　　2.如果不能正常下载，请在ie安全设置中勾选允许自动下载提示选项<br>
            </div>
    </asp:Panel>
    <asp:Panel ID="Panel4" runat="server" Visible="False">
         <table style="width:625px;border-collapse:collapse; color:#003399;" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc"   >  
	     <tr>
	        <td colspan="2" style=" background:#003399; color:#ffffff; font-weight:bold; height:30px;">　办事指南</td>
	    </tr>         
            <asp:Repeater ID="RepDW4" runat="server">
             <ItemTemplate>
                <tr>
                <td width=50% height=30>　<a href="<%#Eval("address") %>" target="_blank"><%#Eval("bookname")%></a></td>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <td width=50%>　<a href="<%#Eval("address") %>" target="_blank"><%#Eval("bookname")%></a></td>
                </tr>
            </AlternatingItemTemplate>
            </asp:Repeater>
        </table>
    </asp:Panel>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>
