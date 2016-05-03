<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ProjectDetail.aspx.cs" Inherits="JDJS.Web.ProjectDetail" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div class="SubMain">
    <img alt="" src="style/images/Project-tl.gif" />
    <div class="SubCenter">
       <asp:Image ID="ImgBg" runat="server" /><div class="subbody">
            <div class="detailtitle"><asp:Label ID="lbTitle" runat="server" ></asp:Label></div>
            <div class="detailtime"><asp:Label ID="lbTime" runat="server"></asp:Label></div>
            <div class="detailbody">
            <asp:Panel ID="Plinvite" runat="server" Visible="False">
                <table style="width: 100%;">
                    <tr>
                        <td width=20%>
                            招标类型：
                        </td>
                        <td>
                            <asp:Label ID="lbType" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           报建编号：
                        </td>
                        <td>
                            <asp:Label ID="lbNb" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            招标单位：
                        </td>
                        <td>
                           <asp:Label ID="lbCp" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            招标代理单位：
                        </td>
                        <td>
                           <asp:Label ID="lbZbdw" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            工程名称：
                        </td>
                        <td>
                            <asp:Label ID="lbGc" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           建设地点：
                        </td>
                        <td>
                            <asp:Label ID="lbAdd" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           投资规模(万元)：
                        </td>
                        <td>
                           <asp:Label ID="lbGm" runat="server" ></asp:Label>
                        </td>
                    </tr>
                     <tr>
                        <td>
                           建筑面积(平方米)：
                        </td>
                        <td>
                           <asp:Label ID="lbArea" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           联 系 人：
                        </td>
                        <td>
                            <asp:Label ID="lbLxr" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           电 话：
                        </td>
                        <td>
                           <asp:Label ID="lbPhone" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           手机：
                        </td>
                        <td>
                             <asp:Label ID="LbMobil" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           报名日期：

                        </td>
                        <td>
                            <asp:Label ID="lbDate" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           报名地点：

                        </td>
                        <td>
                            <asp:Label ID="lbBmadd" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           报名条件：

                        </td>
                        <td>
                            <asp:Label ID="lbTj" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            项目类别：</td>
                        <td>
                            <asp:Label ID="lbXmType" runat="server" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            工程类别：</td>
                        <td>
                            <asp:Label ID="lbGcType" runat="server" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            标段号：</td>
                        <td>
                            <asp:Label ID="lbBdNum" runat="server" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                           备 注：

                        </td>
                        <td>
                            <asp:Label ID="lbRemark" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lbOther" runat="server" ></asp:Label></td>
                    </tr>
                </table>
                </asp:Panel>
                <asp:Panel ID="Plresult" runat="server" Visible="False">
                <table style="width: 100%;">
                    <tr>
                        <td width=20%>
                            中标类型：
                        </td>
                        <td>
                            <asp:Label ID="lbZbType" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           招标单位：
                        </td>
                        <td>
                            <asp:Label ID="lbZbCp" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            中标价(万元)：
                        </td>
                        <td>
                           <asp:Label ID="lbZbPrice" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            工程名称：
                        </td>
                        <td>
                           <asp:Label ID="lbZbTitle" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            建设地点：
                        </td>
                        <td>
                            <asp:Label ID="lbZbAdd" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           中标单位：
                        </td>
                        <td>
                            <asp:Label ID="lbZbzbCp" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           建筑面积(平方米)：
                        </td>
                        <td>
                           <asp:Label ID="lbZbArea" runat="server" ></asp:Label>
                        </td>
                    </tr>
                     <tr>
                        <td>
                           中标日期：
                        </td>
                        <td>
                           <asp:Label ID="lbZbTime" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           工期：
                        </td>
                        <td>
                            <asp:Label ID="lbZbGTime" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           中标通知书编号：
                        </td>
                        <td>
                            <asp:LinkButton ID="lbZbNb" runat="server" ></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           发包方式：
                        </td>
                        <td>
                             <asp:Label ID="lbZbBag" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            招标代理单位：</td>
                        <td>
                            <asp:Label ID="lbZbDl" runat="server" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            项目负责人姓名：</td>
                        <td>
                            <asp:Label ID="lbFzr" runat="server" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            备 注： 
                        </td>
                        <td>
                            <asp:Label ID="lbZbRemark" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lbOther1" runat="server" ></asp:Label></td>
                    </tr>
                </table>
                </asp:Panel>
            </div>      
       </div>
       <div class="subfoot"></div>
    </div>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>
