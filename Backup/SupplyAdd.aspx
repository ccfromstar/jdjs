<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="SupplyAdd.aspx.cs" Inherits="JDJS.Web.SupplyAdd" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
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
<div class="SubMain">
    <img alt="" src="style/images/Supply-tl.gif" />
    <div class="SubCenter">
       <asp:Image ID="ImgBg" runat="server" /><div class="subbody">
       <table style=" width:602px; margin-top:10px; margin-bottom:10px; margin-left:10px;">
       <tr>
            <td align=center colspan="11" >
                <asp:Panel ID="PanUser" runat="server">
                    <table style=" width:592px;">
                    <tr>
                        <td>公司：</td>
                        <td><asp:TextBox ID="lbCp" runat="server"></asp:TextBox></td>
                        <td>地址：</td>
                        <td><asp:TextBox ID="lbAdd" runat="server"></asp:TextBox></td>
                     
                    </tr>
                    <tr>
                       <td>联系人：</td>
                        <td><asp:TextBox ID="lbLxr" runat="server"></asp:TextBox></td>
                        <td>电话：</td>
                        <td><asp:TextBox ID="lbPhone" runat="server"></asp:TextBox></td>
                      
                    </tr>
                    <tr>
                      <td>邮编：</td>
                        <td><asp:TextBox ID="lbYb" runat="server"></asp:TextBox></td>
                        <td>传真：</td>
                        <td><asp:TextBox ID="lbFax" runat="server"></asp:TextBox></td>
                    </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style=" width:120px; height:35px;" align=center >货品类别：</td>
            <td style=" width:60px;">
                <asp:DropDownList ID="ddlClass" runat="server" Width="55px">
                    <asp:ListItem Value="0">人工</asp:ListItem>
                    <asp:ListItem Value="1">材料</asp:ListItem>
                    <asp:ListItem Value="2">机械</asp:ListItem>
                    <asp:ListItem Value="3">设备</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style=" width:40px;" align=center>单价：</td>
            <td style=" width:60px;">
                <asp:TextBox ID="txtDw" runat="server" Width="55px"></asp:TextBox>
            </td>
            <td style=" width:40px;" align=center>单价：</td>
            <td style=" width:60px;">
                <asp:TextBox ID="txtDj" runat="server" Width="55px"></asp:TextBox>
            </td>
            <td style=" width:40px;" align=center>数量：</td>
            <td style=" width:60px;">
                <asp:TextBox ID="txtCount" runat="server" Width="55px"></asp:TextBox>
            </td>
            <td style=" width:40px;" align=center>总价：</td>
            <td style=" width:60px;">
                <asp:TextBox ID="txtAllPrice" runat="server" Width="55px"></asp:TextBox>
            </td>
            <td></td>
        </tr>
        <tr>
            <td style=" height:35px;" align=center >货品名称：</td>
            <td colspan="9">
                <asp:TextBox ID="txtZname" runat="server" Width="490px" ></asp:TextBox>
            </td>
            <td style=" width:22px;"></td>
        </tr>
        
        <tr>
            <td style=" height:35px;" align=center >信息标题：</td>
            <td colspan="9" >
                <asp:TextBox ID="txtTitle" runat="server" Width="490px" ></asp:TextBox>
            </td>
            <td ></td>
        </tr>
        <tr>
            <td style=" height:35px;" align=center >发布时间：</td>
            <td colspan="9" >
                <asp:TextBox ID="txtDate" CssClass="date-pick" runat="server"></asp:TextBox></td>
            <td ></td>
        </tr>
        <tr>
            <td align=center >备注：</td>
            <td colspan="9" >
                <asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine" Width="490px" 
                    Height="145px"></asp:TextBox></td>
            <td ></td>
        </tr>
        <tr>
            <td style=" height:35px;" align=center colspan="11" >
                <asp:Button ID="btnSubmit" runat="server" Height="24px" Width="70px" Text="提交" 
                    onclick="btnSubmit_Click" />
            </td>
        </tr>
       </table>
       
       </div>
       <div class="subfoot"></div>
    </div>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>


