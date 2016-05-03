<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="project_company_seach.aspx.cs" Inherits="JDJS.Web.project_company_seach" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="Stylesheet" href="style/datePicker.css" type="text/css" />
<script type="text/javascript" src="js/jquery.core.js"></script>
<script type="text/javascript" src="js/jquery.datePicker.js"></script>
    <style type="text/css">
        .style1
        {
            font-size: medium;
            font-family: 华文楷体;
        }
        .style2
        {
            color: #FF0000;
        }
        .style6
        {
            font-size: large;
            font-family: 华文楷体;
        }
        .style7
        {
            font-weight: bold;
            color: #0000FF;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div class="SubMain">
    <img alt="" src="style/images/renmai.gif" />
    <div class="SubTop">
    <table style="width: 624px;">
        
        <tr>
        <td align="center">
               <br/><b><span class="style6">请输入工程相关单位企业名称中的<span class="style2">“关键字”</span>进行查询</span><span 
                   class="style1"><br/></span></b><br/><br/>
        </td>
        </tr>
        <tr>
        <td align="center" class="style1">
       
        试例一：“上海<span class="style2">建定</span>建设工程信息网” 则输入：<span class="style2">“建定”<br/>
            </span>
        试例二：“上海<span class="style2">第二</span>市政工程设备有限公司” 则输入：<span class="style2">“第二”</span><br/><br/>
                   <table><tr><td><span class="style7">公司关键字：</span></td><td><asp:TextBox ID="txtTitle" runat="server" 
                Width="130px" ForeColor="Red"></asp:TextBox>
            &nbsp;
            <asp:Button ID="btnSeach" runat="server" Text="点击查询" onclick="btnSeach_Click" 
                        Height="24px" Width="70px" /></td></tr></table>
        
                <asp:DropDownList ID="ddlClassWT" runat="server" Width="130px" 
                Visible="False"  >
                    </asp:DropDownList>
        
            <br />
        
        </td>
        </tr>
        <tr>
        <td align="center">
        注意：输入的“关键字”越短得到的查询结果越精确。<br /> <br />
            点击公司名称可查看该公司详细信息及人员列表。<br />
        </td>
        </tr>
    </table>
    </div>
    <div class="SubCenter">
       <asp:Image ID="ImgBg" runat="server" /><div class="subbody">
            <ul class="subbdul">
                <asp:Repeater ID="RepInfo" runat="server">
                <ItemTemplate>
                    <li class="<%#GetCompanystyle(Eval("pcid").ToString())%>"><span>[<%#Eval("cphone")%>]-[<%#Eval("cplace")%>]</span><a href="Companyinfo.aspx?Id=<%#Eval("pcid")%>" title="<%#Eval("company")%>"><%#LTP.Common.StringPlus.StrCut(Eval("company").ToString(), 60, "...")%></a></li>               
                </ItemTemplate>
                </asp:Repeater>
            </ul>                 
            
       </div>
       <div class="subfoot"></div>
       <uc1:ucfarpager ID="Pager" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:ucfarpager>
    </div>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>
