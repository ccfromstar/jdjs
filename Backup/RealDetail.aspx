<%@ Page Title="材料详情" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="RealDetail.aspx.cs" Inherits="JDJS.Web.RealDetail" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div class="SubMain">
    <img alt="" src="style/images/Market-tl.gif" />
    <div class="SubCenter">
        <img alt="" src="style/images/clxq-tl.gif" />
    <div class="subbody">
                <div class="detailbody">
                    <table style=" width:100%; font-size:14px;">
                        <tr>
                            <td align="right" style="width:100px; height:25px;">材料图片：</td>
                            <td><asp:Image ID="ProImg" runat="server" /></td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">材料名称：</td>
                            <td><asp:Label ID="lbName" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">品牌：</td>
                            <td><asp:Label ID="lbPp" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">型号：</td>
                            <td><asp:Label ID="lbXh" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">规格：</td>
                            <td><asp:Label ID="lbGg" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">单位：</td>
                            <td>
                                <asp:Label ID="lbDw" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">材质：</td>
                            <td><asp:Label ID="lbCz" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">产地：</td>
                            <td><asp:Label ID="lbCd" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">生产厂商：</td>
                            <td><asp:Label ID="lbCp" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">材料编码：</td>
                            <td><asp:Label ID="lbCode" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">发布日期：</td>
                            <td><asp:Label ID="lbDate" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">备注：</td>
                            <td><asp:Label ID="lbRemark" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px; color:Red; font-weight:bold;">本站特供价：</td>
                            <td><asp:Label ID="lbTgj" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">供应商名称：</td>
                            <td>
                                <asp:LinkButton ID="lbGys" runat="server"></asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width:100px; height:25px;">&nbsp;</td>
                            <td>
                                <asp:Button ID="btnRgxj" runat="server" Text="人工询价" onclick="btnRgxj_Click" />
                                <asp:Button ID="btnGys" runat="server" Text="供应商详情" onclick="btnGys_Click" />
                                <asp:Button ID="btnReturn" runat="server" Text="返回继续查询" 
                                    onclick="btnReturn_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
       </div>
       <div class="subfoot"></div>
    </div>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>
