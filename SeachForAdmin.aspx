<%@ Page Title="" Language="C#"  MasterPageFile="~/MasterPage.master"  AutoEventWireup="true" CodeBehind="SeachForAdmin.aspx.cs" Inherits="JDJS.Web.SeachForAdmin" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="Stylesheet" href="style/datePicker.css" type="text/css" />
<script type="text/javascript" src="js/jquery.core.js"></script>
<script type="text/javascript" src="js/jquery.datePicker.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<script type="text/javascript">
    jQuery(function() {
        $(".date-pick").datepicker({changeMonth:true,changeYear:true});
    }); 
</script>
<div class="SubMainBig">
    <img alt="" src="style/images/Material-tl-bg.gif" />
    <div class="SubTopBig">
       <table style="width: 760px;">
            <tr>
                <td width=70px align=center>
                   关键字：
                </td>
                <td width=138px>
                    <asp:TextBox ID="txtTitle" runat="server" Width="130px"></asp:TextBox>
                </td>
                <td><asp:Button ID="btnSeach" runat="server" Text="搜索" onclick="btnSeach_Click" 
                        Height="24px" Width="70px" /></td>
            </tr>
            
        </table>
    </div>
    <table style="width:765px;border-collapse:collapse; color:#003399;" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc"   >   
        <tr style=" background:#003399; color:#ffffff; font-weight:bold;" >
            <td height=30 align=center>管理员查询</td>
        </tr>
       <tr>
           <td>
                
           </td>
       </tr>
    </table>
    <uc1:UcfarPager ID="Pager" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
</div>
</asp:Content>
