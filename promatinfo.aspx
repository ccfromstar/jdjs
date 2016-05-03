<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="promatinfo.aspx.cs" Inherits="JDJS.Web.promatinfo" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 124px;
        }
        .style2
        {
            width: 124px;
            height: 17px;
        }
        .style3
        {
            height: 17px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
 <div class="SubMain">
        <table style="width: 100%;" border="1" cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="style1"><asp:Label ID="zname" runat="server">采购产品名称：</asp:Label></td>
                            <td><asp:Label ID="matname" runat="server"></asp:Label></td>
                        </tr>
                         <tr>
                            <td class="style2"><asp:Label ID="zptime" runat="server">信息发布日期：</asp:Label></td>
                            <td class="style3"><asp:Label ID="ptime" runat="server"></asp:Label></td>
                        </tr>
                          <tr>
                            <td class="style1"><asp:Label ID="zrecstate" runat="server">当前状态：</asp:Label></td>
                            <td><asp:Label ID="recstate" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="style1"><asp:Label ID="project" runat="server" Font-Bold="True" 
                                    ForeColor="Blue">所属工程项目名称：</asp:Label></td>
                            <td>
                                <asp:HyperLink ID="proname" runat="server" Font-Bold="True" ForeColor="Blue" 
                                    Target="_self" ToolTip="点击查看工程详情" Font-Underline="True" >HyperLink</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td class="style1"><asp:Label ID="zunit" runat="server">计量单位：</asp:Label></td>
                            <td><asp:Label ID="matunit" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="style1"><asp:Label ID="zclass" runat="server">要求品牌：</asp:Label></td>
                            <td><asp:Label ID="matclass" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="style1"><asp:Label ID="zxh" runat="server">产品型号：</asp:Label></td>
                            <td><asp:Label ID="matxh" runat="server"></asp:Label></td>
                        </tr>
                        
                        <tr>
                            <td class="style1"><asp:Label ID="zgg" runat="server">产品规格：</asp:Label></td>
                            <td><asp:Label ID="matgg" runat="server"></asp:Label></td>
                        </tr>
                         <tr>
                            <td class="style1"><asp:Label ID="zrek" runat="server">备注：</asp:Label></td>
                            <td><asp:Label ID="matrek" runat="server"></asp:Label></td>
                        </tr>

                        <tr>
                            <td class="style1"><asp:Label ID="zamount" runat="server">采购总量：</asp:Label></td>
                            <td><asp:Label ID="matamount" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="style1"><asp:Label ID="zlprice" runat="server">采购方采购单价：</asp:Label></td>
                            <td><asp:Label ID="matlprice" runat="server"></asp:Label></td>
                        </tr>

                         <tr>
                            <td class="style1"><asp:Label ID="zstime" runat="server">采购起始日期：</asp:Label></td>
                            <td><asp:Label ID="stime" runat="server"></asp:Label></td>
                        </tr>

                         <tr>
                            <td class="style1"><asp:Label ID="zftime" runat="server">采购截止日期：</asp:Label></td>
                            <td><asp:Label ID="ftime" runat="server"></asp:Label></td>
                        </tr>


                        <tr>
                            <td class="style1"><asp:Label ID="zgycid" runat="server">成交供应商：</asp:Label></td>
                            <td><asp:Label ID="gycompany" runat="server"></asp:Label></td>
                        </tr>

                         <tr>
                            <td class="style1"><asp:Label ID="zcount" runat="server">已成交总量：</asp:Label></td>
                            <td><asp:Label ID="matcount" runat="server"></asp:Label></td>
                        </tr>

                          <tr>
                            <td class="style1"><asp:Label ID="zpprice" runat="server">成交单价：</asp:Label></td>
                            <td><asp:Label ID="matpprice" runat="server"></asp:Label></td>
                        </tr>
                           
                         <tr>
                            <td class="style1"><asp:Label ID="zbtime" runat="server">成交日期：</asp:Label></td>
                            <td><asp:Label ID="btime" runat="server"></asp:Label></td>
                        </tr>
                        

                        <tr>
                            <td class="style1"><asp:Label ID="zlinkman" runat="server" Font-Bold="True" 
                                    ForeColor="Red">采购联络人：</asp:Label></td>
                            <td><asp:Label ID="linkman" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></td>
                        </tr>

                        <tr>
                            <td class="style1"><asp:Label ID="zphone" runat="server" Font-Bold="True" 
                                    ForeColor="Red">联络人电话/手机：</asp:Label></td>
                            <td><asp:Label ID="phone" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></td>
                        </tr>
                        
                        
                    </table> 
                    
                    <a href="javascript:history.back(-1)" class="stylelink">[返回]</a>  
    </div>
    <uc1:subgg id="SubGG" runat="server"></uc1:subgg>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
